#include <fstream>

#include "lexer/lexer.hpp"

int main (int argc, char *argv[]) {

	if (argc < 2) {
		printf("Usage: %s <source-file>\n", argv[0]);
		return 1;
	}

	// Read the source file
	std::string sourceCode;
	{
		std::ifstream file(argv[1]);
		if (!file.is_open()) {
			printf("Error: Could not open file %s\n", argv[1]);
			return 1;
		}
		sourceCode.assign((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
	}

	// Initialize the lexer
	Lexer lexer(sourceCode);

	// Tokenize the source code
	int16_t token;
	while ((token = lexer.getNextToken()) != tok_eof) {
		printf("Token: %d\n", token);
		if (token == tok_integer_literal) {
			printf("  Integer Value: %ld\n", lexer.getIntegerValue());
		} else if (token == tok_true || token == tok_false) {
			printf("  Boolean Value: %s\n", lexer.getBoolValue() ? "true" : "false");
		} else if (token == tok_identifier) {
			printf("  Identifier Name: %s\n", lexer.getIdentifierName().c_str());
		}
	}

	return 0;
}
