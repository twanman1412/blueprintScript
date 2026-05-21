#include "metadataInferer.hpp"

#include "../ast/blueprintAST.hpp"
#include "../ast/exprAST.hpp"

#include <algorithm>

namespace {
    std::optional<long long> extractIntegerLiteral(const ExprAST* expr) {
        if (!expr) {
            return std::nullopt;
        }

        if (auto* intExpr = dynamic_cast<const IntegerExprAST*>(expr)) {
            return intExpr->getValue();
        }

        auto* unaryExpr = dynamic_cast<const UnaryExprAST*>(expr);
        if (!unaryExpr || unaryExpr->getOp() != UnaryExprAST::NEGATE) {
            return std::nullopt;
        }

        auto* innerInt = dynamic_cast<const IntegerExprAST*>(unaryExpr->getOperand());
        if (!innerInt) {
            return std::nullopt;
        }

        return -innerInt->getValue();
    }

    std::optional<std::string> extractIdentifier(const ExprAST* expr) {
        auto* idExpr = dynamic_cast<const IdentifierExprAST*>(expr);
        if (!idExpr) {
            return std::nullopt;
        }
        return idExpr->getName();
    }

    std::optional<InferredRange> makeRangeForComparison(BinaryExprAST::Operator op, long long constant, bool identifierOnLeft) {
        auto mapOperator = [&](BinaryExprAST::Operator input) {
            if (identifierOnLeft) {
                return input;
            }
            switch (input) {
                case BinaryExprAST::LESS_THAN:
                    return BinaryExprAST::GREATER_THAN;
                case BinaryExprAST::LESS_EQUAL:
                    return BinaryExprAST::GREATER_EQUAL;
                case BinaryExprAST::GREATER_THAN:
                    return BinaryExprAST::LESS_THAN;
                case BinaryExprAST::GREATER_EQUAL:
                    return BinaryExprAST::LESS_EQUAL;
                default:
                    return input;
            }
        };

        BinaryExprAST::Operator mapped = mapOperator(op);
        InferredRange range;

        switch (mapped) {
            case BinaryExprAST::EQUAL:
                range.hasLower = true;
                range.hasUpper = true;
                range.lower = constant;
                range.upper = constant;
                return range;
            case BinaryExprAST::LESS_THAN:
                range.hasUpper = true;
                range.upper = constant - 1;
                return range;
            case BinaryExprAST::LESS_EQUAL:
                range.hasUpper = true;
                range.upper = constant;
                return range;
            case BinaryExprAST::GREATER_THAN:
                range.hasLower = true;
                range.lower = constant + 1;
                return range;
            case BinaryExprAST::GREATER_EQUAL:
                range.hasLower = true;
                range.lower = constant;
                return range;
            default:
                return std::nullopt;
        }
    }

    std::optional<InferredRange> intersectRanges(const std::optional<InferredRange>& left,
                                                 const std::optional<InferredRange>& right) {
        if (!left && !right) {
            return std::nullopt;
        }
        if (!left) {
            return right;
        }
        if (!right) {
            return left;
        }

        InferredRange result;
        if (left->hasLower || right->hasLower) {
            result.hasLower = true;
            result.lower = left->hasLower && right->hasLower
                ? std::max(left->lower, right->lower)
                : (left->hasLower ? left->lower : right->lower);
        }
        if (left->hasUpper || right->hasUpper) {
            result.hasUpper = true;
            result.upper = left->hasUpper && right->hasUpper
                ? std::min(left->upper, right->upper)
                : (left->hasUpper ? left->upper : right->upper);
        }

        if (result.hasLower && result.hasUpper && result.lower > result.upper) {
            return std::nullopt;
        }

        return result;
    }

    std::optional<InferredRange> inferRangeForIdentifier(const ExprAST* expr, const std::string& identifier) {
        if (!expr) {
            return std::nullopt;
        }

        if (auto* binExpr = dynamic_cast<const BinaryExprAST*>(expr)) {
            BinaryExprAST::Operator op = binExpr->getOp();
            if (op == BinaryExprAST::LOGICAL_AND) {
                auto left = inferRangeForIdentifier(binExpr->getLHS(), identifier);
                auto right = inferRangeForIdentifier(binExpr->getRHS(), identifier);
                return intersectRanges(left, right);
            }
            if (op == BinaryExprAST::LOGICAL_OR) {
                return std::nullopt;
            }

            auto leftId = extractIdentifier(binExpr->getLHS());
            auto rightId = extractIdentifier(binExpr->getRHS());
            auto leftConst = extractIntegerLiteral(binExpr->getLHS());
            auto rightConst = extractIntegerLiteral(binExpr->getRHS());

            if (leftId && *leftId == identifier && rightConst) {
                return makeRangeForComparison(op, *rightConst, true);
            }
            if (rightId && *rightId == identifier && leftConst) {
                return makeRangeForComparison(op, *leftConst, false);
            }
        }

        return std::nullopt;
    }

    bool mergeRange(InferredRange& target, const InferredRange& incoming) {
        std::optional<InferredRange> merged = intersectRanges(std::optional<InferredRange>(target),
                                                             std::optional<InferredRange>(incoming));
        if (!merged) {
            return false;
        }
        target = *merged;
        return true;
    }
}

InferredMetadata ContractMetadataInferer::infer(const BlueprintAST* blueprint, const std::string& functionName) const {
    InferredMetadata metadata;
    if (!blueprint) {
        return metadata;
    }

    std::map<std::string, TypeAST::PrimitiveKind> paramTypes;
    std::optional<TypeAST::PrimitiveKind> returnType;

    for (const auto& contract : blueprint->getContracts()) {
        if (auto* input = dynamic_cast<const InputAST*>(contract.get())) {
            for (const auto& param : input->getParams()) {
                if (param.second) {
                    paramTypes[param.first] = param.second->getKind();
                }
            }
        } else if (auto* output = dynamic_cast<const OutputAST*>(contract.get())) {
            if (output->getType()) {
                returnType = output->getType()->getKind();
            }
        }
    }

    for (const auto& contract : blueprint->getContracts()) {
        if (auto* requires = dynamic_cast<const RequiresAST*>(contract.get())) {
            for (const auto& entry : paramTypes) {
                if (entry.second != TypeAST::INT32) {
                    continue;
                }
                auto inferred = inferRangeForIdentifier(requires->getCondition(), entry.first);
                if (!inferred) {
                    continue;
                }

                auto it = metadata.paramRanges.find(entry.first);
                if (it == metadata.paramRanges.end()) {
                    metadata.paramRanges.emplace(entry.first, *inferred);
                } else if (!mergeRange(it->second, *inferred)) {
                    metadata.paramRanges.erase(it);
                }
            }
        }

        if (auto* ensures = dynamic_cast<const EnsuresAST*>(contract.get())) {
            if (!returnType || *returnType != TypeAST::INT32) {
                continue;
            }
            auto inferred = inferRangeForIdentifier(ensures->getCondition(), functionName);
            if (!inferred) {
                continue;
            }
            if (!metadata.returnRange) {
                metadata.returnRange = *inferred;
            } else {
                auto merged = intersectRanges(std::optional<InferredRange>(*metadata.returnRange),
                                              std::optional<InferredRange>(*inferred));
                if (merged) {
                    metadata.returnRange = *merged;
                } else {
                    metadata.returnRange.reset();
                }
            }
        }
    }

    return metadata;
}
