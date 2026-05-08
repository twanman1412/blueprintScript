#include "typeChecker.hpp"

bool TypeChecker::isCompatible(TypeAST::PrimitiveKind required, TypeAST::PrimitiveKind provided) {
	return required == provided;
}

bool TypeChecker::getExprType(const ExprAST* expr, AnalysisContext& ctx, TypeAST::PrimitiveKind& outType) {
	if (!expr) return false;

	if (auto intExpr = dynamic_cast<const IntegerExprAST*>(expr)) {
		outType = TypeAST::INT32;
		return true;
	}

	if (auto boolExpr = dynamic_cast<const BoolExprAST*>(expr)) {
		outType = TypeAST::BOOL;
		return true;
	}

	if (auto identExpr = dynamic_cast<const IdentifierExprAST*>(expr)) {
		AnalysisContext::Symbol *symbol = nullptr;
		if (!ctx.lookupSymbol(identExpr->getName(), symbol)) {
			ctx.getLogger().errorln("Error: Undefined identifier '" + identExpr->getName() + "'");
			return false;
		}
		outType = symbol->type;
		return true;
	}

	if (auto binExpr = dynamic_cast<const BinaryExprAST*>(expr)) {
		TypeAST::PrimitiveKind lhsType, rhsType;
		if (!getExprType(binExpr->getLHS(), ctx, lhsType)) return false;
		if (!getExprType(binExpr->getRHS(), ctx, rhsType)) return false;

		switch (binExpr->getOp()) {
			case BinaryExprAST::PLUS:
			case BinaryExprAST::MINUS:
			case BinaryExprAST::MULTIPLY:
			case BinaryExprAST::DIVIDE:
			case BinaryExprAST::MODULO:
				if (lhsType != TypeAST::INT32 || rhsType != TypeAST::INT32) {
					ctx.getLogger().errorln("Error: Arithmetic operator requires INT32 operands");
					return false;
				}
				outType = TypeAST::INT32;
				return true;
			case BinaryExprAST::EQUAL:
			case BinaryExprAST::NOT_EQUAL:
			case BinaryExprAST::LESS_THAN:
			case BinaryExprAST::LESS_EQUAL:
			case BinaryExprAST::GREATER_THAN:
			case BinaryExprAST::GREATER_EQUAL:
				if (lhsType != TypeAST::INT32 || rhsType != TypeAST::INT32) {
					ctx.getLogger().errorln("Error: Comparison operator requires INT32 operands");
					return false;
				}
				outType = TypeAST::BOOL;
				return true;
			case BinaryExprAST::LOGICAL_AND:
			case BinaryExprAST::LOGICAL_OR:
				if (lhsType != TypeAST::BOOL || rhsType != TypeAST::BOOL) {
					ctx.getLogger().errorln("Error: Logical operator requires BOOL operands");
					return false;
				}
				outType = TypeAST::BOOL;
				return true;
			default:
				ctx.getLogger().errorln("Error: Unknown binary operator");
				return false;
		}
	}

	if (auto unaryExpr = dynamic_cast<const UnaryExprAST*>(expr)) {
		TypeAST::PrimitiveKind operandType;
		if (!getExprType(unaryExpr->getOperand(), ctx, operandType)) return false;
		auto op = unaryExpr->getOp();
		if (op == UnaryExprAST::NEGATE) {
			if (operandType != TypeAST::INT32) {
				ctx.getLogger().errorln("Error: Negation operator requires INT32 operand");
				return false;
			}
			outType = TypeAST::INT32;
			return true;
		}

		if (op == UnaryExprAST::NOT) {
			if (operandType != TypeAST::BOOL) {
				ctx.getLogger().errorln("Error: NOT operator requires BOOL operand");
				return false;
			}
			outType = TypeAST::BOOL;
			return true;
		}

		return false;
	}

	if (auto funcCall = dynamic_cast<const FunctionCallExprAST*>(expr)) {
		AnalysisContext::FunctionSignature* sig = nullptr;
		if (!ctx.lookupFunctionSignature(funcCall->getFunctionName(), sig)) {
			ctx.getLogger().errorln("Error: Undefined function '" + funcCall->getFunctionName() + "'");
			return false;
		}

		if (funcCall->getArguments().size() != sig->parameters.size()) {
			ctx.getLogger().errorln("Error: Function '" + funcCall->getFunctionName() + "' expects " + std::to_string(sig->parameters.size()) + " arguments");
			return false;
		}

		for (size_t i = 0; i < funcCall->getArguments().size(); ++i) {
			TypeAST::PrimitiveKind argType;
			if (!getExprType(funcCall->getArguments()[i].get(), ctx, argType)) return false;
			if (!isCompatible(sig->parameters[i].second, argType)) {
				ctx.getLogger().errorln("Error: Argument " + std::to_string(i) + " type mismatch in call to '" + funcCall->getFunctionName() + "'");
				return false;
			}
		}

		outType = sig->returnType;
		return true;
	}

	return false;
}
