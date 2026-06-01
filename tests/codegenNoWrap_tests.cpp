#include "../src/codegen/codeGenVisitor.hpp"

#include "codegenNoWrap_tests.hpp"
#include "test.hpp"

#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>

#include <iostream>
#include <memory>
#include <string>
#include <vector>

namespace CodegenNoWrapTests {
    int failures = 0;

    static llvm::Instruction* findReturnAddInstruction(CodeGenVisitor& visitor, const std::string& name) {
        llvm::Module* module = visitor.getModule();
        if (!module) {
            return nullptr;
        }

        llvm::Function* function = module->getFunction(name);
        if (!function) {
            return nullptr;
        }

        for (auto& block : *function) {
            for (auto& instruction : block) {
                auto* returnInst = llvm::dyn_cast<llvm::ReturnInst>(&instruction);
                if (!returnInst) {
                    continue;
                }

                llvm::Value* returnValue = returnInst->getReturnValue();
                if (!returnValue) {
                    continue;
                }

                auto* addOp = llvm::dyn_cast<llvm::BinaryOperator>(returnValue);
                if (!addOp) {
                    continue;
                }

                if (addOp->getOpcode() == llvm::Instruction::Add) {
                    return addOp;
                }
            }
        }

        return nullptr;
    }

    static std::unique_ptr<FunctionDeclAST> makeAddFunction(const std::string& name) {
        std::vector<std::pair<std::string, std::unique_ptr<TypeAST>>> params;
        params.emplace_back("a", std::make_unique<TypeAST>(TypeAST::INT32));
        params.emplace_back("b", std::make_unique<TypeAST>(TypeAST::INT32));

        auto expr = Tests::makeBin(BinaryExprAST::PLUS, Tests::makeId("a"), Tests::makeId("b"));
        auto body = std::make_unique<ReturnStmtAST>(std::move(expr));
        return std::make_unique<FunctionDeclAST>(name, std::make_unique<TypeAST>(TypeAST::INT32), std::move(params), std::move(body));
    }

    void testAddSetsNswNuw() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("a", std::make_unique<TypeAST>(TypeAST::INT32));
        inputs.emplace_back("b", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("a"), Tests::makeInt(0))
        ));
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::LESS_EQUAL, Tests::makeId("a"), Tests::makeInt(10))
        ));
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("b"), Tests::makeInt(0))
        ));
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::LESS_EQUAL, Tests::makeId("b"), Tests::makeInt(10))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        auto function = makeAddFunction("addSafe");
        function->setLinkedBlueprint(blueprint.get());

        CodeGenVisitor visitor("test", CodeGenMode::Optimise);
        function->accept(visitor);
        llvm::Instruction* addInstruction = findReturnAddInstruction(visitor, "addSafe");
        if (!addInstruction) {
            Tests::expectTrue(false, "add instruction not found", failures);
            return;
        }

        auto* addOp = llvm::dyn_cast<llvm::BinaryOperator>(addInstruction);
        if (!addOp) {
            Tests::expectTrue(false, "add instruction not found", failures);
            return;
        }

        const bool hasNsw = addOp->hasNoSignedWrap();
        const bool hasNuw = addOp->hasNoUnsignedWrap();
        Tests::expectTrue(hasNsw && hasNuw, "add should have nsw and nuw", failures);
    }

    void testAddSetsOnlyNsw() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("a", std::make_unique<TypeAST>(TypeAST::INT32));
        inputs.emplace_back("b", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("a"), Tests::makeInt(-5))
        ));
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::LESS_EQUAL, Tests::makeId("a"), Tests::makeInt(5))
        ));
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::GREATER_EQUAL, Tests::makeId("b"), Tests::makeInt(0))
        ));
        contracts.push_back(std::make_unique<RequiresAST>(
            Tests::makeBin(BinaryExprAST::LESS_EQUAL, Tests::makeId("b"), Tests::makeInt(10))
        ));

        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        auto function = makeAddFunction("addSignedOnly");
        function->setLinkedBlueprint(blueprint.get());

        CodeGenVisitor visitor("test", CodeGenMode::Optimise);
        function->accept(visitor);
        llvm::Instruction* addInstruction = findReturnAddInstruction(visitor, "addSignedOnly");
        if (!addInstruction) {
            Tests::expectTrue(false, "add instruction not found", failures);
            return;
        }

        auto* addOp = llvm::dyn_cast<llvm::BinaryOperator>(addInstruction);
        if (!addOp) {
            Tests::expectTrue(false, "add instruction not found", failures);
            return;
        }

        const bool hasNsw = addOp->hasNoSignedWrap();
        const bool hasNuw = addOp->hasNoUnsignedWrap();
        Tests::expectTrue(hasNsw, "add should have nsw", failures);
        Tests::expectTrue(!hasNuw, "add should not have nuw", failures);
    }

    void testAddSetsNoFlags() {
        std::vector<InputAST::InputParam> inputs;
        inputs.emplace_back("a", std::make_unique<TypeAST>(TypeAST::INT32));
        inputs.emplace_back("b", std::make_unique<TypeAST>(TypeAST::INT32));

        std::vector<std::unique_ptr<ContractAST>> contracts;
        auto blueprint = Tests::buildBlueprint(std::move(inputs), std::make_unique<TypeAST>(TypeAST::INT32), std::move(contracts));
        auto function = makeAddFunction("addUnknown");
        function->setLinkedBlueprint(blueprint.get());

        CodeGenVisitor visitor("test", CodeGenMode::Optimise);
        function->accept(visitor);
        llvm::Instruction* addInstruction = findReturnAddInstruction(visitor, "addUnknown");
        if (!addInstruction) {
            Tests::expectTrue(false, "add instruction not found", failures);
            return;
        }

        auto* addOp = llvm::dyn_cast<llvm::BinaryOperator>(addInstruction);
        if (!addOp) {
            Tests::expectTrue(false, "add instruction not found", failures);
            return;
        }

        Tests::expectTrue(!addOp->hasNoSignedWrap(), "add should not have nsw", failures);
        Tests::expectTrue(!addOp->hasNoUnsignedWrap(), "add should not have nuw", failures);
    }

    int runTests() {
        testAddSetsNswNuw();
        testAddSetsOnlyNsw();
        testAddSetsNoFlags();

        if (failures == 0) {
            std::cout << "All no-wrap codegen tests passed.\n";
            return 0;
        }

        std::cerr << failures << " no-wrap codegen test(s) failed.\n";
        return 1;
    }
}
