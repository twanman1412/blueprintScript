#include "expressionRangeInferer.hpp"

#include "../ast/exprAST.hpp"

#include <algorithm>
#include <array>

namespace {
bool addChecked(long long left, long long right, long long& out) {
    return !__builtin_add_overflow(left, right, &out);
}

bool subChecked(long long left, long long right, long long& out) {
    return !__builtin_sub_overflow(left, right, &out);
}

bool mulChecked(long long left, long long right, long long& out) {
    return !__builtin_mul_overflow(left, right, &out);
}

bool negateChecked(long long value, long long& out) {
    return subChecked(0, value, out);
}
}

std::optional<InferredRange> ExpressionRangeInferer::makeRange(long long lower, long long upper) const {
    if (lower > upper) {
        return std::nullopt;
    }
    InferredRange result;
    result.hasLower = true;
    result.hasUpper = true;
    result.lower = lower;
    result.upper = upper;
    return result;
}

std::optional<InferredRange> ExpressionRangeInferer::ensureBounded(const InferredRange& range) const {
    if (!range.hasLower || !range.hasUpper) {
        return std::nullopt;
    }
    return range;
}

std::optional<InferredRange> ExpressionRangeInferer::infer(const ExprAST* expr,
                                                           const std::map<std::string, InferredRange>& ranges) const {
    if (!expr) {
        return std::nullopt;
    }

    if (auto* literal = dynamic_cast<const IntegerExprAST*>(expr)) {
        return makeRange(literal->getValue(), literal->getValue());
    }

    if (auto* identifier = dynamic_cast<const IdentifierExprAST*>(expr)) {
        auto it = ranges.find(identifier->getName());
        if (it == ranges.end()) {
            return std::nullopt;
        }
        return ensureBounded(it->second);
    }

    if (auto* unary = dynamic_cast<const UnaryExprAST*>(expr)) {
        if (unary->getOp() != UnaryExprAST::NEGATE) {
            return std::nullopt;
        }
        auto operand = infer(unary->getOperand(), ranges);
        if (!operand) {
            return std::nullopt;
        }
        long long negUpper = 0;
        long long negLower = 0;
        if (!negateChecked(operand->upper, negUpper) || !negateChecked(operand->lower, negLower)) {
            return std::nullopt;
        }
        return makeRange(negUpper, negLower);
    }

    if (auto* binary = dynamic_cast<const BinaryExprAST*>(expr)) {
        auto left = infer(binary->getLHS(), ranges);
        auto right = infer(binary->getRHS(), ranges);
        if (!left || !right) {
            return std::nullopt;
        }

        const long long lmin = left->lower;
        const long long lmax = left->upper;
        const long long rmin = right->lower;
        const long long rmax = right->upper;

        switch (binary->getOp()) {
            case BinaryExprAST::PLUS: {
                long long lower = 0;
                long long upper = 0;
                if (!addChecked(lmin, rmin, lower) || !addChecked(lmax, rmax, upper)) {
                    return std::nullopt;
                }
                return makeRange(lower, upper);
            }
            case BinaryExprAST::MINUS: {
                long long lower = 0;
                long long upper = 0;
                if (!subChecked(lmin, rmax, lower) || !subChecked(lmax, rmin, upper)) {
                    return std::nullopt;
                }
                return makeRange(lower, upper);
            }
            case BinaryExprAST::MULTIPLY: {
                std::array<long long, 4> candidates = {};
                if (!mulChecked(lmin, rmin, candidates[0]) ||
                    !mulChecked(lmin, rmax, candidates[1]) ||
                    !mulChecked(lmax, rmin, candidates[2]) ||
                    !mulChecked(lmax, rmax, candidates[3])) {
                    return std::nullopt;
                }
                auto result = std::minmax_element(candidates.begin(), candidates.end());
                return makeRange(*result.first, *result.second);
            }
            default:
                return std::nullopt;
        }
    }

    return std::nullopt;
}
