#pragma once

#include "exprAST.hpp"
#include "programAST.hpp"
#include "stmtAST.hpp"

class PrintAST: public ProgramAST {
	public:
		PrintAST(std::unique_ptr<ExprAST> value) : value(std::move(value)) {}
		~PrintAST() = default;

		const ExprAST *getValue() const { return value.get(); }
	private:
		std::unique_ptr<ExprAST> value;
};

class FunctionDeclAST: public ProgramAST {
	public:
		FunctionDeclAST(const std::string &functionName, std::vector<std::unique_ptr<VarDeclStmtAST>> parameters, std::unique_ptr<StmtAST> body)
			: functionName(functionName), parameters(std::move(parameters)), body(std::move(body)) {}
		~FunctionDeclAST() = default;

		const std::string &getFunctionName() const { return functionName; }
		const std::vector<std::unique_ptr<VarDeclStmtAST>> &getParameters() const { return parameters; }
		const StmtAST *getBody() const { return body.get(); }

	private:
		std::string functionName;
		std::vector<std::unique_ptr<VarDeclStmtAST>> parameters;
		std::unique_ptr<StmtAST> body;
};
