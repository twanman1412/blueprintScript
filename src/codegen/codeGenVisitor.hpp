#pragma once

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Value.h>

#include <map>
#include <memory>
#include <string>

#include "../ast/commonAST.hpp"

class IntegerExprAST;
class BoolExprAST;
class IdentifierExprAST;
class FunctionCallExprAST;
class BinaryExprAST;
class UnaryExprAST;
class ExprAST;

class TypeAST;

class BlockStmtAST;
class VarDeclStmtAST;
class AssignmentStmtAST;
class IfStmtAST;
class WhileStmtAST;
class ReturnStmtAST;
class ExprStmtAST;
class PrintStmtAST;

class FunctionDeclAST;
class PrintAST;
class BlueprintAST;

class CodeGenVisitor {
public:
    CodeGenVisitor(const std::string& moduleName = "blueprint_module");
    virtual ~CodeGenVisitor() = default;

    llvm::Module* getModule() const { return module.get(); }
    void finalizeTopLevelFunction();

    virtual llvm::Value* visit(IntegerExprAST* node);
    virtual llvm::Value* visit(BoolExprAST* node);
    virtual llvm::Value* visit(IdentifierExprAST* node);
    virtual llvm::Value* visit(FunctionCallExprAST* node);
    virtual llvm::Value* visit(BinaryExprAST* node);
    virtual llvm::Value* visit(UnaryExprAST* node);

    virtual llvm::Value* visit(BlockStmtAST* node);
    virtual llvm::Value* visit(VarDeclStmtAST* node);
    virtual llvm::Value* visit(AssignmentStmtAST* node);
    virtual llvm::Value* visit(IfStmtAST* node);
    virtual llvm::Value* visit(WhileStmtAST* node);
    virtual llvm::Value* visit(ReturnStmtAST* node);
    virtual llvm::Value* visit(ExprStmtAST* node);
    virtual llvm::Value* visit(PrintStmtAST* node);

    virtual llvm::Value* visit(FunctionDeclAST* node);
    virtual llvm::Value* visit(PrintAST* node);

private:
    llvm::Type* getLLVMType(TypeAST::PrimitiveKind kind);
    llvm::Value* toBoolean(llvm::Value* value);
    llvm::Value* loadIfPointer(llvm::Value* value, const std::string& name = "");
    llvm::AllocaInst* createEntryBlockAlloca(llvm::Function* function, const std::string& name, llvm::Type* type);
    llvm::Function* getOrCreatePrintf();
    llvm::Function* getOrCreateFprintf();
    llvm::Function* getOrCreateExit();
    llvm::Value* getOrCreateStderr();
    llvm::Value* getOrCreateErrorFormat();
    llvm::Value* getOrCreateErrorMessage(const std::string& kind);
    llvm::Function* getOrCreateTopLevelFunction();
    llvm::Value* emitPrintValue(llvm::Value* value);
    void emitRuntimeError(const std::string& kind);
    bool emitContractCheck(const ExprAST* condition, const std::string& kind);
    bool emitRequiresChecks();
    bool emitEnsuresChecks();
    bool emitDefaultReturns();
    std::string makeContractMessage(const std::string& kind) const;

    std::unique_ptr<llvm::LLVMContext> context;
    std::unique_ptr<llvm::IRBuilder<>> builder;
    std::unique_ptr<llvm::Module> module;
    std::map<std::string, llvm::Value*> namedValues;
    llvm::Function* currentFunction = nullptr;
    llvm::Function* topLevelFunction = nullptr;
    const BlueprintAST* currentBlueprint = nullptr;
    llvm::AllocaInst* currentReturnSlot = nullptr;
};
