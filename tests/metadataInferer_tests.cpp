#include "../src/analysis/metadataInferer.hpp"

#include "../src/ast/blueprintAST.hpp"
#include "../src/ast/exprAST.hpp"

#include <iostream>
#include <memory>
#include <vector>

namespace {
    int failures = 0;

    void expectTrue(bool condition, const std::string& message) {
        if (!condition) {
            std::cerr << "FAIL: " << message << "\n";
            ++failures;
        }
    }

    void expectEqual(long long actual, long long expected, const std::string& message) {
        if (actual != expected) {
            std::cerr << "FAIL: " << message << " (expected " << expected << ", got " << actual << ")\n";
            ++failures;
        }
    }

    std::unique_ptr<ExprAST> makeInt(long long value) {
        return std::make_unique<IntegerExprAST>(value);
    }

    std::unique_ptr<ExprAST> makeBool(bool value) {
        return std::make_unique<BoolExprAST>(value);
    }

    std::unique_ptr<ExprAST> makeId(const std::string& name) {
        return std::make_unique<IdentifierExprAST>(name);
    }

    std::unique_ptr<ExprAST> makeNeg(std::unique_ptr<ExprAST> expr) {
        return std::make_unique<UnaryExprAST>(UnaryExprAST::NEGATE, std::move(expr));
    }

    std::unique_ptr<ExprAST> makeBin(BinaryExprAST::Operator op, std::unique_ptr<ExprAST> lhs, std::unique_ptr<ExprAST> rhs) {
        return std::make_unique<BinaryExprAST>(op, std::move(lhs), std::move(rhs));
    }

    std::unique_ptr<BlueprintAST> buildBlueprint(std::vector<InputAST::InputParam> inputs,
                                                 std::unique_ptr<TypeAST> outputType,
                                                 std::vector<std::unique_ptr<ContractAST>> contracts) {
        contracts.insert(contracts.begin(), std::make_unique<InputAST>(std::move(inputs)));
        if (outputType) {
            contracts.insert(contracts.begin() + 1, std::make_unique<OutputAST>(std::move(outputType)));
        }
        return std::make_unique<BlueprintAST>("test", std::move(contracts));
    }

    void testLowerBound() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            makeBin(BinaryExprAST::GREATER_EQUAL, makeId("n"), makeInt(0))
        ));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        expectTrue(meta.paramRanges.count("n") == 1, "lower bound inferred for n");
        const auto& range = meta.paramRanges.at("n");
        expectTrue(range.hasLower, "lower bound flag set");
        expectEqual(range.lower, 0, "lower bound value");
    }

    void testUpperBound() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            makeBin(BinaryExprAST::LESS_THAN, makeId("n"), makeInt(10))
        ));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        expectTrue(meta.paramRanges.count("n") == 1, "upper bound inferred for n");
        const auto& range = meta.paramRanges.at("n");
        expectTrue(range.hasUpper, "upper bound flag set");
        expectEqual(range.upper, 9, "upper bound value");
    }

    void testEquality() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            makeBin(BinaryExprAST::EQUAL, makeId("n"), makeInt(5))
        ));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        const auto& range = meta.paramRanges.at("n");
        expectTrue(range.hasLower && range.hasUpper, "equality sets both bounds");
        expectEqual(range.lower, 5, "equality lower value");
        expectEqual(range.upper, 5, "equality upper value");
    }

    void testAndIntersection() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        auto condition = makeBin(
            BinaryExprAST::LOGICAL_AND,
            makeBin(BinaryExprAST::GREATER_EQUAL, makeId("n"), makeInt(0)),
            makeBin(BinaryExprAST::LESS_EQUAL, makeId("n"), makeInt(10))
        );

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(std::move(condition)));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        const auto& range = meta.paramRanges.at("n");
        expectTrue(range.hasLower && range.hasUpper, "intersection bounds set");
        expectEqual(range.lower, 0, "intersection lower");
        expectEqual(range.upper, 10, "intersection upper");
    }

    void testOrIgnored() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        auto condition = makeBin(
            BinaryExprAST::LOGICAL_OR,
            makeBin(BinaryExprAST::LESS_THAN, makeId("n"), makeInt(0)),
            makeBin(BinaryExprAST::GREATER_THAN, makeId("n"), makeInt(10))
        );

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(std::move(condition)));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        expectTrue(meta.paramRanges.empty(), "or condition yields no range");
    }

    void testReturnRange() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<EnsuresAST>(
            makeBin(BinaryExprAST::GREATER_EQUAL, makeId("foo"), makeInt(1))
        ));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        expectTrue(meta.returnRange.has_value(), "return range inferred");
        expectTrue(meta.returnRange->hasLower, "return lower set");
        expectEqual(meta.returnRange->lower, 1, "return lower value");
    }

    void testNegativeLiteral() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        auto negTwo = makeNeg(makeInt(2));
        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            makeBin(BinaryExprAST::GREATER_EQUAL, makeId("n"), std::move(negTwo))
        ));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        const auto& range = meta.paramRanges.at("n");
        expectTrue(range.hasLower, "negative literal lower inferred");
        expectEqual(range.lower, -2, "negative literal value");
    }

    void testMismatchedIdentifierIgnored() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            makeBin(BinaryExprAST::GREATER_EQUAL, makeId("m"), makeInt(0))
        ));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        expectTrue(meta.paramRanges.empty(), "unknown identifier ignored");
    }

    void testBoolParamIgnored() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("flag", std::make_unique<TypeAST>(TypeAST::BOOL));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            makeBin(BinaryExprAST::EQUAL, makeId("flag"), makeBool(true))
        ));

        auto blueprint = buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        expectTrue(meta.paramRanges.empty(), "bool parameter ignored for range inference");
    }
}

int main() {
    testLowerBound();
    testUpperBound();
    testEquality();
    testAndIntersection();
    testOrIgnored();
    testReturnRange();
    testNegativeLiteral();
    testMismatchedIdentifierIgnored();
    testBoolParamIgnored();

    if (failures == 0) {
        std::cout << "All metadata inference tests passed.\n";
        return 0;
    }

    std::cerr << failures << " metadata inference test(s) failed.\n";
    return 1;
}
