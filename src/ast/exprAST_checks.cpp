#include "exprAST.hpp"
#include "../analysis/analysisContext.hpp"
#include "../analysis/typeChecker.hpp"

bool IdentifierExprAST::checkNode(AnalysisContext& ctx) {
	AnalysisContext::Symbol* sym = nullptr;
	if (!ctx.lookupSymbol(name, sym)) {
		ctx.getLogger().errorln(std::string("Error: Undefined identifier '") + name + "'");
		return false;
	}

	return true;
}

bool FunctionCallExprAST::checkNode(AnalysisContext& ctx) {
	for (const auto &arg : arguments) {
		if (!arg->checkNode(ctx)) return false;
	}

	TypeAST::PrimitiveKind outType;
	if (!TypeChecker::getExprType(this, ctx, outType)) return false;
	return true;
}

bool BinaryExprAST::checkNode(AnalysisContext& ctx) {
	if (!lhs->checkNode(ctx)) return false;
	if (!rhs->checkNode(ctx)) return false;

	TypeAST::PrimitiveKind outType;
	if (!TypeChecker::getExprType(this, ctx, outType)) return false;
	return true;
}

bool UnaryExprAST::checkNode(AnalysisContext& ctx) {
	if (!operand->checkNode(ctx)) return false;

	TypeAST::PrimitiveKind outType;
	if (!TypeChecker::getExprType(this, ctx, outType)) return false;
	return true;
}
