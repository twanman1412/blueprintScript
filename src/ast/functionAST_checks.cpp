#include "functionAST.hpp"

#include "../analysis/analysisContext.hpp"

bool PrintAST::checkNode(AnalysisContext& ctx) {
	return value->checkNode(ctx);
}

bool FunctionDeclAST::checkNode(AnalysisContext& ctx) {
	std::vector<std::pair<std::string, TypeAST::PrimitiveKind>> paramTypes;
	for (const auto& parameter : parameters) {
		paramTypes.emplace_back(parameter.first, parameter.second->getKind());
	}

	if (!ctx.declareFunctionSignature(functionName, type->getKind(), paramTypes)) {
		return false;
	}

	// Enter function scope, register parameters as local symbols, then validate body
	ctx.pushScope();
	ctx.setCurrentFunction(type->getKind());

	for (const auto& parameter : parameters) {
		if (!ctx.declareSymbol(parameter.first, parameter.second->getKind(), AnalysisContext::SymbolKind::PARAMETER)) {
			ctx.clearCurrentFunction();
			ctx.popScope();
			return false;
		}
	}

	bool bodyOk = body->checkNode(ctx);
	ctx.clearCurrentFunction();
	ctx.popScope();
	return bodyOk;
}
