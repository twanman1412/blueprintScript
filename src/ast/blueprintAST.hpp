#pragma once

#include "commonAST.hpp"
#include "exprAST.hpp"
#include "programAST.hpp"

class ContractAST {
	public:
		ContractAST() = default;
		~ContractAST() = default;
};

class InputAST: public ContractAST {
	public:
		InputAST(std::unique_ptr<TypeAST> type)
			: type(std::move(type)) {}
		~InputAST() = default;

		const TypeAST *getType() const { return type.get(); }

	private:
		std::unique_ptr<TypeAST> type;
};

class OutputAST: public ContractAST {
	public:
		OutputAST(std::unique_ptr<TypeAST> type)
			: type(std::move(type))  {}
		~OutputAST() = default;

		const TypeAST *getType() const { return type.get(); }

	private:
		std::unique_ptr<TypeAST> type;
};

class RequiresAST: public ContractAST {
	public:
		RequiresAST(std::unique_ptr<ExprAST> condition)
			: condition(std::move(condition)) {}
		~RequiresAST() = default;

		const ExprAST *getCondition() const { return condition.get(); }

	private:
		std::unique_ptr<ExprAST> condition;
};

class EnsuresAST: public ContractAST {
	public:
		EnsuresAST(std::unique_ptr<ExprAST> condition)
			: condition(std::move(condition)) {}
		~EnsuresAST() = default;

		const ExprAST *getCondition() const { return condition.get(); }

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

	private:
		const std::string name;
		std::vector<std::unique_ptr<ContractAST>> contracts;
};
