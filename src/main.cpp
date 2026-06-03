#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <optional>
#include <unordered_map>

#include <llvm/IR/LegacyPassManager.h>
#include <llvm/IR/PassManager.h>
#include <llvm/MC/TargetRegistry.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/TargetParser/Host.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Target/TargetMachine.h>
#include <llvm/Target/TargetOptions.h>

#include "analysis/semanticValidator.hpp"
#include "analysis/willReturnInferer.hpp"
#include "codegen/codeGenVisitor.hpp"
#include "elaboration/elaborationPass.hpp"
#include "lexer/lexer.hpp"
#include "parser/parser.hpp"
#include "logger.hpp"
#include "ast/blueprintAST.hpp"

static std::string getOutputBase(const std::string& sourceFile) {
	auto lastSlash = sourceFile.find_last_of("/\\");
	auto dot = sourceFile.find_last_of('.');
	if (dot == std::string::npos || (lastSlash != std::string::npos && dot < lastSlash)) {
		return sourceFile;
	}
	return sourceFile.substr(0, dot);
}

int main (int argc, char *argv[]) {

	bool verbose = false;
	bool showHelp = false;
	bool emitLLVM = false;
	bool emitRaw = false;
	char sourceFile[256] = {0};
	bool enforceMode = false;
	bool optimiseMode = false;

	for (int i = 1; i < argc; ++i) {
		std::string arg = argv[i];
		if (arg == "-h" || arg == "--help") {
			showHelp = true;
		} else if (arg == "-v" || arg == "--verbose") {
			verbose = true;
		} else if (arg == "--emit-llvm") {
			emitLLVM = true;
		} else if (arg == "--emit-raw") {
			emitRaw = true;
		} else if (arg == "--mode=enforce") {
			if (optimiseMode) {
				printf("Error: Cannot specify both enforce and optimise modes.\n");
				return 1;
			}
			enforceMode = true;
		} else if (arg == "--mode=optimise") {
			if (enforceMode) {
				printf("Error: Cannot specify both enforce and optimise modes.\n");
				return 1;
			}
			optimiseMode = true;
		} else {
			if (sourceFile[0] != '\0') {
				printf("Error: Multiple source files specified. Only one is allowed.\n");
				return 1;
			}
			strcpy(sourceFile, argv[i]);
		}
	}

	if (argc < 2 || showHelp || sourceFile[0] == '\0') {
		printf("Usage: %s [options] <source-file>\n", argv[0]);
		printf("\t Options:\n");
		printf("\t\t -h, --help\t\t Show this help message\n");
		printf("\t\t -v, --verbose\t\t Enable verbose output\n");
		printf("\t\t --emit-llvm\t\t Emit LLVM IR (.ll)\n");
		printf("\t\t --mode=enforce\t\t Enforce mode (default)\n");
		printf("\t\t --mode=optimise\t Optimise mode\n");
		printf("\n");
		return 1;
	}

	logger.set_debug(verbose);
	logger.infof("Compiling source file: %s\n", sourceFile);
	logger.debug("Verbose mode enabled.\n");

	// Read the source file
	std::string sourceCode;
	{
		std::ifstream file(sourceFile);
		if (!file.is_open()) {
			printf("Error: Could not open file %s\n", sourceFile);
			return 1;
		}
		sourceCode.assign((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
	}

	Lexer lexer(sourceCode);
	Parser parser(lexer);
	auto AST = parser.parse();
	ElaborationPass elaboration;
	elaboration.elaborate(AST);

	SemanticValidator validator(logger);
	if (!validator.validate(AST)) {
		return 1;
	}

	CodeGenMode mode = CodeGenMode::Enforce;
	std::unordered_map<std::string, bool> willReturnMap;
	if (optimiseMode) {
		mode = CodeGenMode::Optimise;
		try {
			WillReturnInferer inferer;
			willReturnMap = inferer.infer(AST);
		} catch (const std::runtime_error& error) {
			logger.errorln(error.what());
			return 1;
		}
	}

	CodeGenVisitor codegen("blueprint_module", mode, std::move(willReturnMap));
	for (auto &node : AST) {
		if (!node) {
			logger.errorln("Error: Encountered empty AST node during codegen");
			return 1;
		}
		if (dynamic_cast<BlueprintAST*>(node.get())) {
			continue;
		}
		if (!node->accept(codegen)) {
			logger.errorln("Error: Code generation failed for a top level node");
			return 1;
		}
	}
	codegen.finalizeTopLevelFunction();

	auto *module = codegen.getModule();
	std::string outputBase = getOutputBase(sourceFile);

	// Emit un-optimised LLVM IR
	if (emitRaw) {
		std::string llvmPath = outputBase + ".raw.ll";
		std::error_code ec;
		llvm::raw_fd_ostream out(llvmPath, ec, llvm::sys::fs::OF_Text);
		if (ec) {
			logger.errorf("Error: Could not open output file %s: %s\n", llvmPath.c_str(), ec.message().c_str());
			return 1;
		}
		module->print(out, nullptr);
	}

	// Run the O3 optimization pipeline on the module.
	llvm::LoopAnalysisManager lam;
	llvm::FunctionAnalysisManager fam;
	llvm::CGSCCAnalysisManager cgam;
	llvm::ModuleAnalysisManager mam;
	llvm::PassBuilder passBuilder;
	passBuilder.registerModuleAnalyses(mam);
	passBuilder.registerCGSCCAnalyses(cgam);
	passBuilder.registerFunctionAnalyses(fam);
	passBuilder.registerLoopAnalyses(lam);
	passBuilder.crossRegisterProxies(lam, fam, cgam, mam);
	llvm::ModulePassManager mpm;
	mpm.addPass(passBuilder.buildPerModuleDefaultPipeline(llvm::OptimizationLevel::O3));
	mpm.run(*module, mam);

	std::string llvmPath = outputBase + ".ll";
	{
		std::error_code ec;
		llvm::raw_fd_ostream out(llvmPath, ec, llvm::sys::fs::OF_Text);
		if (ec) {
			logger.errorf("Error: Could not open output file %s: %s\n", llvmPath.c_str(), ec.message().c_str());
			return 1;
		}
		module->print(out, nullptr);
	}

	std::string clangCommand = "clang -O0 \"" + llvmPath + "\" -o \"" + outputBase + "\"";
	int clangResult = std::system(clangCommand.c_str());
	if (clangResult != 0) {
		logger.errorln("Error: clang failed to produce the executable");
		return 1;
	}

	if (!emitLLVM) {
		std::remove(llvmPath.c_str());
	}

	return 0;
}
