#include <iostream>

#include "parser.hpp"
#include "../lexer/tokens.hpp"

void Parser::parse() {

	std::vector<std::unique_ptr<BlueprintAST>> blueprintDecls;
	std::vector<std::unique_ptr<FunctionDeclAST>> functionDecls;
	std::vector<std::unique_ptr<PrintAST>> printStmts;

	while (lexer.getCurrentToken() != tok_eof) {
		if (lexer.getCurrentToken() == tok_print) {
			printStmts.push_back(parsePrint());
		} else if (lexer.getCurrentToken() == tok_blueprint) {
			blueprintDecls.push_back(parseBlueprint());
		} else if (lexer.getCurrentToken() == tok_function) {
			functionDecls.push_back(parseFunctionDecl());
		} else {
			std::cerr << "Unexpected token: " << lexer.getCurrentToken() << std::endl;
			break;
		}
	}

	for (const auto& blueprint : blueprintDecls) {
		for (const auto& otherBlueprint : blueprintDecls) {
			if (otherBlueprint.get() != blueprint.get() && otherBlueprint->getName() == blueprint->getName()) {
				std::cerr << "Duplicate blueprint declaration: " << blueprint->getName() << std::endl;
			}
		}
	}

	for (const auto& functionDecl : functionDecls) {
		for (const auto& otherFunction : functionDecls) {
			if (otherFunction.get() != functionDecl.get() && otherFunction->getFunctionName() == functionDecl->getFunctionName()) {
				std::cerr << "Duplicate function declaration: " << functionDecl->getFunctionName() << std::endl;
			}
		}

		for (const auto& blueprint : blueprintDecls) {
			if (blueprint->getName() == functionDecl->getFunctionName()) {
				std::cout << "Blueprint found for function: " << functionDecl->getFunctionName() << std::endl;
			}
		}
	}
}

std::unique_ptr<PrintAST> Parser::parsePrint() {
	lexer.getNextToken();
	auto value = parseExpression();
	return std::make_unique<PrintAST>(std::move(value));
}

std::unique_ptr<TypeAST> Parser::parseType() {
	if (lexer.getCurrentToken() == tok_i32) {
		lexer.getNextToken();
		return std::make_unique<TypeAST>(TypeAST::PrimitiveKind::INT32);
	} else if (lexer.getCurrentToken() == tok_bool) {
		lexer.getNextToken();
		return std::make_unique<TypeAST>(TypeAST::PrimitiveKind::BOOL);
	} else if (lexer.getCurrentToken() == tok_void) {
		lexer.getNextToken();
		return std::make_unique<TypeAST>(TypeAST::PrimitiveKind::VOID);
	} else {
		std::cerr << "Unknown type: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
}
