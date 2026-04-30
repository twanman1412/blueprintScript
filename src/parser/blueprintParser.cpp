#include <memory>
#include <iostream>

#include "parser.hpp"
#include "../ast/blueprintAST.hpp"

std::unique_ptr<BlueprintAST> Parser::parseBlueprint() {
	lexer.getNextToken();
	if (lexer.getCurrentToken() != tok_identifier) {
		std::cerr << "Expected blueprint name, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	std::string blueprintName = lexer.getIdentifierName();

	lexer.getNextToken();
	if (lexer.getCurrentToken() != '{') {
		std::cerr << "Expected '{' after blueprint name, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}

	std::vector<std::unique_ptr<ContractAST>> contracts;
	while (lexer.getNextToken() != '}') {
		switch(lexer.getCurrentToken()) {
			case tok_input:
			case tok_output:
			case tok_requires:
			case tok_ensures:
			case tok_default:
				contracts.push_back(parseContract());
				break;
			default:
				std::cerr << "Unexpected token in blueprint: " << lexer.getCurrentToken() << std::endl;
				return nullptr;
		}
	}

	return std::make_unique<BlueprintAST>(blueprintName, std::move(contracts));
}

std::unique_ptr<ContractAST> Parser::parseContract() {
	switch(lexer.getCurrentToken()) {
		case tok_input:
			return std::make_unique<InputAST>(parseType());
		case tok_output:
			return std::make_unique<OutputAST>(parseType());
		case tok_requires:
			return std::make_unique<RequiresAST>(parseExpression());
		case tok_ensures:
			return std::make_unique<EnsuresAST>(parseExpression());
		case tok_default: {
			auto condition = parseExpression();
			bool err = false;
			char conditionStr[4] = {0, 0, 0, '\0'};;
			if (lexer.getCurrentToken() != '=') {
				err = true;
				conditionStr[0] = lexer.getCurrentToken();
			}
			lexer.getNextToken();
			if (lexer.getCurrentToken() != '=') {
				err = true;
				conditionStr[1] = lexer.getCurrentToken();
			}
			lexer.getNextToken();
			if (lexer.getCurrentToken() != '>') {
				err = true;
				conditionStr[2] = lexer.getCurrentToken();
			}
			lexer.getNextToken();

			if (err) {
				std::cerr << "Expected '==>' in default contract, got: " << conditionStr << std::endl;
				return nullptr;
			}

			auto value = parseExpression();
			return std::make_unique<DefaultAST>(std::move(condition), std::move(value));
		}
		default:
			std::cerr << "Unexpected token in contract: " << lexer.getCurrentToken() << std::endl;
			return nullptr;
	}
}
