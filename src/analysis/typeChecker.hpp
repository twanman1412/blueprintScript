#pragma once

#include "analysisContext.hpp"
#include "../ast/exprAST.hpp"

class TypeChecker {
	public:
		static bool isCompatible(TypeAST::PrimitiveKind required, TypeAST::PrimitiveKind provided);
		static bool getExprType(const ExprAST* expr, AnalysisContext& ctx, TypeAST::PrimitiveKind& outType);
};
