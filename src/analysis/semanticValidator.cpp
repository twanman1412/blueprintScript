#include "semanticValidator.hpp"

#include "../ast/blueprintAST.hpp"

SemanticValidator::SemanticValidator(Logger& logger)
	: logger_(logger), context_(logger) {}

bool SemanticValidator::validate(const std::vector<std::unique_ptr<ProgramAST>>& nodes) {
	bool ok = true;
	for (const auto& node : nodes) {
		if (!node) {
			logger_.errorln("Error: Parser produced an empty AST node");
			ok = false;
			continue;
		}
		if (!node->checkNode(context_)) {
			ok = false;
		}
	}
	return ok;
}
