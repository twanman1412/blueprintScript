#include <iostream>
#include <memory>

#include "parser.hpp"
#include "../ast/stmtAST.hpp"

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
		default:
			std::cerr << "Unexpected token in statement: " << lexer.getCurrentToken() << std::endl;
			return nullptr;
	}
}

std::unique_ptr<BlockStmtAST> Parser::parseBlockStatement() {
	lexer.getNextToken();

	std::vector<std::unique_ptr<StmtAST>> statements;
	while (lexer.getCurrentToken() != '}') {
		auto stmt = parseStatement();
		if (stmt) {
			statements.push_back(std::move(stmt));
		} else {
			std::cerr << "Failed to parse statement in block" << std::endl;
			return nullptr;
		}
	}

	lexer.getNextToken();
	return std::make_unique<BlockStmtAST>(std::move(statements));
}

std::unique_ptr<VarDeclStmtAST> Parser::parseVarDecl() {
	if (lexer.getCurrentToken() != tok_i32 && lexer.getCurrentToken() != tok_bool) {
		std::cerr << "Expected type in variable declaration, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	auto type = parseType();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != tok_identifier) {
		std::cerr << "Expected variable name, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	std::string varName = lexer.getIdentifierName();
	lexer.getNextToken();

	if (lexer.getCurrentToken() == '=') {
		std::cerr << "Unitialized variable declaration for variable: " << varName << std::endl;
		return nullptr;
	}

	auto initializer = parseExpression();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != ';') {
		std::cerr << "Expected ';' after variable declaration, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<VarDeclStmtAST>(std::move(type), varName, std::move(initializer));
}

std::unique_ptr<AssignmentStmtAST> Parser::parseAssignment() {
	std::string varName = lexer.getIdentifierName();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '=') {
		std::cerr << "Expected '=' in assignment, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	auto value = parseExpression();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != ';') {
		std::cerr << "Expected ';' after assignment, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<AssignmentStmtAST>(varName, std::move(value));
}

std::unique_ptr<IfStmtAST> Parser::parseIfStatement() {
	if (lexer.getCurrentToken() != tok_if) {
		std::cerr << "Expected 'if', got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '(') {
		std::cerr << "Expected '(', got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	auto condition = parseExpression();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != ')') {
		std::cerr << "Expected ')', got: " << lexer.getCurrentToken() << std::endl;
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
	if (lexer.getCurrentToken() != tok_while) {
		std::cerr << "Expected 'while', got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	if (lexer.getCurrentToken() != '(') {
		std::cerr << "Expected '(', got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	auto condition = parseExpression();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != ')') {
		std::cerr << "Expected ')', got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	auto body = parseStatement();
	return std::make_unique<WhileStmtAST>(std::move(condition), std::move(body));
}

std::unique_ptr<ReturnStmtAST> Parser::parseReturnStatement() {
	if (lexer.getCurrentToken() != tok_return) {
		std::cerr << "Expected 'return', got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	auto value = parseExpression();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != ';') {
		std::cerr << "Expected ';' after return statement, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<ReturnStmtAST>(std::move(value));
}

std::unique_ptr<PrintStmtAST> Parser::parsePrintStatement() {
	if (lexer.getCurrentToken() != tok_print) {
		std::cerr << "Expected 'print', got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	auto value = parseExpression();
	lexer.getNextToken();

	if (lexer.getCurrentToken() != ';') {
		std::cerr << "Expected ';' after print statement, got: " << lexer.getCurrentToken() << std::endl;
		return nullptr;
	}
	lexer.getNextToken();

	return std::make_unique<PrintStmtAST>(std::move(value));
}

