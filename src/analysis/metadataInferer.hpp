#pragma once

#include <map>
#include <optional>
#include <string>

class BlueprintAST;

struct InferredRange {
    bool hasLower = false;
    bool hasUpper = false;
    long long lower = 0;
    long long upper = 0;
};

struct InferredMetadata {
    std::map<std::string, InferredRange> paramRanges;
    std::optional<InferredRange> returnRange;

    bool empty() const {
        return paramRanges.empty() && !returnRange.has_value();
    }
};

class ContractMetadataInferer {
public:
    InferredMetadata infer(const BlueprintAST* blueprint, const std::string& functionName) const;
};
