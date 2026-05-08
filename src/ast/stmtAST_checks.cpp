#include "stmtAST.hpp"

#include "../analysis/analysisContext.hpp"
#include "../analysis/typeChecker.hpp"

bool BlockStmtAST::checkNode(AnalysisContext& ctx) {
	ctx.pushScope();
	for (const auto& statement : statements) {
		if (!statement->checkNode(ctx)) {
			ctx.popScope();
			return false;
		}
	}

	ctx.popScope();
	return true;
}

bool VarDeclStmtAST::checkNode(AnalysisContext& ctx) {
	if (!initializer->checkNode(ctx)) {
		return false;
	}

	TypeAST::PrimitiveKind initializerType;
	if (!TypeChecker::getExprType(initializer.get(), ctx, initializerType)) {
		return false;
	}

	if (!TypeChecker::isCompatible(type->getKind(), initializerType)) {
		ctx.getLogger().errorln("Error: Variable '" + name + "' initializer type mismatch");
		return false;
	}

	return ctx.declareSymbol(name, type->getKind(), AnalysisContext::SymbolKind::VARIABLE);
}

bool AssignmentStmtAST::checkNode(AnalysisContext& ctx) {
	AnalysisContext::Symbol* symbol = nullptr;
	if (!ctx.lookupSymbol(name, symbol)) {
		ctx.getLogger().errorln("Error: Assignment to undefined variable '" + name + "'");
		return false;
	}

	if (!value->checkNode(ctx)) {
		return false;
	}

	TypeAST::PrimitiveKind valueType;
	if (!TypeChecker::getExprType(value.get(), ctx, valueType)) {
		return false;
	}
	if (!TypeChecker::isCompatible(symbol->type, valueType)) {
		ctx.getLogger().errorln("Error: Assignment type mismatch for variable '" + name + "'");
		return false;
	}

	return true;
}

bool IfStmtAST::checkNode(AnalysisContext& ctx) {
	if (!condition->checkNode(ctx)) {
		return false;
	}

	TypeAST::PrimitiveKind conditionType;
	if (!TypeChecker::getExprType(condition.get(), ctx, conditionType)) {
		return false;
	}
	if (conditionType != TypeAST::BOOL) {
		ctx.getLogger().errorln("Error: If condition must be BOOL");
		return false;
	}

	if (thenStmt && !thenStmt->checkNode(ctx)) {
		return false;
	}
	if (elseStmt && !elseStmt->checkNode(ctx)) {
		return false;
	}

	return true;
}

bool WhileStmtAST::checkNode(AnalysisContext& ctx) {
	if (!condition->checkNode(ctx)) {
		return false;
	}

	TypeAST::PrimitiveKind conditionType;
	if (!TypeChecker::getExprType(condition.get(), ctx, conditionType)) {
		return false;
	}
	if (conditionType != TypeAST::BOOL) {
		ctx.getLogger().errorln("Error: While condition must be BOOL");
		return false;
	}

	return body->checkNode(ctx);
}

bool ReturnStmtAST::checkNode(AnalysisContext& ctx) {
	TypeAST::PrimitiveKind expected = ctx.getCurrentFunctionReturnType();
	if (!value) {
		if (expected != TypeAST::VOID) {
			ctx.getLogger().errorln("Error: Non-void function must return a value");
			return false;
		}
		return true;
	}
	if (!value->checkNode(ctx)) {
		return false;
	}

	TypeAST::PrimitiveKind valueType;
	if (!TypeChecker::getExprType(value.get(), ctx, valueType)) {
		return false;
	}
	if (!TypeChecker::isCompatible(expected, valueType)) {
		ctx.getLogger().errorln("Error: Return type mismatch");
		return false;
	}

	return true;
}

bool ExprStmtAST::checkNode(AnalysisContext& ctx) {
	return expr->checkNode(ctx);
}

bool PrintStmtAST::checkNode(AnalysisContext& ctx) {
	return expr->checkNode(ctx);
}
