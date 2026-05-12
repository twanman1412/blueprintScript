#include "parser.hpp"
#include "../lexer/tokens.hpp"
#include "../logger.hpp"

#include <cstdlib>

std::vector<std::unique_ptr<ProgramAST>> Parser::parse() {
	// Initialize the lexer to get the first token
	lexer.getNextToken();
	logger.debugln("Starting parsing process...");

	std::vector<std::unique_ptr<ProgramAST>> astNodes;

	while (lexer.getCurrentToken() != tok_eof) {
		std::unique_ptr<ProgramAST> node;
		if (lexer.getCurrentToken() == tok_print) {
			logger.debugln("Parsing top level print statement...");
			node = parsePrint();
		} else if (lexer.getCurrentToken() == tok_blueprint) {
			logger.debugln("Parsing blueprint...");
			node = parseBlueprint();
		} else if (lexer.getCurrentToken() == tok_function) {
			logger.debugln("Parsing function declaration...");
			node = parseFunctionDecl();
		} else {
			logger.errorf("Unexpected token: %d\n", lexer.getCurrentToken());
			std::exit(1);
		}

		if (!node) {
			logger.errorln("Error: Failed to parse top level statement");
			std::exit(1);
		}

		astNodes.push_back(std::move(node));
	}

	logger.debugln("Finished parsing process.");
	return astNodes;
}

std::unique_ptr<PrintAST> Parser::parsePrint() {
	logger.debugln("Parsing top level print statement...");
	lexer.getNextToken();
	if (lexer.getCurrentToken() != '(') {
		logger.errorf("Expected '(' after 'print', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	auto value = parseExpression();
	if (lexer.getCurrentToken() != ')') {
		logger.errorf("Expected ')' after print expression, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();
	if (lexer.getCurrentToken() != ';') {
		logger.errorf("Expected ';' after top level print statement, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();
	logger.debugln("Finished parsing print statement.");
	return std::make_unique<PrintAST>(std::move(value));
}

std::unique_ptr<TypeAST> Parser::parseType() {
	logger.debugln("Parsing type...");
	if (lexer.getCurrentToken() == tok_i32) {
		lexer.getNextToken();
		logger.debugln("Finished parsing type: int32");
		return std::make_unique<TypeAST>(TypeAST::PrimitiveKind::INT32);
	} else if (lexer.getCurrentToken() == tok_bool) {
		lexer.getNextToken();
		logger.debugln("Finished parsing type: bool");
		return std::make_unique<TypeAST>(TypeAST::PrimitiveKind::BOOL);
	} else if (lexer.getCurrentToken() == tok_void) {
		lexer.getNextToken();
		logger.debugln("Finished parsing type: void");
		return std::make_unique<TypeAST>(TypeAST::PrimitiveKind::VOID);
	} else {
		logger.errorf("Unexpected token while parsing type: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
}
