#include <memory>

#include "parser.hpp"
#include "../ast/exprAST.hpp"
#include "../logger.hpp"

int Parser::getTokenPrecedence() {
	auto tok = lexer.getCurrentToken();

	switch (tok) {
		case tok_logical_or:
			return 0;
		case tok_logical_and:
			return 10;
		case tok_eq:
		case tok_ne:
			return 20;
		case tok_le:
		case '<':
		case tok_ge:
		case '>':
			return 30;
		case '+':
		case '-':
			return 50;
		case '*':
		case '/':
		case '%':
			return 60;
		default:
			return -1;
	}
}

std::unique_ptr<ExprAST> Parser::parseExpression() {
	return parseBinaryExpression();
}

std::unique_ptr<ExprAST> Parser::parseBinaryExpression() {
	logger.debugln("Parsing expression left-hand side...");
	auto lhs = parseUnaryExpression();

	if (!lhs) {
		logger.errorln("Failed to parse left-hand side of expression");
		return nullptr;
	}

	logger.debugln("Parsing binary operator right-hand side...");
	return parseBinaryOpRHS(0, std::move(lhs));
}

std::unique_ptr<ExprAST> Parser::parseBinaryOpRHS(int exprPrecedence, std::unique_ptr<ExprAST> lhs) {
	logger.debugf("Parsing binary operator with precedence >= %d...\n", exprPrecedence);
	while (true) {
		int tokenPrecedence = getTokenPrecedence();

		if (tokenPrecedence < exprPrecedence) {
			return lhs;
		}

		int tok = lexer.getCurrentToken();
		lexer.getNextToken();

		BinaryExprAST::Operator binOp;
		switch (tok) {
			case '+': binOp = BinaryExprAST::PLUS; break;
			case '-': binOp = BinaryExprAST::MINUS; break;
			case '*': binOp = BinaryExprAST::MULTIPLY; break;
			case '/': binOp = BinaryExprAST::DIVIDE; break;
			case '%': binOp = BinaryExprAST::MODULO; break;
			case tok_eq: binOp = BinaryExprAST::EQUAL; break;
			case tok_ne: binOp = BinaryExprAST::NOT_EQUAL; break;
			case '<': binOp = BinaryExprAST::LESS_THAN; break;
			case tok_le: binOp = BinaryExprAST::LESS_EQUAL; break;
			case '>': binOp = BinaryExprAST::GREATER_THAN; break;
			case tok_ge: binOp = BinaryExprAST::GREATER_EQUAL; break;
			case tok_logical_and: binOp = BinaryExprAST::LOGICAL_AND; break;
			case tok_logical_or: binOp = BinaryExprAST::LOGICAL_OR; break;
			default:
				logger.errorf("Unknown binary operator token: %d\n", tok);
				return nullptr;
		}

		auto rhs = parseUnaryExpression();
		if (!rhs) {
			logger.errorln("Failed to parse right-hand side of binary operator");
			return nullptr;
		}

		int nextPrecedence = getTokenPrecedence();
		if (tokenPrecedence < nextPrecedence) {
			logger.debugln("Parsing right-hand side of binary operator with higher precedence...");
			rhs = parseBinaryOpRHS(tokenPrecedence + 1, std::move(rhs));
			if (!rhs) {
				return nullptr;
			}
		}

		lhs = std::make_unique<BinaryExprAST>(binOp, std::move(lhs), std::move(rhs));
	}
}

std::unique_ptr<ExprAST> Parser::parseUnaryExpression() {
	logger.debugln("Parsing unary expression...");
	if (lexer.getCurrentToken() == '-') {
		// consume '-'
		lexer.getNextToken();
		auto operand = parseUnaryExpression();
		if (!operand) {
			return nullptr;
		}

		return std::make_unique<UnaryExprAST>(UnaryExprAST::NEGATE, std::move(operand));
	}

	if (lexer.getCurrentToken() == '!') {
		// consume '!'
		lexer.getNextToken();
		auto operandNot = parseUnaryExpression();
		if (!operandNot) {
			return nullptr;
		}

		return std::make_unique<UnaryExprAST>(UnaryExprAST::NOT, std::move(operandNot));
	}

	return parsePrimaryExpression();
}

std::unique_ptr<ExprAST> Parser::parsePrimaryExpression() {
	logger.debugln("Parsing primary expression...");
	if (lexer.getCurrentToken() == tok_integer_literal) {
		logger.debugln("Parsing integer literal: " + std::to_string(lexer.getIntegerValue()));
		long long val = lexer.getIntegerValue();
		lexer.getNextToken();
		return std::make_unique<IntegerExprAST>(val);
	} 

	if (lexer.getCurrentToken() == tok_true || lexer.getCurrentToken() == tok_false) {
		logger.debugln("Parsing boolean literal: " + std::string(lexer.getCurrentToken() == tok_true ? "true" : "false"));
		bool val = (lexer.getCurrentToken() == tok_true);
		lexer.getNextToken();
		return std::make_unique<BoolExprAST>(val);
	} 

	if (lexer.getCurrentToken() == tok_identifier) {
		logger.debugln("Parsing identifier: " + lexer.getIdentifierName());
		std::string idName = lexer.getIdentifierName();
		// consume identifier token
		lexer.getNextToken();

		if (lexer.getCurrentToken() == '(') {
			// parse function call with known name
			return parseFunctionCallExpr(idName);
		}

		return std::make_unique<IdentifierExprAST>(idName);
	} 

	if (lexer.getCurrentToken() == '(') {
		logger.debugln("Parsing parenthesized expression...");
		lexer.getNextToken();
		auto expr = parseExpression();
		if (!expr) {
			return nullptr;
		}

		if (lexer.getCurrentToken() != ')') {
			logger.errorf("Expected ')' in expression, got: %d\n", lexer.getCurrentToken());
			return nullptr;
		}
		lexer.getNextToken();

		return expr;
	}

	logger.errorf("Unexpected token in primary expression: %d\n", lexer.getCurrentToken());
	return nullptr;
}

std::unique_ptr<FunctionCallExprAST> Parser::parseFunctionCallExpr(const std::string &functionName) {
	logger.debugf("Parsing function call expression for function '%s'...\n", functionName.c_str());
	// current token must be '('
	if (lexer.getCurrentToken() != '(') {
		logger.errorf("Expected '(' after function name, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	// consume '('
	lexer.getNextToken();

	std::vector<std::unique_ptr<ExprAST>> args;

	while (lexer.getCurrentToken() != ')') {
		auto arg = parseExpression();
		if (!arg) {
			return nullptr;
		}
		args.push_back(std::move(arg));

		if (lexer.getCurrentToken() == ',') {
			lexer.getNextToken();
			continue;
		} else if (lexer.getCurrentToken() != ')') {
			logger.errorf("Expected ',' or ')' in function call argument list, got: %d\n", lexer.getCurrentToken());
			return nullptr;
		}
	}

	if (lexer.getCurrentToken() != ')') {
		logger.errorf("Expected ')' at end of function call, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	// consume ')'
	lexer.getNextToken();

	return std::make_unique<FunctionCallExprAST>(functionName, std::move(args));
}

