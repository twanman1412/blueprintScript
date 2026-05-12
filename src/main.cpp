#include <cstdlib>
#include <cstring>
#include <fstream>
#include <optional>

#include <llvm/IR/LegacyPassManager.h>
#include <llvm/MC/TargetRegistry.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/TargetParser/Host.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Target/TargetMachine.h>
#include <llvm/Target/TargetOptions.h>

#include "analysis/semanticValidator.hpp"
#include "codegen/codeGenVisitor.hpp"
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
	bool emitBin = false;
	bool emitAsm = false;
	bool emitLLVM = false;
	char sourceFile[256] = {0};

	for (int i = 1; i < argc; ++i) {
		std::string arg = argv[i];
		if (arg == "-h" || arg == "--help") {
			showHelp = true;
		} else if (arg == "-v" || arg == "--verbose") {
			verbose = true;
		} else if (arg == "--emit-bin") {
			emitBin = true;
		} else if (arg == "--emit-asm") {
			emitAsm = true;
		} else if (arg == "--emit-llvm") {
			emitLLVM = true;
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
		printf("\t\t --emit-bin\t\t Emit object file (.o)\n");
		printf("\t\t --emit-asm\t\t Emit assembly (.s)\n");
		printf("\t\t --emit-llvm\t\t Emit LLVM IR (.ll)\n");
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

	SemanticValidator validator(logger);
	if (!validator.validate(AST)) {
		return 1;
	}

	CodeGenVisitor codegen("blueprint_module");
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

	if (emitLLVM) {
		std::string outputPath = outputBase + ".ll";
		std::error_code ec;
		llvm::raw_fd_ostream out(outputPath, ec, llvm::sys::fs::OF_None);
		if (ec) {
			llvm::errs() << "Error: Could not write to " << outputPath << ": " << ec.message() << "\n";
			return 1;
		}
		module->print(out, nullptr);
	}

	llvm::InitializeNativeTarget();
	llvm::InitializeNativeTargetAsmPrinter();
	llvm::InitializeNativeTargetAsmParser();

	llvm::Triple targetTriple(llvm::sys::getDefaultTargetTriple());
	module->setTargetTriple(targetTriple);

	std::string error;
	const llvm::Target* target = llvm::TargetRegistry::lookupTarget(targetTriple, error);
	if (!target) {
		llvm::errs() << "Error: " << error << "\n";
		return 1;
	}

	llvm::TargetOptions options;
	std::optional<llvm::Reloc::Model> relocModel;
	auto targetMachine = std::unique_ptr<llvm::TargetMachine>(
		target->createTargetMachine(targetTriple, "generic", "", options, relocModel)
	);
	module->setDataLayout(targetMachine->createDataLayout());

	auto emitFile = [&](llvm::CodeGenFileType fileType, const std::string& path) -> bool {
		std::error_code ec;
		llvm::raw_fd_ostream dest(path, ec, llvm::sys::fs::OF_None);
		if (ec) {
			llvm::errs() << "Error: Could not write to " << path << ": " << ec.message() << "\n";
			return false;
		}
		llvm::legacy::PassManager pass;
		if (targetMachine->addPassesToEmitFile(pass, dest, nullptr, fileType)) {
			llvm::errs() << "Error: Target machine cannot emit file type\n";
			return false;
		}
		pass.run(*module);
		return true;
	};

	std::string objectPath = outputBase + ".o";
	if (!emitFile(llvm::CodeGenFileType::ObjectFile, objectPath)) {
		return 1;
	}

	if (emitAsm) {
		std::string outputPath = outputBase + ".s";
		if (!emitFile(llvm::CodeGenFileType::AssemblyFile, outputPath)) {
			return 1;
		}
	}

	std::string exePath = outputBase;
	std::string linkCmd = "cc -no-pie -o \"" + exePath + "\" \"" + objectPath + "\"";
	if (std::system(linkCmd.c_str()) != 0) {
		llvm::errs() << "Error: Failed to link executable\n";
		return 1;
	}

	if (!emitBin) {
		llvm::sys::fs::remove(objectPath);
	}

	if (verbose) {
		for (const auto &node : AST) {
			node->printAST();
		}
	}

	return 0;
}
