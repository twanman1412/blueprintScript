#include <iostream>
#include "../src/elaboration/expressionSimplifier.hpp"

#include "../src/ast/exprAST.hpp"
#include "test.hpp"

namespace ExpressionSimplifierTests {
    int failures = 0;


    void testDeMorgan() {
        ExpressionSimplifier simplifier;
        auto expr = Tests::makeUnary(UnaryExprAST::NOT,
                              Tests::makeBin(BinaryExprAST::LOGICAL_AND, Tests::makeId("a"), Tests::makeId("b")));
        auto simplified = simplifier.simplify(expr.get());

        auto* binary = dynamic_cast<BinaryExprAST*>(simplified.get());
        Tests::expectTrue(binary && binary->getOp() == BinaryExprAST::LOGICAL_OR, "de morgan produces logical or", failures);

        auto* leftNot = dynamic_cast<UnaryExprAST*>(binary->getLHS());
        auto* rightNot = dynamic_cast<UnaryExprAST*>(binary->getRHS());
        Tests::expectTrue(leftNot && leftNot->getOp() == UnaryExprAST::NOT, "left side negated", failures);
        Tests::expectTrue(rightNot && rightNot->getOp() == UnaryExprAST::NOT, "right side negated", failures);
    }

    void testDoubleNot() {
        ExpressionSimplifier simplifier;
        auto expr = Tests::makeUnary(UnaryExprAST::NOT, Tests::makeUnary(UnaryExprAST::NOT, Tests::makeId("x")));
        auto simplified = simplifier.simplify(expr.get());
        auto* id = dynamic_cast<IdentifierExprAST*>(simplified.get());
        Tests::expectTrue(id && id->getName() == "x", "double negation eliminated", failures);
    }

    void testConstantFold() {
        ExpressionSimplifier simplifier;
        auto expr = Tests::makeBin(BinaryExprAST::PLUS, Tests::makeInt(1), Tests::makeInt(2));
        auto simplified = simplifier.simplify(expr.get());
        auto* intExpr = dynamic_cast<IntegerExprAST*>(simplified.get());
        Tests::expectTrue(intExpr && intExpr->getValue() == 3, "integer constant folding", failures);

        auto boolExpr = Tests::makeBin(BinaryExprAST::LOGICAL_AND, Tests::makeBool(true), Tests::makeBool(false));
        auto simplifiedBool = simplifier.simplify(boolExpr.get());
        auto* boolNode = dynamic_cast<BoolExprAST*>(simplifiedBool.get());
        Tests::expectTrue(boolNode && !boolNode->getValue(), "boolean constant folding", failures);
    }

    void testInvertComparison() {
        ExpressionSimplifier simplifier;
        auto expr = Tests::makeUnary(UnaryExprAST::NOT,
                              Tests::makeBin(BinaryExprAST::LESS_THAN, Tests::makeId("x"), Tests::makeInt(5)));
        auto simplified = simplifier.simplify(expr.get());
        auto* binary = dynamic_cast<BinaryExprAST*>(simplified.get());
        Tests::expectTrue(binary && binary->getOp() == BinaryExprAST::GREATER_EQUAL, "comparison inverted", failures);
    }

    void testBoolEquality() {
        ExpressionSimplifier simplifier;
        auto expr = Tests::makeBin(BinaryExprAST::EQUAL, Tests::makeId("flag"), Tests::makeBool(true));
        auto simplified = simplifier.simplify(expr.get());
        auto* id = dynamic_cast<IdentifierExprAST*>(simplified.get());
        Tests::expectTrue(id && id->getName() == "flag", "x == true simplifies to x", failures);

        auto expr2 = Tests::makeBin(BinaryExprAST::NOT_EQUAL, Tests::makeId("flag"), Tests::makeBool(false));
        auto simplified2 = simplifier.simplify(expr2.get());
        auto* id2 = dynamic_cast<IdentifierExprAST*>(simplified2.get());
        Tests::expectTrue(id2 && id2->getName() == "flag", "x != false simplifies to x", failures);
    }

    int runTests() {
        testDeMorgan();
        testDoubleNot();
        testConstantFold();
        testInvertComparison();
        testBoolEquality();

        if (failures == 0) {
            std::cout << "All expression simplifier tests passed.\n";
            return 0;
        }

        std::cerr << failures << " expression simplifier test(s) failed.\n";
        return 1;
    }
}