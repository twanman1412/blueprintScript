#include <memory>

#include "parser.hpp"
#include "../ast/functionAST.hpp"
#include "../logger.hpp"

std::unique_ptr<FunctionDeclAST> Parser::parseFunctionDecl() {
	logger.debug("Parsing function declaration...\n");
	lexer.getNextToken(); // consume 'function'

	if (lexer.getCurrentToken() != tok_i32 && lexer.getCurrentToken() != tok_bool && lexer.getCurrentToken() != tok_void) {
		logger.errorf("Expected return type for function declaration, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	auto returnType = parseType();

	if (lexer.getCurrentToken() != tok_identifier) {
		logger.errorf("Expected function name, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	std::string functionName = lexer.getIdentifierName();
	lexer.getNextToken();

	logger.debugf("Parsing function '%s'\n", functionName.c_str());
	if (lexer.getCurrentToken() != '(') {
		logger.errorf("Expected '(' after function name, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	logger.debugf("Parsing parameters for function '%s'...\n", functionName.c_str());
	std::vector<std::pair<std::string, std::unique_ptr<TypeAST>>> parameters;
	while (lexer.getCurrentToken() != ')') {
		if (lexer.getCurrentToken() != tok_i32 && lexer.getCurrentToken() != tok_bool) {
			logger.errorf("Expected parameter type in function declaration, got: %d\n", lexer.getCurrentToken());
			return nullptr;
		}
		auto paramType = parseType();

		if (lexer.getCurrentToken() != tok_identifier) {
			logger.errorf("Expected parameter name in function declaration, got: %d\n", lexer.getCurrentToken());
			return nullptr;
		}
		std::string paramName = lexer.getIdentifierName();
		logger.debugf("Parsed parameter '%s'\n", paramName.c_str());
		lexer.getNextToken();

		parameters.emplace_back(paramName, std::move(paramType));
		if (lexer.getCurrentToken() == ',') {
			lexer.getNextToken();
		} else if (lexer.getCurrentToken() != ')') {
			logger.errorf("Expected ',' or ')' after parameter in function declaration, got: %d\n", lexer.getCurrentToken());
			return nullptr;
		}
	}
	lexer.getNextToken();

	auto body = parseStatement();

	return std::make_unique<FunctionDeclAST>(functionName, std::move(returnType), std::move(parameters), std::move(body));
}
