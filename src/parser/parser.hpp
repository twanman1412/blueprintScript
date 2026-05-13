#pragma once

#include <memory>

#include "../lexer/lexer.hpp"
#include "../ast/exprAST.hpp"
#include "../ast/stmtAST.hpp"
#include "../ast/blueprintAST.hpp"
#include "../ast/functionAST.hpp"

class Parser {
	public:
		Parser(Lexer lexer) : lexer(std::move(lexer)) {}
		~Parser() = default;

		std::vector<std::unique_ptr<ProgramAST>> parse();
		int getTokenPrecedence();

		std::unique_ptr<PrintAST> parsePrint();

		std::unique_ptr<BlueprintAST> parseBlueprint();
		std::unique_ptr<ContractAST> parseContract();

		std::unique_ptr<ExprAST> parseExpression();
		std::unique_ptr<ExprAST> parseBinaryExpression();
		std::unique_ptr<ExprAST> parseBinaryOpRHS(int exprPrecedence, std::unique_ptr<ExprAST> lhs);
		std::unique_ptr<ExprAST> parseUnaryExpression();

		std::unique_ptr<ExprAST> parsePrimaryExpression();
		std::unique_ptr<FunctionCallExprAST> parseFunctionCallExpr(const std::string &functionName);
		std::unique_ptr<ExprAST> parseParenExpression();

		std::unique_ptr<FunctionDeclAST> parseFunctionDecl();

		std::unique_ptr<StmtAST> parseStatement();
		std::unique_ptr<BlockStmtAST> parseBlockStatement();
		std::unique_ptr<VarDeclStmtAST> parseVarDecl();
		std::unique_ptr<AssignmentStmtAST> parseAssignment();
		std::unique_ptr<IfStmtAST> parseIfStatement();
		std::unique_ptr<WhileStmtAST> parseWhileStatement();
		std::unique_ptr<ReturnStmtAST> parseReturnStatement();
		std::unique_ptr<PrintStmtAST> parsePrintStatement();
		std::unique_ptr<ExitStmtAST> parseExitStatement();

		std::unique_ptr<TypeAST> parseType();

	private:
		Lexer lexer;
};

