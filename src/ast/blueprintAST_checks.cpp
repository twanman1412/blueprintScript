#include <algorithm>

#include "blueprintAST.hpp"

#include "../analysis/analysisContext.hpp"
#include "../analysis/typeChecker.hpp"

bool InputAST::checkNode(AnalysisContext& ctx) {
	std::vector<std::string> paramNames;
	for (const auto& param : params) {
		if (std::find(paramNames.begin(), paramNames.end(), param.first) != paramNames.end()) {
			ctx.getLogger().errorln("Error: Duplicate input parameter name: " + param.first);
			return false;
		}
		paramNames.push_back(param.first);
	}

	return true;
}

bool RequiresAST::checkNode(AnalysisContext& ctx) {
	if (!condition->checkNode(ctx)) {
		return false;
	}

	TypeAST::PrimitiveKind conditionType;
	if (!TypeChecker::getExprType(condition.get(), ctx, conditionType)) {
		return false;
	}
	if (conditionType != TypeAST::BOOL) {
		ctx.getLogger().errorln("Error: requires condition must be BOOL");
		return false;
	}

	return true;
}

bool EnsuresAST::checkNode(AnalysisContext& ctx) {
	if (!condition->checkNode(ctx)) {
		return false;
	}

	TypeAST::PrimitiveKind conditionType;
	if (!TypeChecker::getExprType(condition.get(), ctx, conditionType)) {
		return false;
	}
	if (conditionType != TypeAST::BOOL) {
		ctx.getLogger().errorln("Error: ensures condition must be BOOL");
		return false;
	}

	return true;
}

bool DefaultAST::checkNode(AnalysisContext& ctx) {
	if (!condition->checkNode(ctx)) {
		return false;
	}
	if (!value->checkNode(ctx)) {
		return false;
	}

	TypeAST::PrimitiveKind conditionType;
	if (!TypeChecker::getExprType(condition.get(), ctx, conditionType)) {
		return false;
	}
	if (conditionType != TypeAST::BOOL) {
		ctx.getLogger().errorln("Error: default condition must be BOOL");
		return false;
	}

	TypeAST::PrimitiveKind valueType;
	if (!TypeChecker::getExprType(value.get(), ctx, valueType)) {
		return false;
	}

	return true;
}

bool BlueprintAST::checkNode(AnalysisContext& ctx) {
	bool hasInput = false;
	bool hasOutput = false;

	ctx.pushScope(); // temporary scope for blueprint checking
	for (const auto& contract : contracts) {
		if (auto* inputContract = dynamic_cast<InputAST*>(contract.get())) {
			if (hasInput) {
				ctx.getLogger().errorln("Error: Multiple input contracts are not allowed");
				return false;
			}

			if (!inputContract->checkNode(ctx)) {
				return false;
			}

			for (const auto& param : inputContract->getParams()) {
				if (param.first == name) {
					ctx.getLogger().errorln("Error: Input parameter name '" + param.first + "' cannot be the same as the blueprint name");
					return false;
				}
				if (!ctx.declareSymbol(param.first, param.second->getKind(), AnalysisContext::SymbolKind::VARIABLE)) {
					return false;
				}
			}

			hasInput = true;
		}
		else if (auto* outputContract = dynamic_cast<OutputAST*>(contract.get())) {
			if (hasOutput) {
				ctx.getLogger().errorln("Error: Multiple output contracts are not allowed");
				return false;
			}
			if (!ctx.declareSymbol(name, outputContract->getType()->getKind(), AnalysisContext::SymbolKind::FUNCTION)) {
				ctx.getLogger().errorln("Error: Failed to declare output symbol '" + name + "'");
				return false;
			}

			hasOutput = true;
		}

	}

	if (!hasOutput) {
		ctx.getLogger().errorln("Error: Blueprint must have an output contract");
		return false;
	}


	for (const auto& contract : contracts) {
		if (dynamic_cast<InputAST*>(contract.get()) || 
				dynamic_cast<OutputAST*>(contract.get())) {
			continue;
		}

		if (!contract->checkNode(ctx)) {
			ctx.popScope();
			return false;
		}
	}

	ctx.popScope(); // pop temporary scope
	if (!ctx.declareBlueprint(name, this)) {
		return false;
	}
	return true;
}
