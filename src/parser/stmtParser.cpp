#include <memory>

#include "parser.hpp"
#include "../ast/stmtAST.hpp"
#include "../logger.hpp"

std::unique_ptr<StmtAST> Parser::parseStatement() {
	switch (lexer.getCurrentToken()) {
		case '{':
			return parseBlockStatement();
		case tok_i32:
		case tok_bool:
			return parseVarDecl();
		case tok_identifier:
			return parseAssignment();
		case tok_if:
			return parseIfStatement();
		case tok_while:
			return parseWhileStatement();
		case tok_return:
			return parseReturnStatement();
		case tok_print:
			return parsePrintStatement();
		case tok_exit:
			return parseExitStatement();
		default:
			logger.errorf("Unexpected token in statement: %d\n", lexer.getCurrentToken());
			return nullptr;
	}
}

std::unique_ptr<BlockStmtAST> Parser::parseBlockStatement() {
	logger.debugln("Parsing block statement...");
	lexer.getNextToken();

	std::vector<std::unique_ptr<StmtAST>> statements;
	while (lexer.getCurrentToken() != '}') {
		auto stmt = parseStatement();
		if (stmt) {
			statements.push_back(std::move(stmt));
		} else {
			logger.errorln("Failed to parse statement in block");
			return nullptr;
		}
	}

	lexer.getNextToken();
	return std::make_unique<BlockStmtAST>(std::move(statements));
}

std::unique_ptr<VarDeclStmtAST> Parser::parseVarDecl() {
	logger.debugln("Parsing variable declaration...");
	if (lexer.getCurrentToken() != tok_i32 && lexer.getCurrentToken() != tok_bool) {
		logger.errorf("Expected type in variable declaration, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	auto type = parseType();

	if (lexer.getCurrentToken() != tok_identifier) {
		logger.errorf("Expected variable name in variable declaration, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	std::string varName = lexer.getIdentifierName();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '=') {
		logger.errorf("Expected '=' in variable declaration, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	auto initializer = parseExpression();

	if (lexer.getCurrentToken() != ';') {
		logger.errorf("Expected ';' after variable declaration, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<VarDeclStmtAST>(std::move(type), varName, std::move(initializer));
}

std::unique_ptr<AssignmentStmtAST> Parser::parseAssignment() {
	logger.debugln("Parsing assignment statement...");
	std::string varName = lexer.getIdentifierName();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '=') {
		logger.errorf("Expected '=' in assignment statement, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	auto value = parseExpression();

	if (lexer.getCurrentToken() != ';') {
		logger.errorf("Expected ';' after assignment statement, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<AssignmentStmtAST>(varName, std::move(value));
}

std::unique_ptr<IfStmtAST> Parser::parseIfStatement() {
	logger.debugln("Parsing if statement...");
	if (lexer.getCurrentToken() != tok_if) {
		logger.errorf("Expected 'if', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '(') {
		logger.errorf("Expected '(', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	auto condition = parseExpression();

	if (lexer.getCurrentToken() != ')') {
		logger.errorf("Expected ')', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	auto thenStmt = parseStatement();

	std::unique_ptr<StmtAST> elseStmt = nullptr;
	if (lexer.getCurrentToken() == tok_else) {
		lexer.getNextToken();
		elseStmt = parseStatement();
	}

	return std::make_unique<IfStmtAST>(std::move(condition), std::move(thenStmt), std::move(elseStmt));
}

std::unique_ptr<WhileStmtAST> Parser::parseWhileStatement() {
	logger.debugln("Parsing while statement...");
	if (lexer.getCurrentToken() != tok_while) {
		logger.errorf("Expected 'while', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '(') {
		logger.errorf("Expected '(', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	auto condition = parseExpression();

	if (lexer.getCurrentToken() != ')') {
		logger.errorf("Expected ')', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	auto body = parseStatement();
	return std::make_unique<WhileStmtAST>(std::move(condition), std::move(body));
}

std::unique_ptr<ReturnStmtAST> Parser::parseReturnStatement() {
	logger.debugln("Parsing return statement...");
	if (lexer.getCurrentToken() != tok_return) {
		logger.errorf("Expected 'return', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	if (lexer.getCurrentToken() == ';') {
		logger.debug("Parsing return statement with no value...\n");
		lexer.getNextToken();
		return std::make_unique<ReturnStmtAST>(nullptr);
	}
	auto value = parseExpression();

	if (lexer.getCurrentToken() != ';') {
		logger.errorf("Expected ';' after return statement, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<ReturnStmtAST>(std::move(value));
}

std::unique_ptr<PrintStmtAST> Parser::parsePrintStatement() {
	logger.debugln("Parsing print statement...\n");
	if (lexer.getCurrentToken() != tok_print) {
		logger.errorf("Expected 'print', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
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
		logger.errorf("Expected ';' after print statement, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<PrintStmtAST>(std::move(value));
}

std::unique_ptr<ExitStmtAST> Parser::parseExitStatement() {
	logger.debugln("Parsing exit statement...\n");
	if (lexer.getCurrentToken() != tok_exit) {
		logger.errorf("Expected 'exit', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '(') {
		logger.errorf("Expected '(' after 'exit', got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	auto value = parseExpression();

	if (lexer.getCurrentToken() != ')') {
		logger.errorf("Expected ')' after exit expression, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	if (lexer.getCurrentToken() != ';') {
		logger.errorf("Expected ';' after exit statement, got: %d\n", lexer.getCurrentToken());
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<ExitStmtAST>(std::move(value));
}

