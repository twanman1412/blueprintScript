#include <cstring>
#include <fstream>

#include "lexer/lexer.hpp"
#include "parser/parser.hpp"
#include "logger.hpp"

int main (int argc, char *argv[]) {

	bool verbose = false;
	bool showHelp = false;
	char sourceFile[256] = {0};

	for (int i = 1; i < argc; ++i) {
		std::string arg = argv[i];
		if (arg == "-h" || arg == "--help") {
			showHelp = true;
		} else if (arg == "-v" || arg == "--verbose") {
			verbose = true;
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
	const auto AST = parser.parse();

	if (!verbose) return 0;
	for (const auto &node : AST) {
		node->printAST();
	}

	return 0;
}
