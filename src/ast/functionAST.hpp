#pragma once

#include <iostream>

#include "exprAST.hpp"
#include "programAST.hpp"
#include "stmtAST.hpp"

class PrintAST: public ProgramAST {
	public:
		PrintAST(std::unique_ptr<ExprAST> value) : value(std::move(value)) {}
		~PrintAST() = default;

		const ExprAST *getValue() const { return value.get(); }
		void printAST() const override { std::cout << "(Print "; value->printAST(); std::cout << ")"; }
		bool checkNode(AnalysisContext &ctx) override;
	private:
		std::unique_ptr<ExprAST> value;
};

class FunctionDeclAST: public ProgramAST {
	public:
		FunctionDeclAST(const std::string &functionName, std::unique_ptr<TypeAST> type, std::vector<std::pair<std::string, std::unique_ptr<TypeAST>>> parameters, std::unique_ptr<StmtAST> body)
			: functionName(functionName), type(std::move(type)), parameters(std::move(parameters)), body(std::move(body)) {}
		~FunctionDeclAST() = default;

		const std::string &getFunctionName() const { return functionName; }
		const TypeAST *getType() const { return type.get(); }
		const std::vector<std::pair<std::string, std::unique_ptr<TypeAST>>> &getParameters() const { return parameters; }
		const StmtAST *getBody() const { return body.get(); }
		void printAST() const override {
			std::cout << "(FunctionDecl " << functionName << ' ';
			if (type) type->printAST(); else std::cout << "(Type VOID)";
			std::cout << " (Params";
			for (const auto &p : parameters) {
				std::cout << ' ' << '(' << p.first << ' ';
				if (p.second) p.second->printAST();
				std::cout << ')';
			}
			std::cout << ") ";
			if (body) body->printAST(); else std::cout << "(Body)";
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::string functionName;
		std::unique_ptr<TypeAST> type;
		std::vector<std::pair<std::string, std::unique_ptr<TypeAST>>> parameters;
		std::unique_ptr<StmtAST> body;
};
