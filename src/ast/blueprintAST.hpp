#pragma once

#include <string>
#include <vector>

#include "commonAST.hpp"
#include "exprAST.hpp"
#include "programAST.hpp"
#include "stmtAST.hpp"

class AnalysisContext;

class ContractAST {
	public:
		ContractAST() = default;
		~ContractAST() = default;
		virtual void printAST() const = 0;
		virtual bool checkNode(AnalysisContext &ctx) { (void)ctx; return true; }
};

class InputAST: public ContractAST {
	public:
		using InputParam = std::pair<std::string, std::unique_ptr<TypeAST>>;

		InputAST(std::vector<InputParam> params)
			: params(std::move(params)) {}
		~InputAST() = default;

		const std::vector<InputParam> &getParams() const { return params; }
		void printAST() const override {
			std::cout << "(Input";
			for (const auto &param : params) {
				std::cout << " (" << param.first << " ";
				param.second->printAST();
				std::cout << ")";
			}
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::vector<InputParam> params;
};

class OutputAST: public ContractAST {
	public:
		OutputAST(std::unique_ptr<TypeAST> type)
			: type(std::move(type))  {}
		~OutputAST() = default;

		const TypeAST *getType() const { return type.get(); }
		void printAST() const override { std::cout << "(Output "; type->printAST(); std::cout << ")"; }
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<TypeAST> type;
};

class RequiresAST: public ContractAST {
	public:
		RequiresAST(std::unique_ptr<ExprAST> condition)
			: condition(std::move(condition)) {}
		~RequiresAST() = default;

		const ExprAST *getCondition() const { return condition.get(); }
		void printAST() const override { std::cout << "(Requires "; condition->printAST(); std::cout << ")"; }
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<ExprAST> condition;
};

class EnsuresAST: public ContractAST {
	public:
		EnsuresAST(std::unique_ptr<ExprAST> condition)
			: condition(std::move(condition)) {}
		~EnsuresAST() = default;

		const ExprAST *getCondition() const { return condition.get(); }
		void printAST() const override { std::cout << "(Ensures "; condition->printAST(); std::cout << ")"; }
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<ExprAST> condition;
};

class DefaultAST: public ContractAST {
	public:
		DefaultAST(std::unique_ptr<ExprAST> condition, std::unique_ptr<ExprAST> value)
			: condition(std::move(condition)), value(std::move(value)) {}
		~DefaultAST() = default;

		const ExprAST *getCondition() const { return condition.get(); }
		const ExprAST *getValue() const { return value.get(); }
		void printAST() const override {
			std::cout << "(Default ";
			if (condition) { condition->printAST(); }
			std::cout << ' ';
			if (value) { value->printAST(); }
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		std::unique_ptr<ExprAST> condition;
		std::unique_ptr<ExprAST> value;
};

class BlueprintAST: public ProgramAST {
	public:
		BlueprintAST(const std::string &name, std::vector<std::unique_ptr<ContractAST>> contracts)
			: name(name), contracts(std::move(contracts)) {}
		~BlueprintAST() = default;

		const std::string &getName() const { return name; }
		const std::vector<std::unique_ptr<ContractAST>> &getContracts() const { return contracts; }
		void printAST() const override {
			std::cout << "(Blueprint " << name;
			for (const auto &c : contracts) { std::cout << ' '; c->printAST(); }
			std::cout << ")";
		}
		bool checkNode(AnalysisContext &ctx) override;

	private:
		const std::string name;
		std::vector<std::unique_ptr<ContractAST>> contracts;
};
