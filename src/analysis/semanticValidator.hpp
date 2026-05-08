#pragma once

#include <memory>
#include <vector>

#include "analysisContext.hpp"
#include "../ast/programAST.hpp"

class SemanticValidator {
public:
	explicit SemanticValidator(Logger& logger);

	bool validate(const std::vector<std::unique_ptr<ProgramAST>>& nodes);

private:
	Logger& logger_;
	AnalysisContext context_;
};
