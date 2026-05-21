#include "../src/analysis/willReturnInferer.hpp"

#include "willReturnInferer_tests.hpp"
#include "test.hpp"

#include <iostream>
#include <memory>
#include <vector>

namespace WillReturnInfererTests {
    int failures = 0;


    void testLeafWillReturn() {
        std::vector<std::unique_ptr<StmtAST>> statements;
        statements.push_back(Tests::makeExprStmt(std::make_unique<IntegerExprAST>(1)));

        std::vector<std::unique_ptr<ProgramAST>> nodes;
        nodes.push_back(Tests::makeFunction("leaf", Tests::makeBlock(std::move(statements))));

        WillReturnInferer inferer;
        auto result = inferer.infer(nodes);
        Tests::expectTrue(result["leaf"], "leaf function should be willreturn", failures);
    }

    void testExitBlocksWillReturn() {
        std::vector<std::unique_ptr<StmtAST>> statements;
        statements.push_back(Tests::makeExitStmt());

        std::vector<std::unique_ptr<ProgramAST>> nodes;
        nodes.push_back(Tests::makeFunction("exitNow", Tests::makeBlock(std::move(statements))));

        WillReturnInferer inferer;
        auto result = inferer.infer(nodes);
        Tests::expectTrue(!result["exitNow"], "exit statement prevents willreturn", failures);
    }

    void testCallChainWillReturn() {
        std::vector<std::unique_ptr<ProgramAST>> nodes;

        std::vector<std::unique_ptr<StmtAST>> leafStatements;
        leafStatements.push_back(Tests::makeExprStmt(std::make_unique<IntegerExprAST>(0)));
        nodes.push_back(Tests::makeFunction("callee", Tests::makeBlock(std::move(leafStatements))));

        std::vector<std::unique_ptr<StmtAST>> callerStatements;
        callerStatements.push_back(Tests::makeExprStmt(Tests::makeCall("callee")));
        nodes.push_back(Tests::makeFunction("caller", Tests::makeBlock(std::move(callerStatements))));

        WillReturnInferer inferer;
        auto result = inferer.infer(nodes);
        Tests::expectTrue(result["callee"], "callee should be willreturn", failures);
        Tests::expectTrue(result["caller"], "caller should be willreturn when callee is willreturn", failures);
    }

    void testCallToExitFunction() {
        std::vector<std::unique_ptr<ProgramAST>> nodes;

        std::vector<std::unique_ptr<StmtAST>> exitStatements;
        exitStatements.push_back(Tests::makeExitStmt());
        nodes.push_back(Tests::makeFunction("exitNow", Tests::makeBlock(std::move(exitStatements))));

        std::vector<std::unique_ptr<StmtAST>> callerStatements;
        callerStatements.push_back(Tests::makeExprStmt(Tests::makeCall("exitNow")));
        nodes.push_back(Tests::makeFunction("caller", Tests::makeBlock(std::move(callerStatements))));

        WillReturnInferer inferer;
        auto result = inferer.infer(nodes);
        Tests::expectTrue(!result["caller"], "caller should not be willreturn if callee is not willreturn", failures);
    }

    void testRecursiveCall() {
        std::vector<std::unique_ptr<StmtAST>> statements;
        statements.push_back(Tests::makeExprStmt(Tests::makeCall("recur")));

        std::vector<std::unique_ptr<ProgramAST>> nodes;
        nodes.push_back(Tests::makeFunction("recur", Tests::makeBlock(std::move(statements))));

        WillReturnInferer inferer;
        auto result = inferer.infer(nodes);
        Tests::expectTrue(result["recur"], "recursive call should infer willreturn", failures);
    }

    int runTests() {
        testLeafWillReturn();
        testExitBlocksWillReturn();
        testCallChainWillReturn();
        testCallToExitFunction();
        testRecursiveCall();

        if (failures == 0) {
            std::cout << "All willreturn inference tests passed.\n";
            return 0;
        }

        std::cerr << failures << " willreturn inference test(s) failed.\n";
        return 1;
    }
}