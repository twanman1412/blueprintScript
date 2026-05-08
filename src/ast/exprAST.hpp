#pragma once

#include <iostream>
#include <string>
#include <memory>
#include <vector>
#include <ostream>

class AnalysisContext;

class ExprAST {
	public:
		virtual ~ExprAST() = default;
		virtual void printAST() const = 0;
		virtual bool checkNode(AnalysisContext &ctx) = 0;
};

class IntegerExprAST : public ExprAST {
	public:
		IntegerExprAST(long long value) : value(value) {}
		long long getValue() const { return value; }
		void printAST() const override { std::cout << "(IntegerExpr " << value << ")"; }
		bool checkNode(AnalysisContext &ctx) override;
	private:
		long long value;
};

class BoolExprAST : public ExprAST {
	public:
		BoolExprAST(bool value) : value(value) {}
		bool getValue() const { return value; }
		void printAST() const override { std::cout << "(BoolExpr " << (value ? "true" : "false") << ")"; }
		bool checkNode(AnalysisContext &ctx) override;
	private:
		bool value;
};

class IdentifierExprAST : public ExprAST {
	public:
		IdentifierExprAST(const std::string &name) : name(name) {}
		const std::string &getName() const { return name; }
		void printAST() const override { std::cout << "(Identifier " << name << ")"; }
		bool checkNode(AnalysisContext &ctx) override;
	private:
		std::string name;
};

class FunctionCallExprAST : public ExprAST {
	public:
		FunctionCallExprAST(const std::string &functionName, std::vector<std::unique_ptr<ExprAST>> arguments)
			: functionName(functionName), arguments(std::move(arguments)) {}
		~FunctionCallExprAST() = default;

		const std::string &getFunctionName() const { return functionName; }
		const std::vector<std::unique_ptr<ExprAST>> &getArguments() const { return arguments; }
		void printAST() const override {
			std::cout << "(FunctionCall " << functionName;
			for (const auto &arg : arguments) { std::cout << ' '; arg->printAST(); }
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;
	private:    
		std::string functionName;
		std::vector<std::unique_ptr<ExprAST>> arguments;
};

class BinaryExprAST : public ExprAST {
	public:

		enum Operator {
			PLUS,
			MINUS,
			MULTIPLY,
			DIVIDE,
			MODULO,
			EQUAL,
			NOT_EQUAL,
			LESS_THAN,
			LESS_EQUAL,
			GREATER_THAN,
			GREATER_EQUAL,
			LOGICAL_AND,
			LOGICAL_OR,
		};


		BinaryExprAST(Operator op, std::unique_ptr<ExprAST> lhs, std::unique_ptr<ExprAST> rhs)
			: op(op), lhs(std::move(lhs)), rhs(std::move(rhs)) {}

		Operator getOp() const { return op; }
		ExprAST *getLHS() const { return lhs.get(); }
		ExprAST *getRHS() const { return rhs.get(); }
		void printAST() const override {
			const char *ops[] = {"+","-","*","/","%","==","!=","<","<=",">",">=","&&","||"};
			const char *opstr = (static_cast<int>(op) >= 0 && static_cast<int>(op) < (int)(sizeof(ops)/sizeof(ops[0]))) ? ops[static_cast<int>(op)] : "?";
			std::cout << "(BinaryExpr " << opstr << ' ';
			lhs->printAST();
			std::cout << ' ';
			rhs->printAST();
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		Operator op;
		std::unique_ptr<ExprAST> lhs;
		std::unique_ptr<ExprAST> rhs;
};

class UnaryExprAST : public ExprAST {
	public:
		enum Operator {
			NEGATE,
			NOT,
		};

		UnaryExprAST(Operator op, std::unique_ptr<ExprAST> operand)
			: op(op), operand(std::move(operand)) {}

		Operator getOp() const { return op; }
		ExprAST *getOperand() const { return operand.get(); }
		void printAST() const override {
			const char *ops[] = {"-","!"};
			const char *opstr = (static_cast<int>(op) >= 0 && static_cast<int>(op) < (int)(sizeof(ops)/sizeof(ops[0]))) ? ops[static_cast<int>(op)] : "?";
			std::cout << "(UnaryExpr " << opstr << ' ';
			operand->printAST();
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		Operator op;
		std::unique_ptr<ExprAST> operand;
};

