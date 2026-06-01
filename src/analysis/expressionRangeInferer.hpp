#pragma once

#include "metadataInferer.hpp"

#include <map>
#include <optional>
#include <string>

class ExprAST;

class ExpressionRangeInferer {
public:
    std::optional<InferredRange> infer(const ExprAST* expr,
                                       const std::map<std::string, InferredRange>& ranges) const;

private:
    std::optional<InferredRange> makeRange(long long lower, long long upper) const;
    std::optional<InferredRange> ensureBounded(const InferredRange& range) const;
};
