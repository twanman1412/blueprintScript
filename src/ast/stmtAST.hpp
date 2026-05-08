#pragma once

#include <memory>
#include <string>
#include <vector>

#include "commonAST.hpp"
#include "exprAST.hpp"

class AnalysisContext;

class StmtAST {
	public:
		virtual ~StmtAST() = default;
		virtual void printAST() const = 0;
	virtual bool checkNode(AnalysisContext &ctx) { (void)ctx; return true; }
};

class BlockStmtAST : public StmtAST {
	public:
		BlockStmtAST(std::vector<std::unique_ptr<StmtAST>> statements)
			: statements(std::move(statements)) {}

		const std::vector<std::unique_ptr<StmtAST>> &getStatements() const { return statements; }
		void printAST() const override {
			std::cout << "(Block";
			for (const auto &s : statements) { std::cout << ' '; s->printAST(); }
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::vector<std::unique_ptr<StmtAST>> statements;
};

class VarDeclStmtAST : public StmtAST {
	public:
		VarDeclStmtAST(std::unique_ptr<TypeAST> type, const std::string &name, std::unique_ptr<ExprAST> initializer)
			: type(std::move(type)), name(name), initializer(std::move(initializer)) {}

		const TypeAST *getType() const { return type.get(); }
		const std::string &getName() const { return name; }
		ExprAST *getInitializer() const { return initializer.get(); }
		void printAST() const override {
			std::cout << "(VarDecl ";
			type->printAST();
			std::cout << ' ' << name;
			if (initializer) { std::cout << ' '; initializer->printAST(); }
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<TypeAST> type;
		std::string name;
		std::unique_ptr<ExprAST> initializer;
};

class AssignmentStmtAST : public StmtAST {
	public:
		AssignmentStmtAST(const std::string &name, std::unique_ptr<ExprAST> value)
			: name(name), value(std::move(value)) {}

		const std::string &getName() const { return name; }
		ExprAST *getValue() const { return value.get(); }
		void printAST() const override {
			std::cout << "(Assignment " << name << ' ';
			value->printAST();
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::string name;
		std::unique_ptr<ExprAST> value;
};

class IfStmtAST : public StmtAST {
	public:
		IfStmtAST(std::unique_ptr<ExprAST> condition, 
				std::unique_ptr<StmtAST> thenStmt,
				std::unique_ptr<StmtAST> elseStmt = nullptr)
			: condition(std::move(condition)), thenStmt(std::move(thenStmt)), elseStmt(std::move(elseStmt)) {}

		ExprAST *getCondition() const { return condition.get(); }
		StmtAST *getThenStmt() const { return thenStmt.get(); }
		StmtAST *getElseStmt() const { return elseStmt.get(); }
		void printAST() const override {
			std::cout << "(If ";
			condition->printAST();
			std::cout << ' ';
			thenStmt->printAST();
			if (elseStmt) { std::cout << ' '; elseStmt->printAST(); }
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<ExprAST> condition;
		std::unique_ptr<StmtAST> thenStmt;
		std::unique_ptr<StmtAST> elseStmt;
};

class WhileStmtAST : public StmtAST {
	public:
		WhileStmtAST(std::unique_ptr<ExprAST> condition, std::unique_ptr<StmtAST> body)
			: condition(std::move(condition)), body(std::move(body)) {}

		ExprAST *getCondition() const { return condition.get(); }
		StmtAST *getBody() const { return body.get(); }
		void printAST() const override {
			std::cout << "(While ";
			condition->printAST();
			std::cout << ' ';
			body->printAST();
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<ExprAST> condition;
		std::unique_ptr<StmtAST> body;
};

class ReturnStmtAST : public StmtAST {
	public:
		ReturnStmtAST(std::unique_ptr<ExprAST> value)
			: value(std::move(value)) {}

		ExprAST *getValue() const { return value.get(); }
		void printAST() const override {
			std::cout << "(Return ";
			if (value) value->printAST();
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<ExprAST> value;
};


class ExprStmtAST : public StmtAST {
	public:
		ExprStmtAST(std::unique_ptr<ExprAST> expr)
			: expr(std::move(expr)) {}

		ExprAST *getExpr() const { return expr.get(); }
		void printAST() const override { std::cout << "(ExprStmt "; expr->printAST(); std::cout << ")"; }
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<ExprAST> expr;
};


class PrintStmtAST : public StmtAST {
	public:
		PrintStmtAST(std::unique_ptr<ExprAST> expr)
			: expr(std::move(expr)) {}

		ExprAST *getExpr() const { return expr.get(); }
		void printAST() const override { std::cout << "(PrintStmt "; expr->printAST(); std::cout << ")"; }
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<ExprAST> expr;
};
