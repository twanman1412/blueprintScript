#pragma once

#include "exprAST.hpp"
#include "programAST.hpp"
#include "stmtAST.hpp"

class FunctionCallAST: public ProgramAST {
	public:
		FunctionCallAST(const std::string &functionName, std::vector<std::unique_ptr<ExprAST>> arguments)
			: functionName(functionName), arguments(std::move(arguments)) {}
		~FunctionCallAST() = default;

		const std::string &getFunctionName() const { return functionName; }
		const std::vector<std::unique_ptr<ExprAST>> &getArguments() const { return arguments; }

	private:
		std::string functionName;
		std::vector<std::unique_ptr<ExprAST>> arguments;
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
