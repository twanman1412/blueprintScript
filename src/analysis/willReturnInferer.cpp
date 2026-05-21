#include "willReturnInferer.hpp"

#include "../ast/functionAST.hpp"
#include "../ast/stmtAST.hpp"
#include "../ast/exprAST.hpp"

#include <set>
#include <stdexcept>

namespace {
    void collectCalleesFromExpr(const ExprAST* expr, std::set<std::string>& callees) {
        if (!expr) {
            return;
        }

        if (auto* call = dynamic_cast<const FunctionCallExprAST*>(expr)) {
            callees.insert(call->getFunctionName());
            for (const auto& arg : call->getArguments()) {
                collectCalleesFromExpr(arg.get(), callees);
            }
            return;
        }

        if (auto* binary = dynamic_cast<const BinaryExprAST*>(expr)) {
            collectCalleesFromExpr(binary->getLHS(), callees);
            collectCalleesFromExpr(binary->getRHS(), callees);
            return;
        }

        if (auto* unary = dynamic_cast<const UnaryExprAST*>(expr)) {
            collectCalleesFromExpr(unary->getOperand(), callees);
            return;
        }
    }

    void collectCalleesFromStmt(const StmtAST* stmt, std::set<std::string>& callees) {
        if (!stmt) {
            return;
        }

        if (auto* block = dynamic_cast<const BlockStmtAST*>(stmt)) {
            for (const auto& child : block->getStatements()) {
                collectCalleesFromStmt(child.get(), callees);
            }
            return;
        }

        if (auto* varDecl = dynamic_cast<const VarDeclStmtAST*>(stmt)) {
            collectCalleesFromExpr(varDecl->getInitializer(), callees);
            return;
        }

        if (auto* assign = dynamic_cast<const AssignmentStmtAST*>(stmt)) {
            collectCalleesFromExpr(assign->getValue(), callees);
            return;
        }

        if (auto* ifStmt = dynamic_cast<const IfStmtAST*>(stmt)) {
            collectCalleesFromExpr(ifStmt->getCondition(), callees);
            collectCalleesFromStmt(ifStmt->getThenStmt(), callees);
            collectCalleesFromStmt(ifStmt->getElseStmt(), callees);
            return;
        }

        if (auto* whileStmt = dynamic_cast<const WhileStmtAST*>(stmt)) {
            collectCalleesFromExpr(whileStmt->getCondition(), callees);
            collectCalleesFromStmt(whileStmt->getBody(), callees);
            return;
        }

        if (auto* retStmt = dynamic_cast<const ReturnStmtAST*>(stmt)) {
            collectCalleesFromExpr(retStmt->getValue(), callees);
            return;
        }

        if (auto* exprStmt = dynamic_cast<const ExprStmtAST*>(stmt)) {
            collectCalleesFromExpr(exprStmt->getExpr(), callees);
            return;
        }

        if (auto* printStmt = dynamic_cast<const PrintStmtAST*>(stmt)) {
            collectCalleesFromExpr(printStmt->getExpr(), callees);
            return;
        }

        if (auto* exitStmt = dynamic_cast<const ExitStmtAST*>(stmt)) {
            collectCalleesFromExpr(exitStmt->getExpr(), callees);
            return;
        }
    }

    bool containsExit(const StmtAST* stmt) {
        if (!stmt) {
            return false;
        }

        if (dynamic_cast<const ExitStmtAST*>(stmt)) {
            return true;
        }

        if (auto* block = dynamic_cast<const BlockStmtAST*>(stmt)) {
            for (const auto& child : block->getStatements()) {
                if (containsExit(child.get())) {
                    return true;
                }
            }
            return false;
        }

        if (auto* ifStmt = dynamic_cast<const IfStmtAST*>(stmt)) {
            if (containsExit(ifStmt->getThenStmt())) {
                return true;
            }
            return containsExit(ifStmt->getElseStmt());
        }

        if (auto* whileStmt = dynamic_cast<const WhileStmtAST*>(stmt)) {
            return containsExit(whileStmt->getBody());
        }

        return false;
    }
}

std::unordered_map<std::string, bool> WillReturnInferer::infer(const std::vector<std::unique_ptr<ProgramAST>>& nodes) const {
    std::unordered_map<std::string, bool> result;

    for (const auto& node : nodes) {
        auto* func = dynamic_cast<const FunctionDeclAST*>(node.get());
        if (!func) {
            continue;
        }

        const std::string& name = func->getFunctionName();
        if (containsExit(func->getBody())) {
            result[name] = false;
            continue;
        }

        std::set<std::string> called;
        collectCalleesFromStmt(func->getBody(), called);

        bool allReturn = true;
        for (const auto& callee : called) {
            if (callee == name) {
                continue;
            }

            auto it = result.find(callee);
            if (it == result.end()) {
                throw std::runtime_error("error while elaborating: unknown callee '" + callee + "'");
            }
            if (!it->second) {
                allReturn = false;
                break;
            }
        }

        result[name] = allReturn;
    }

    return result;
}
