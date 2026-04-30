#pragma once

#include "exprAST.hpp"
#include "programAST.hpp"
#include "stmtAST.hpp"

class MethodCallAST: public ProgramAST {
	public:
		MethodCallAST(const std::string &methodName, std::vector<std::unique_ptr<ExprAST>> arguments)
			: methodName(methodName), arguments(std::move(arguments)) {}
		~MethodCallAST() = default;

		const std::string &getMethodName() const { return methodName; }
		const std::vector<std::unique_ptr<ExprAST>> &getArguments() const { return arguments; }

	private:
		std::string methodName;
		std::vector<std::unique_ptr<ExprAST>> arguments;
};

class MethodDeclAST: public ProgramAST {
	public:
		MethodDeclAST(const std::string &methodName, std::vector<std::unique_ptr<VarDeclStmtAST>> parameters, std::unique_ptr<StmtAST> body)
			: methodName(methodName), parameters(std::move(parameters)), body(std::move(body)) {}
		~MethodDeclAST() = default;

		const std::string &getMethodName() const { return methodName; }
		const std::vector<std::unique_ptr<VarDeclStmtAST>> &getParameters() const { return parameters; }
		const StmtAST *getBody() const { return body.get(); }

	private:
		std::string methodName;
		std::vector<std::unique_ptr<VarDeclStmtAST>> parameters;
		std::unique_ptr<StmtAST> body;
};
