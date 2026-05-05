#include <memory>

#include "parser.hpp"
#include "../ast/blueprintAST.hpp"
#include "../logger.hpp"

std::unique_ptr<BlueprintAST> Parser::parseBlueprint() {
	lexer.getNextToken(); // consume 'blueprint'
	if (lexer.getCurrentToken() != tok_identifier) {
		logger.errorf("Expected blueprint name, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	std::string blueprintName = lexer.getIdentifierName();

	lexer.getNextToken();
	if (lexer.getCurrentToken() != '{') {
		logger.errorf("Expected '{' after blueprint name, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}

	logger.debugf("Parsing blueprint '%s'...\n", blueprintName.c_str());
	std::vector<std::unique_ptr<ContractAST>> contracts;
	while (lexer.getNextToken() != '}') {
		switch(lexer.getCurrentToken()) {
			case tok_input:
			case tok_output:
			case tok_requires:
			case tok_ensures:
			case tok_default:
				logger.debug("Parsing contract in blueprint...\n");
				contracts.push_back(parseContract());
				break;
			default:
				logger.errorf("Unexpected token in blueprint '%s': %d\n", blueprintName.c_str(), lexer.getCurrentToken());
				return nullptr;
		}
	}

	lexer.getNextToken(); // consume '}'
	logger.debugf("Finished parsing blueprint '%s'.\n", blueprintName.c_str());
	return std::make_unique<BlueprintAST>(blueprintName, std::move(contracts));
}


std::unique_ptr<ContractAST> Parser::parseContract() {
	switch(lexer.getCurrentToken()) {
		case tok_input: {
			logger.debug("Parsing 'input' contract...\n");
			lexer.getNextToken();
			if (lexer.getCurrentToken() != ':') {
				logger.errorf("Expected ':' after 'input', got: %d\n", lexer.getCurrentToken());
				return nullptr;
			}

			std::vector<InputAST::InputParam> params;
			lexer.getNextToken();

			// Parse parameter list (can be empty, or one or more "name: type" pairs)
			while (lexer.getCurrentToken() != ';') {
				if (lexer.getCurrentToken() != tok_identifier) {
					logger.errorf("Expected parameter name in 'input' contract, got: %d\n", lexer.getCurrentToken());
					return nullptr;
				}
				std::string paramName = lexer.getIdentifierName();
				lexer.getNextToken();

				if (lexer.getCurrentToken() != ':') {
					logger.errorf("Expected ':' after parameter name in 'input' contract, got: %d\n", lexer.getCurrentToken());
					return nullptr;
				}
				lexer.getNextToken();

				logger.debugf("Parsing type for input parameter '%s'...\n", paramName.c_str());
				auto paramType = parseType();
				if (!paramType) {
					return nullptr;
				}
				params.push_back(std::make_pair(paramName, std::move(paramType)));

				if (lexer.getCurrentToken() == ',') {
					lexer.getNextToken();
				} else if (lexer.getCurrentToken() != ';') {
					logger.errorf("Expected ',' or ';' after input parameter, got: %d\n", lexer.getCurrentToken());
					return nullptr;
				}
			}

			return std::make_unique<InputAST>(std::move(params));
		}
		case tok_output: {
			logger.debug("Parsing 'output' contract...\n");
			lexer.getNextToken();
			if (lexer.getCurrentToken() != ':') {
				logger.errorf("Expected ':' after 'output', got: %d\n", lexer.getCurrentToken());
				return nullptr;
			}
			lexer.getNextToken();
			auto t = parseType();
			return std::make_unique<OutputAST>(std::move(t));
		}
		case tok_requires: {
			logger.debug("Parsing 'requires' contract...\n");
			lexer.getNextToken();
			if (lexer.getCurrentToken() != ':') {
				logger.errorf("Expected ':' after 'requires', got: %d\n", lexer.getCurrentToken());
				return nullptr;
			}
			lexer.getNextToken();
			auto expr = parseExpression();
			return std::make_unique<RequiresAST>(std::move(expr));
		}
		case tok_ensures: {
			lexer.getNextToken();
			if (lexer.getCurrentToken() != ':') {
				logger.errorf("Expected ':' after 'ensures', got: %d\n", lexer.getCurrentToken());
				return nullptr;
			}
			lexer.getNextToken();
			auto expr = parseExpression();
			return std::make_unique<EnsuresAST>(std::move(expr));
		}
		case tok_default: {
			logger.debug("Parsing 'default' contract...\n");
			lexer.getNextToken();
			if (lexer.getCurrentToken() != ':') {
				logger.errorf("Expected ':' after 'default', got: %d\n", lexer.getCurrentToken());
				return nullptr;
			}
			lexer.getNextToken();

			logger.debugln("Parsing condition for 'default' contract...");
			auto condition = parseExpression();

			if (lexer.getCurrentToken() != tok_default_arrow) {
				logger.errorf("Expected '==>' after condition in 'default' contract, got: %d\n", lexer.getCurrentToken());
				return nullptr;
			}
			lexer.getNextToken();

			auto value = parseExpression();
			return std::make_unique<DefaultAST>(std::move(condition), std::move(value));
		}
		default:
            logger.errorf("Unexpected token in contract: %d\n", lexer.getCurrentToken());
			return nullptr;
	}
}
