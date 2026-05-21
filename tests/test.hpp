#include <iostream>
#include <memory>
#include <string>
#include <vector>

#include "../src/ast/stmtAST.hpp"
#include "../src/ast/exprAST.hpp"
#include "../src/ast/programAST.hpp"
#include "../src/ast/commonAST.hpp"
#include "../src/ast/functionAST.hpp"
#include "../src/ast/blueprintAST.hpp"

namespace Tests {
    inline void expectTrue(bool condition, const std::string& message, int& failures) {
        if (!condition) {
            std::cerr << "FAIL: " << message << "\n";
            ++failures;
        }
    }

    inline void expectEqual(long long actual, long long expected, const std::string& message, int& failures) {
        if (actual != expected) {
            std::cerr << "FAIL: " << message << " (expected " << expected << ", got " << actual << ")\n";
            ++failures;
        }
    }

    inline std::unique_ptr<ExprAST> makeCall(const std::string& name, std::vector<std::unique_ptr<ExprAST>> args = {}) {
        return std::make_unique<FunctionCallExprAST>(name, std::move(args));
    }

    inline std::unique_ptr<StmtAST> makeExprStmt(std::unique_ptr<ExprAST> expr) {
        return std::make_unique<ExprStmtAST>(std::move(expr));
    }

    inline std::unique_ptr<StmtAST> makeExitStmt() {
        return std::make_unique<ExitStmtAST>(std::make_unique<IntegerExprAST>(0));
    }

    inline std::unique_ptr<StmtAST> makeBlock(std::vector<std::unique_ptr<StmtAST>> statements) {
        return std::make_unique<BlockStmtAST>(std::move(statements));
    }

    inline std::unique_ptr<FunctionDeclAST> makeFunction(const std::string& name, std::unique_ptr<StmtAST> body) {
        std::vector<std::pair<std::string, std::unique_ptr<TypeAST>>> params;
        return std::make_unique<FunctionDeclAST>(name, std::make_unique<TypeAST>(TypeAST::VOID), std::move(params), std::move(body));
    }

    inline std::vector<std::unique_ptr<ProgramAST>> makeProgram(std::vector<std::unique_ptr<ProgramAST>> nodes) {
        return nodes;
    }

    inline std::unique_ptr<ExprAST> makeInt(long long value) {
        return std::make_unique<IntegerExprAST>(value);
    }

    inline std::unique_ptr<ExprAST> makeBool(bool value) {
        return std::make_unique<BoolExprAST>(value);
    }

    inline std::unique_ptr<ExprAST> makeId(const std::string& name) {
        return std::make_unique<IdentifierExprAST>(name);
    }

    inline std::unique_ptr<ExprAST> makeNeg(std::unique_ptr<ExprAST> expr) {
        return std::make_unique<UnaryExprAST>(UnaryExprAST::NEGATE, std::move(expr));
    }

    inline std::unique_ptr<ExprAST> makeBin(BinaryExprAST::Operator op, std::unique_ptr<ExprAST> lhs, std::unique_ptr<ExprAST> rhs) {
        return std::make_unique<BinaryExprAST>(op, std::move(lhs), std::move(rhs));
    }

    inline std::unique_ptr<BlueprintAST> buildBlueprint(std::vector<InputAST::InputParam> inputs,
                                                        std::unique_ptr<TypeAST> outputType,
                                                        std::vector<std::unique_ptr<ContractAST>> contracts) {
        contracts.insert(contracts.begin(), std::make_unique<InputAST>(std::move(inputs)));
        if (outputType) {
            contracts.insert(contracts.begin() + 1, std::make_unique<OutputAST>(std::move(outputType)));
        }
        return std::make_unique<BlueprintAST>("test", std::move(contracts));
    }

}