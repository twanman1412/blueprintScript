#include "elaborationPass.hpp"

#include "expressionSimplifier.hpp"

#include "../ast/blueprintAST.hpp"
#include "../ast/functionAST.hpp"
#include "../ast/stmtAST.hpp"

namespace {
    std::unique_ptr<TypeAST> cloneType(const TypeAST* type) {
        if (!type) {
            return nullptr;
        }
        return std::make_unique<TypeAST>(type->getKind());
    }

    std::unique_ptr<ExprAST> simplifyExpr(const ExprAST* expr, const ExpressionSimplifier& simplifier) {
        return simplifier.simplify(expr);
    }

    std::unique_ptr<StmtAST> simplifyStmt(const StmtAST* stmt, const ExpressionSimplifier& simplifier) {
        if (!stmt) {
            return nullptr;
        }

        if (auto* block = dynamic_cast<const BlockStmtAST*>(stmt)) {
            std::vector<std::unique_ptr<StmtAST>> statements;
            statements.reserve(block->getStatements().size());
            for (const auto& child : block->getStatements()) {
                statements.push_back(simplifyStmt(child.get(), simplifier));
            }
            return std::make_unique<BlockStmtAST>(std::move(statements));
        }
        if (auto* varDecl = dynamic_cast<const VarDeclStmtAST*>(stmt)) {
            return std::make_unique<VarDeclStmtAST>(
                cloneType(varDecl->getType()),
                varDecl->getName(),
                simplifyExpr(varDecl->getInitializer(), simplifier)
            );
        }
        if (auto* assign = dynamic_cast<const AssignmentStmtAST*>(stmt)) {
            return std::make_unique<AssignmentStmtAST>(
                assign->getName(),
                simplifyExpr(assign->getValue(), simplifier)
            );
        }
        if (auto* ifStmt = dynamic_cast<const IfStmtAST*>(stmt)) {
            return std::make_unique<IfStmtAST>(
                simplifyExpr(ifStmt->getCondition(), simplifier),
                simplifyStmt(ifStmt->getThenStmt(), simplifier),
                simplifyStmt(ifStmt->getElseStmt(), simplifier)
            );
        }
        if (auto* whileStmt = dynamic_cast<const WhileStmtAST*>(stmt)) {
            return std::make_unique<WhileStmtAST>(
                simplifyExpr(whileStmt->getCondition(), simplifier),
                simplifyStmt(whileStmt->getBody(), simplifier)
            );
        }
        if (auto* retStmt = dynamic_cast<const ReturnStmtAST*>(stmt)) {
            return std::make_unique<ReturnStmtAST>(
                simplifyExpr(retStmt->getValue(), simplifier)
            );
        }
        if (auto* exprStmt = dynamic_cast<const ExprStmtAST*>(stmt)) {
            return std::make_unique<ExprStmtAST>(
                simplifyExpr(exprStmt->getExpr(), simplifier)
            );
        }
        if (auto* printStmt = dynamic_cast<const PrintStmtAST*>(stmt)) {
            return std::make_unique<PrintStmtAST>(
                simplifyExpr(printStmt->getExpr(), simplifier)
            );
        }
        if (auto* exitStmt = dynamic_cast<const ExitStmtAST*>(stmt)) {
            return std::make_unique<ExitStmtAST>(
                simplifyExpr(exitStmt->getExpr(), simplifier)
            );
        }

        return nullptr;
    }

    std::unique_ptr<ProgramAST> simplifyProgram(const ProgramAST* node, const ExpressionSimplifier& simplifier) {
        if (!node) {
            return nullptr;
        }

        if (auto* blueprint = dynamic_cast<const BlueprintAST*>(node)) {
            std::vector<std::unique_ptr<ContractAST>> contracts;
            contracts.reserve(blueprint->getContracts().size());
            for (const auto& contract : blueprint->getContracts()) {
                if (auto* input = dynamic_cast<const InputAST*>(contract.get())) {
                    std::vector<InputAST::InputParam> params;
                    params.reserve(input->getParams().size());
                    for (const auto& param : input->getParams()) {
                        params.emplace_back(param.first, cloneType(param.second.get()));
                    }
                    contracts.push_back(std::make_unique<InputAST>(std::move(params)));
                    continue;
                }
                if (auto* output = dynamic_cast<const OutputAST*>(contract.get())) {
                    contracts.push_back(std::make_unique<OutputAST>(cloneType(output->getType())));
                    continue;
                }
                if (auto* requires = dynamic_cast<const RequiresAST*>(contract.get())) {
                    contracts.push_back(std::make_unique<RequiresAST>(
                        simplifyExpr(requires->getCondition(), simplifier)
                    ));
                    continue;
                }
                if (auto* ensures = dynamic_cast<const EnsuresAST*>(contract.get())) {
                    contracts.push_back(std::make_unique<EnsuresAST>(
                        simplifyExpr(ensures->getCondition(), simplifier)
                    ));
                    continue;
                }
                if (auto* def = dynamic_cast<const DefaultAST*>(contract.get())) {
                    contracts.push_back(std::make_unique<DefaultAST>(
                        simplifyExpr(def->getCondition(), simplifier),
                        simplifyExpr(def->getValue(), simplifier)
                    ));
                    continue;
                }
            }

            return std::make_unique<BlueprintAST>(blueprint->getName(), std::move(contracts));
        }

        if (auto* func = dynamic_cast<const FunctionDeclAST*>(node)) {
            std::vector<std::pair<std::string, std::unique_ptr<TypeAST>>> params;
            params.reserve(func->getParameters().size());
            for (const auto& param : func->getParameters()) {
                params.emplace_back(param.first, cloneType(param.second.get()));
            }

            return std::make_unique<FunctionDeclAST>(
                func->getFunctionName(),
                cloneType(func->getType()),
                std::move(params),
                simplifyStmt(func->getBody(), simplifier)
            );
        }

        if (auto* printAst = dynamic_cast<const PrintAST*>(node)) {
            return std::make_unique<PrintAST>(
                simplifyExpr(printAst->getValue(), simplifier)
            );
        }

        return nullptr;
    }
}

void ElaborationPass::elaborate(std::vector<std::unique_ptr<ProgramAST>>& nodes) const {
    ExpressionSimplifier simplifier;
    for (auto& node : nodes) {
        auto simplified = simplifyProgram(node.get(), simplifier);
        if (simplified) {
            node = std::move(simplified);
        }
    }
}
