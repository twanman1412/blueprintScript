#pragma once

#include <memory>

class ExprAST;

class ExpressionSimplifier {
public:
    std::unique_ptr<ExprAST> simplify(const ExprAST* expr) const;
};
