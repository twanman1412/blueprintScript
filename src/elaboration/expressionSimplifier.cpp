#include "expressionSimplifier.hpp"

#include "../ast/exprAST.hpp"

namespace {
    std::unique_ptr<ExprAST> simplifyExpr(const ExprAST* expr);
    std::unique_ptr<ExprAST> simplifyNot(const ExprAST* expr);

    std::unique_ptr<ExprAST> cloneExpr(const ExprAST* expr) {
        if (!expr) {
            return nullptr;
        }

        if (auto* intExpr = dynamic_cast<const IntegerExprAST*>(expr)) {
            return std::make_unique<IntegerExprAST>(intExpr->getValue());
        }
        if (auto* boolExpr = dynamic_cast<const BoolExprAST*>(expr)) {
            return std::make_unique<BoolExprAST>(boolExpr->getValue());
        }
        if (auto* idExpr = dynamic_cast<const IdentifierExprAST*>(expr)) {
            return std::make_unique<IdentifierExprAST>(idExpr->getName());
        }
        if (auto* callExpr = dynamic_cast<const FunctionCallExprAST*>(expr)) {
            std::vector<std::unique_ptr<ExprAST>> args;
            args.reserve(callExpr->getArguments().size());
            for (const auto& arg : callExpr->getArguments()) {
                args.push_back(cloneExpr(arg.get()));
            }
            return std::make_unique<FunctionCallExprAST>(callExpr->getFunctionName(), std::move(args));
        }
        if (auto* unaryExpr = dynamic_cast<const UnaryExprAST*>(expr)) {
            return std::make_unique<UnaryExprAST>(unaryExpr->getOp(), cloneExpr(unaryExpr->getOperand()));
        }
        if (auto* binaryExpr = dynamic_cast<const BinaryExprAST*>(expr)) {
            return std::make_unique<BinaryExprAST>(binaryExpr->getOp(),
                                                   cloneExpr(binaryExpr->getLHS()),
                                                   cloneExpr(binaryExpr->getRHS()));
        }

        return nullptr;
    }

    bool isBoolLiteral(const ExprAST* expr, bool& outValue) {
        auto* boolExpr = dynamic_cast<const BoolExprAST*>(expr);
        if (!boolExpr) {
            return false;
        }
        outValue = boolExpr->getValue();
        return true;
    }

    bool isIntLiteral(const ExprAST* expr, long long& outValue) {
        auto* intExpr = dynamic_cast<const IntegerExprAST*>(expr);
        if (!intExpr) {
            return false;
        }
        outValue = intExpr->getValue();
        return true;
    }

    BinaryExprAST::Operator invertComparison(BinaryExprAST::Operator op) {
        switch (op) {
            case BinaryExprAST::EQUAL:
                return BinaryExprAST::NOT_EQUAL;
            case BinaryExprAST::NOT_EQUAL:
                return BinaryExprAST::EQUAL;
            case BinaryExprAST::LESS_THAN:
                return BinaryExprAST::GREATER_EQUAL;
            case BinaryExprAST::LESS_EQUAL:
                return BinaryExprAST::GREATER_THAN;
            case BinaryExprAST::GREATER_THAN:
                return BinaryExprAST::LESS_EQUAL;
            case BinaryExprAST::GREATER_EQUAL:
                return BinaryExprAST::LESS_THAN;
            default:
                return op;
        }
    }

    std::unique_ptr<ExprAST> simplifyBinaryWithOperands(BinaryExprAST::Operator op,
                                                        std::unique_ptr<ExprAST> left,
                                                        std::unique_ptr<ExprAST> right) {

        long long lhsInt = 0;
        long long rhsInt = 0;
        bool lhsBool = false;
        bool rhsBool = false;

        bool lhsIsInt = isIntLiteral(left.get(), lhsInt);
        bool rhsIsInt = isIntLiteral(right.get(), rhsInt);
        bool lhsIsBool = isBoolLiteral(left.get(), lhsBool);
        bool rhsIsBool = isBoolLiteral(right.get(), rhsBool);

        switch (op) {
            case BinaryExprAST::PLUS:
                if (lhsIsInt && rhsIsInt) {
                    return std::make_unique<IntegerExprAST>(lhsInt + rhsInt);
                }
                break;
            case BinaryExprAST::MINUS:
                if (lhsIsInt && rhsIsInt) {
                    return std::make_unique<IntegerExprAST>(lhsInt - rhsInt);
                }
                break;
            case BinaryExprAST::MULTIPLY:
                if (lhsIsInt && rhsIsInt) {
                    return std::make_unique<IntegerExprAST>(lhsInt * rhsInt);
                }
                break;
            case BinaryExprAST::DIVIDE:
                if (lhsIsInt && rhsIsInt && rhsInt != 0) {
                    return std::make_unique<IntegerExprAST>(lhsInt / rhsInt);
                }
                break;
            case BinaryExprAST::MODULO:
                if (lhsIsInt && rhsIsInt && rhsInt != 0) {
                    return std::make_unique<IntegerExprAST>(lhsInt % rhsInt);
                }
                break;
            case BinaryExprAST::LOGICAL_AND:
                if (lhsIsBool && rhsIsBool) {
                    return std::make_unique<BoolExprAST>(lhsBool && rhsBool);
                }
                if (lhsIsBool) {
                    return lhsBool ? std::move(right) : std::make_unique<BoolExprAST>(false);
                }
                if (rhsIsBool) {
                    return rhsBool ? std::move(left) : std::make_unique<BoolExprAST>(false);
                }
                break;
            case BinaryExprAST::LOGICAL_OR:
                if (lhsIsBool && rhsIsBool) {
                    return std::make_unique<BoolExprAST>(lhsBool || rhsBool);
                }
                if (lhsIsBool) {
                    return lhsBool ? std::make_unique<BoolExprAST>(true) : std::move(right);
                }
                if (rhsIsBool) {
                    return rhsBool ? std::make_unique<BoolExprAST>(true) : std::move(left);
                }
                break;
            case BinaryExprAST::EQUAL:
            case BinaryExprAST::NOT_EQUAL:
                if (lhsIsInt && rhsIsInt) {
                    bool result = (lhsInt == rhsInt);
                    if (op == BinaryExprAST::NOT_EQUAL) {
                        result = !result;
                    }
                    return std::make_unique<BoolExprAST>(result);
                }
                if (lhsIsBool && rhsIsBool) {
                    bool result = (lhsBool == rhsBool);
                    if (op == BinaryExprAST::NOT_EQUAL) {
                        result = !result;
                    }
                    return std::make_unique<BoolExprAST>(result);
                }
                if (lhsIsBool && !rhsIsBool) {
                    if (op == BinaryExprAST::EQUAL) {
                        return lhsBool ? std::move(right) : simplifyNot(right.get());
                    }
                    return lhsBool ? simplifyNot(right.get()) : std::move(right);
                }
                if (rhsIsBool && !lhsIsBool) {
                    if (op == BinaryExprAST::EQUAL) {
                        return rhsBool ? std::move(left) : simplifyNot(left.get());
                    }
                    return rhsBool ? simplifyNot(left.get()) : std::move(left);
                }
                break;
            case BinaryExprAST::LESS_THAN:
            case BinaryExprAST::LESS_EQUAL:
            case BinaryExprAST::GREATER_THAN:
            case BinaryExprAST::GREATER_EQUAL:
                if (lhsIsInt && rhsIsInt) {
                    bool result = false;
                    switch (op) {
                        case BinaryExprAST::LESS_THAN: result = lhsInt < rhsInt; break;
                        case BinaryExprAST::LESS_EQUAL: result = lhsInt <= rhsInt; break;
                        case BinaryExprAST::GREATER_THAN: result = lhsInt > rhsInt; break;
                        case BinaryExprAST::GREATER_EQUAL: result = lhsInt >= rhsInt; break;
                        default: break;
                    }
                    return std::make_unique<BoolExprAST>(result);
                }
                break;
            default:
                break;
        }

        return std::make_unique<BinaryExprAST>(op, std::move(left), std::move(right));
    }

    std::unique_ptr<ExprAST> simplifyBinary(BinaryExprAST::Operator op,
                                            const ExprAST* lhs,
                                            const ExprAST* rhs) {
        return simplifyBinaryWithOperands(op, simplifyExpr(lhs), simplifyExpr(rhs));
    }

    std::unique_ptr<ExprAST> simplifyNot(const ExprAST* expr) {
        if (!expr) {
            return nullptr;
        }

        if (auto* boolExpr = dynamic_cast<const BoolExprAST*>(expr)) {
            return std::make_unique<BoolExprAST>(!boolExpr->getValue());
        }

        if (auto* unaryExpr = dynamic_cast<const UnaryExprAST*>(expr)) {
            if (unaryExpr->getOp() == UnaryExprAST::NOT) {
                return simplifyExpr(unaryExpr->getOperand());
            }
        }

        if (auto* binaryExpr = dynamic_cast<const BinaryExprAST*>(expr)) {
            BinaryExprAST::Operator op = binaryExpr->getOp();
            if (op == BinaryExprAST::LOGICAL_AND || op == BinaryExprAST::LOGICAL_OR) {
                BinaryExprAST::Operator swapped = op == BinaryExprAST::LOGICAL_AND
                    ? BinaryExprAST::LOGICAL_OR
                    : BinaryExprAST::LOGICAL_AND;
                auto left = simplifyNot(binaryExpr->getLHS());
                auto right = simplifyNot(binaryExpr->getRHS());
                return simplifyBinaryWithOperands(swapped, std::move(left), std::move(right));
            }

            BinaryExprAST::Operator inverted = invertComparison(op);
            if (inverted != op) {
                return simplifyBinary(inverted, binaryExpr->getLHS(), binaryExpr->getRHS());
            }
        }

        return std::make_unique<UnaryExprAST>(UnaryExprAST::NOT, simplifyExpr(expr));
    }

    std::unique_ptr<ExprAST> simplifyExpr(const ExprAST* expr) {
        if (!expr) {
            return nullptr;
        }

        if (auto* intExpr = dynamic_cast<const IntegerExprAST*>(expr)) {
            return std::make_unique<IntegerExprAST>(intExpr->getValue());
        }
        if (auto* boolExpr = dynamic_cast<const BoolExprAST*>(expr)) {
            return std::make_unique<BoolExprAST>(boolExpr->getValue());
        }
        if (auto* idExpr = dynamic_cast<const IdentifierExprAST*>(expr)) {
            return std::make_unique<IdentifierExprAST>(idExpr->getName());
        }
        if (auto* callExpr = dynamic_cast<const FunctionCallExprAST*>(expr)) {
            std::vector<std::unique_ptr<ExprAST>> args;
            args.reserve(callExpr->getArguments().size());
            for (const auto& arg : callExpr->getArguments()) {
                args.push_back(simplifyExpr(arg.get()));
            }
            return std::make_unique<FunctionCallExprAST>(callExpr->getFunctionName(), std::move(args));
        }
        if (auto* unaryExpr = dynamic_cast<const UnaryExprAST*>(expr)) {
            if (unaryExpr->getOp() == UnaryExprAST::NEGATE) {
                auto operand = simplifyExpr(unaryExpr->getOperand());
                long long value = 0;
                if (isIntLiteral(operand.get(), value)) {
                    return std::make_unique<IntegerExprAST>(-value);
                }
                if (auto* nested = dynamic_cast<const UnaryExprAST*>(operand.get())) {
                    if (nested->getOp() == UnaryExprAST::NEGATE) {
                        return simplifyExpr(nested->getOperand());
                    }
                }
                return std::make_unique<UnaryExprAST>(UnaryExprAST::NEGATE, std::move(operand));
            }
            if (unaryExpr->getOp() == UnaryExprAST::NOT) {
                return simplifyNot(unaryExpr->getOperand());
            }
        }
        if (auto* binaryExpr = dynamic_cast<const BinaryExprAST*>(expr)) {
            return simplifyBinary(binaryExpr->getOp(), binaryExpr->getLHS(), binaryExpr->getRHS());
        }

        return cloneExpr(expr);
    }
}

std::unique_ptr<ExprAST> ExpressionSimplifier::simplify(const ExprAST* expr) const {
    return simplifyExpr(expr);
}
