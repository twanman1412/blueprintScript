#include <iostream>
#include <memory>

#include "parser.hpp"
#include "../ast/functionAST.hpp"

std::unique_ptr<FunctionDeclAST> Parser::parseFunctionDecl() {
	lexer.getNextToken();

	if (lexer.getCurrentToken() != tok_i32 && lexer.getCurrentToken() != tok_bool && lexer.getCurrentToken() != tok_void) {
		std::cerr << "Expected return type for function declaration, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	auto returnType = parseType();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != tok_identifier) {
		std::cerr << "Expected function name, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	std::string functionName = lexer.getIdentifierName();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '(') {
		std::cerr << "Expected '(', got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	std::vector<std::pair<std::string, std::unique_ptr<TypeAST>>> parameters;
	while (lexer.getCurrentToken() != ')') {
		if (lexer.getCurrentToken() != tok_i32 && lexer.getCurrentToken() != tok_bool) {
			std::cerr << "Expected parameter type, got: " << lexer.getCurrentToken() << std::endl;
			return nullptr;
		}
		auto paramType = parseType();
		lexer.getNextToken();

		if (lexer.getCurrentToken() != tok_identifier) {
			std::cerr << "Expected parameter name, got: " << lexer.getCurrentToken() << std::endl;
			return nullptr;
		}
		std::string paramName = lexer.getIdentifierName();
		lexer.getNextToken();

		parameters.emplace_back(paramName, std::move(paramType));
		if (lexer.getCurrentToken() == ',') {
			lexer.getNextToken();
		} else if (lexer.getCurrentToken() != ')') {
			std::cerr << "Expected ',' or ')', got: " << lexer.getCurrentToken() << std::endl;
			return nullptr;
		}
	}
	lexer.getNextToken();

	auto body = parseStatement();

	return std::make_unique<FunctionDeclAST>(functionName, std::move(returnType), std::move(parameters), std::move(body));
}
