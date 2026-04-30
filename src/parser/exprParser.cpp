#include <iostream>
#include <memory>

#include "parser.hpp"
#include "../ast/exprAST.hpp"

int Parser::getTokenPrecedence() {
	if (lexer.getCurrentToken() == '|') {
		lexer.getNextToken();
		if (lexer.getCurrentToken() == '|') {
			return 0;
		}

		// '|' is not a valid operator, return -1
		return -1;
	}

	if (lexer.getCurrentToken() == '&') {
		lexer.getNextToken();
		if (lexer.getCurrentToken() == '&') {
			return 10;
		}

		// '&' is not a valid operator, return -1
		return -1;
	}

	if (lexer.getCurrentToken() == '!' || lexer.getCurrentToken() == '=') {
		lexer.getNextToken();
		if (lexer.getCurrentToken() == '=') {
			return 20;
		}
		
		// '!' or '=' is not a valid operator, return -1
		return -1;
	}

	if (lexer.getCurrentToken() == '<' || lexer.getCurrentToken() == '>') {
		lexer.getNextToken();
		if (lexer.getCurrentToken() == '=') {
			return 30;
		}
		
		return 40; // '<' or '>' operator
	}
	
	if (lexer.getCurrentToken() == '+' || lexer.getCurrentToken() == '-') {
		return 50;
	}

	if (lexer.getCurrentToken() == '*' || lexer.getCurrentToken() == '/' || lexer.getCurrentToken() == '%') {
		return 60;
	}

	return -1;
}

std::unique_ptr<ExprAST> Parser::parseExpression() {
	return parseBinaryExpression();
}

std::unique_ptr<ExprAST> Parser::parseBinaryExpression() {
	auto lhs = parseUnaryExpression();

	if (!lhs) {
		return nullptr;
	}

	return parseBinaryOpRHS(0, std::move(lhs));
}

std::unique_ptr<ExprAST> Parser::parseBinaryOpRHS(int exprPrecedence, std::unique_ptr<ExprAST> lhs) {
	while (true) {
		int tokenPrecedence = getTokenPrecedence();

		if (tokenPrecedence < exprPrecedence) {
			return lhs;
		}

		char binOp = lexer.getCurrentToken();
		lexer.getNextToken();

		auto rhs = parseUnaryExpression();
		if (!rhs) {
			return nullptr;
		}

		int nextPrecedence = getTokenPrecedence();
		if (tokenPrecedence < nextPrecedence) {
			rhs = parseBinaryOpRHS(tokenPrecedence + 1, std::move(rhs));
			if (!rhs) {
				return nullptr;
			}
		}

		lhs = std::make_unique<BinaryExprAST>(binOp, std::move(lhs), std::move(rhs));
	}
}

std::unique_ptr<ExprAST> Parser::parseUnaryExpression() {
	if (lexer.getCurrentToken() == '-') {
		auto operand = parseUnaryExpression();
		if (!operand) {
			return nullptr;
		}

		return std::make_unique<UnaryExprAST>(UnaryExprAST::NEGATE, std::move(operand));
	} 

	if (lexer.getCurrentToken() == '!') {
		auto operandNot = parseUnaryExpression();
		if (!operandNot) {
			return nullptr;
		}

		return std::make_unique<UnaryExprAST>(UnaryExprAST::NOT, std::move(operandNot)); }

	return parsePrimaryExpression();
}

std::unique_ptr<ExprAST> Parser::parsePrimaryExpression() {
	if (lexer.getCurrentToken() == tok_integer_literal) {
		return std::make_unique<IntegerExprAST>(lexer.getIntegerValue());
	} 

	if (lexer.getCurrentToken() == tok_true || lexer.getCurrentToken() == tok_false) {
		return std::make_unique<BoolExprAST>(lexer.getCurrentToken() == tok_true);
	} 

	if (lexer.getCurrentToken() == tok_identifier) {
		std::string idName = lexer.getIdentifierName();
		lexer.getNextToken();

		if (lexer.getCurrentToken() == '(') {
			lexer.ungetCurrentToken();
			return parseFunctionCallExpr();
		}

		return std::make_unique<IdentifierExprAST>(idName);
	} 

	if (lexer.getCurrentToken() == '(') {
		auto expr = parseExpression();
		if (!expr) {
			return nullptr;
		}

		if (lexer.getCurrentToken() != ')') {
			std::cerr << "Expected ')' in expression" << std::endl;
			return nullptr;
		}
		lexer.getNextToken();

		return expr;
	}

	std::cerr << "Unknown token when expecting an expression: " << lexer.getCurrentToken() << std::endl;
	return nullptr;
}

std::unique_ptr<FunctionCallExprAST> Parser::parseFunctionCallExpr() {
	if (lexer.getCurrentToken() != tok_identifier) {
		std::cerr << "Expected function name in function call, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	std::string functionName = lexer.getIdentifierName();
	lexer.getNextToken();

	std::vector<std::unique_ptr<ExprAST>> args;

	while (lexer.getCurrentToken() != ')') {
		auto arg = parseExpression();
		if (!arg) {
			return nullptr;
		}
		args.push_back(std::move(arg));

		if (lexer.getCurrentToken() != ',') {
			std::cerr << "Expected ',' in argument list" << std::endl;
			return nullptr;
		}
		lexer.getNextToken();
	}

	if (lexer.getCurrentToken() != ')') {
		std::cerr << "Expected ')' in function call" << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<FunctionCallExprAST>(functionName, std::move(args));
}

