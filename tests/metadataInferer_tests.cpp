#include "../src/analysis/metadataInferer.hpp"

#include "metadataInferer_tests.hpp"
#include "test.hpp"

#include <iostream>
#include <memory>
#include <vector>

namespace MetadataInfererTests {
    int failures = 0;

    void testLowerBound() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("n"), Tests::makeInt(0))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        Tests::expectTrue(meta.paramRanges.count("n") == 1, "lower bound inferred for n", failures);
        const auto& range = meta.paramRanges.at("n");
        Tests::expectTrue(range.hasLower, "lower bound flag set", failures);
        Tests::expectEqual(range.lower, 0, "lower bound value", failures);
    }

    void testUpperBound() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::LESS_THAN, Tests::makeId("n"), Tests::makeInt(10))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        Tests::expectTrue(meta.paramRanges.count("n") == 1, "upper bound inferred for n", failures);
        const auto& range = meta.paramRanges.at("n");
        Tests::expectTrue(range.hasUpper, "upper bound flag set", failures);
        Tests::expectEqual(range.upper, 9, "upper bound value", failures);
    }

    void testEquality() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::EQUAL, Tests::makeId("n"), Tests::makeInt(5))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        const auto& range = meta.paramRanges.at("n");
        Tests::expectTrue(range.hasLower && range.hasUpper, "equality sets both bounds", failures);
        Tests::expectEqual(range.lower, 5, "equality lower value", failures);
        Tests::expectEqual(range.upper, 5, "equality upper value", failures);
    }

    void testAndIntersection() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        auto condition = Tests::makeBin(
            BinaryExprAST::LOGICAL_AND,
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("n"), Tests::makeInt(0)),
            Tests::makeBin(BinaryExprAST::LESS_EQUAL, Tests::makeId("n"), Tests::makeInt(10))
        );

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(std::move(condition)));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        const auto& range = meta.paramRanges.at("n");
        Tests::expectTrue(range.hasLower && range.hasUpper, "intersection bounds set", failures);
        Tests::expectEqual(range.lower, 0, "intersection lower", failures);
        Tests::expectEqual(range.upper, 10, "intersection upper", failures);
    }

    void testOrIgnored() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        auto condition = Tests::makeBin(
            BinaryExprAST::LOGICAL_OR,
            Tests::makeBin(BinaryExprAST::LESS_THAN, Tests::makeId("n"), Tests::makeInt(0)),
            Tests::makeBin(BinaryExprAST::GREATER_THAN, Tests::makeId("n"), Tests::makeInt(10))
        );

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(std::move(condition)));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        Tests::expectTrue(meta.paramRanges.empty(), "or condition yields no range", failures);
    }

    void testReturnRange() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<EnsuresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("foo"), Tests::makeInt(1))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        Tests::expectTrue(meta.returnRange.has_value(), "return range inferred", failures);
        Tests::expectTrue(meta.returnRange->hasLower, "return lower set", failures);
        Tests::expectEqual(meta.returnRange->lower, 1, "return lower value", failures);
    }

    void testNegativeLiteral() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        auto negTwo = Tests::makeNeg(Tests::makeInt(2));
        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("n"), std::move(negTwo))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        const auto& range = meta.paramRanges.at("n");
        Tests::expectTrue(range.hasLower, "negative literal lower inferred", failures);
        Tests::expectEqual(range.lower, -2, "negative literal value", failures);
    }

    void testMismatchedIdentifierIgnored() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("m"), Tests::makeInt(0))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        Tests::expectTrue(meta.paramRanges.empty(), "unknown identifier ignored", failures);
    }

    void testBoolParamIgnored() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("flag", std::make_unique<TypeAST>(TypeAST::BOOL));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::EQUAL, Tests::makeId("flag"), Tests::makeBool(true))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        Tests::expectTrue(meta.paramRanges.empty(), "bool parameter ignored for range inference", failures);
    }

    void testMultipleContracts() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("n", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("n"), Tests::makeInt(0))
        ));
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::LESS_EQUAL, Tests::makeId("n"), Tests::makeInt(10))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        ContractMetadataInferer inferer;
        auto meta = inferer.infer(blueprint.get(), "foo");

        const auto& range = meta.paramRanges.at("n");
        Tests::expectTrue(range.hasLower && range.hasUpper, "multiple contracts intersected", failures);
        Tests::expectEqual(range.lower, 0, "intersection lower", failures);
        Tests::expectEqual(range.upper, 10, "intersection upper", failures);
    }

    int runTests() {
        testLowerBound();
        testUpperBound();
        testEquality();
        testAndIntersection();
        testOrIgnored();
        testReturnRange();
        testNegativeLiteral();
        testMismatchedIdentifierIgnored();
        testBoolParamIgnored();
        testMultipleContracts();
        if (failures == 0) {
            std::cout << "All metadata inference tests passed.\n";
            return 0;
        }

        std::cerr << failures << " metadata inference test(s) failed.\n";
        return 1;
    }
}