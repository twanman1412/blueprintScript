#include "codeGenVisitor.hpp"

#include "../ast/commonAST.hpp"
#include "../ast/exprAST.hpp"
#include "../ast/blueprintAST.hpp"
#include "../ast/stmtAST.hpp"
#include "../ast/functionAST.hpp"
#include "../logger.hpp"

#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Attributes.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Type.h>
#include <llvm/Support/Casting.h>

#include <array>
#include <vector>

namespace {
	void logCodegen(const std::string& message) {
		logger.debugln("[codegen] " + message);
	}
}

CodeGenVisitor::CodeGenVisitor(const std::string& moduleName,
                               CodeGenMode mode,
                               std::unordered_map<std::string, bool> willReturnMap)
	: mode(mode), willReturnMap(std::move(willReturnMap)) {
    context = std::make_unique<llvm::LLVMContext>();
    builder = std::make_unique<llvm::IRBuilder<>>(*context);
    module = std::make_unique<llvm::Module>(moduleName, *context);
}

void CodeGenVisitor::finalizeTopLevelFunction() {
    if (!topLevelFunction) {
        return;
    }

    llvm::BasicBlock& lastBlock = topLevelFunction->back();
    if (!lastBlock.getTerminator()) {
        auto* zero = llvm::ConstantInt::get(llvm::Type::getInt32Ty(*context), 0);
        builder->SetInsertPoint(&lastBlock);
        builder->CreateRet(zero);
    }
}

llvm::Type* CodeGenVisitor::getLLVMType(TypeAST::PrimitiveKind kind) {
    switch (kind) {
        case TypeAST::INT32:
            return llvm::Type::getInt32Ty(*context);
        case TypeAST::BOOL:
            return llvm::Type::getInt1Ty(*context);
        case TypeAST::VOID:
            return llvm::Type::getVoidTy(*context);
        default:
            return llvm::Type::getVoidTy(*context);
    }
}

llvm::Value* CodeGenVisitor::toBoolean(llvm::Value* value) {
    if (!value) {
        return nullptr;
    }

    if (value->getType()->isIntegerTy(1)) {
        return value;
    }

    if (value->getType()->isIntegerTy()) {
        return builder->CreateICmpNE(
            value,
            llvm::ConstantInt::get(value->getType(), 0),
            "tobool"
        );
    }

    return nullptr;
}

llvm::Value* CodeGenVisitor::loadIfPointer(llvm::Value* value, const std::string& name) {
    if (!value) {
        return nullptr;
    }

    if (auto* allocaInst = llvm::dyn_cast<llvm::AllocaInst>(value)) {
        return builder->CreateLoad(allocaInst->getAllocatedType(), allocaInst, name);
    }

    return value;
}

llvm::AllocaInst* CodeGenVisitor::createEntryBlockAlloca(llvm::Function* function, const std::string& name, llvm::Type* type) {
    llvm::IRBuilder<> tmpBuilder(&function->getEntryBlock(), function->getEntryBlock().begin());
    return tmpBuilder.CreateAlloca(type, nullptr, name);
}

llvm::Function* CodeGenVisitor::getOrCreatePrintf() {
    if (auto* fn = module->getFunction("printf")) {
        return fn;
    }

    auto* i8PtrType = llvm::PointerType::get(*context, 0);
    std::vector<llvm::Type*> params = { i8PtrType };
    auto* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*context), params, true);
    return llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "printf", module.get());
}

llvm::Function* CodeGenVisitor::getOrCreateFprintf() {
    if (auto* fn = module->getFunction("fprintf")) {
        return fn;
    }

    auto* i8PtrType = llvm::PointerType::get(*context, 0);
    std::vector<llvm::Type*> params = { i8PtrType, i8PtrType };
    auto* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*context), params, true);
    return llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "fprintf", module.get());
}

llvm::Function* CodeGenVisitor::getOrCreateExit() {
    if (auto* fn = module->getFunction("exit")) {
        return fn;
    }

    std::vector<llvm::Type*> params = { llvm::Type::getInt32Ty(*context) };
    auto* funcType = llvm::FunctionType::get(llvm::Type::getVoidTy(*context), params, false);
    return llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "exit", module.get());
}

llvm::Value* CodeGenVisitor::getOrCreateStderr() {
    auto* i8PtrType = llvm::PointerType::get(*context, 0);
    auto* global = module->getNamedGlobal("stderr");
    if (!global) {
        global = new llvm::GlobalVariable(
            *module,
            i8PtrType,
            false,
            llvm::GlobalValue::ExternalLinkage,
            nullptr,
            "stderr"
        );
    }

    return builder->CreateLoad(i8PtrType, global, "stderr");
}

llvm::Value* CodeGenVisitor::getOrCreateErrorFormat() {
    auto* global = module->getNamedGlobal("errfmt");
    if (!global) {
        global = builder->CreateGlobalString("%s\n", "errfmt");
    }

    auto* zero = llvm::ConstantInt::get(llvm::Type::getInt32Ty(*context), 0);
    std::array<llvm::Constant*, 2> indices = { zero, zero };
    return llvm::ConstantExpr::getInBoundsGetElementPtr(
        global->getValueType(),
        global,
        indices
    );
}

llvm::Value* CodeGenVisitor::getOrCreateErrorMessage(const std::string& kind) {
    const std::string name = kind == "requires" ? "errmsg.requires" : "errmsg.ensures";
    const std::string message = kind == "requires" ? "Contract violation: requires failed" : "Contract violation: ensures failed";
    auto* global = module->getNamedGlobal(name);
    if (!global) {
        global = builder->CreateGlobalString(message, name);
    }

    auto* zero = llvm::ConstantInt::get(llvm::Type::getInt32Ty(*context), 0);
    std::array<llvm::Constant*, 2> indices = { zero, zero };
    return llvm::ConstantExpr::getInBoundsGetElementPtr(
        global->getValueType(),
        global,
        indices
    );
}

void CodeGenVisitor::emitRuntimeError(const std::string& kind) {
    auto* fprintfFn = getOrCreateFprintf();
    auto* exitFn = getOrCreateExit();
    auto* stderrValue = getOrCreateStderr();
    auto* formatPtr = getOrCreateErrorFormat();
    auto* msgPtr = getOrCreateErrorMessage(kind);

    builder->CreateCall(fprintfFn, { stderrValue, formatPtr, msgPtr });
    builder->CreateCall(exitFn, { llvm::ConstantInt::get(llvm::Type::getInt32Ty(*context), 1) });
    builder->CreateUnreachable();
}

std::string CodeGenVisitor::makeContractMessage(const std::string& kind) const {
    return "Contract violation: " + kind + " failed";
}

bool CodeGenVisitor::emitContractCheck(const ExprAST* condition, const std::string& kind) {
    const std::string message = makeContractMessage(kind);
    if (!condition) {
        logCodegen("contract check missing condition: " + message);
        return false;
    }

    auto* conditionExpr = const_cast<ExprAST*>(condition);
    llvm::Value* value = conditionExpr->accept(*this);
    value = toBoolean(value);
    if (!value) {
        logCodegen("contract condition evaluation failed: " + message);
        return false;
    }

    llvm::Function* function = builder->GetInsertBlock()->getParent();
    llvm::BasicBlock* okBlock = llvm::BasicBlock::Create(*context, "contract.ok", function);
    llvm::BasicBlock* failBlock = llvm::BasicBlock::Create(*context, "contract.fail", function);

    builder->CreateCondBr(value, okBlock, failBlock);

    builder->SetInsertPoint(failBlock);
    emitRuntimeError(kind);

    builder->SetInsertPoint(okBlock);
    return true;
}

bool CodeGenVisitor::emitRequiresChecks() {
    if (!currentBlueprint) {
        return true;
    }

    logCodegen("emit requires checks");

    for (const auto& contract : currentBlueprint->getContracts()) {
        auto* requiresContract = dynamic_cast<RequiresAST*>(contract.get());
        if (!requiresContract) {
            continue;
        }
        if (!emitContractCheck(requiresContract->getCondition(), "requires")) {
            logCodegen("requires check emission failed");
            return false;
        }
    }

    return true;
}

bool CodeGenVisitor::emitEnsuresChecks() {
    if (!currentBlueprint) {
        return true;
    }

    logCodegen("emit ensures checks");

    for (const auto& contract : currentBlueprint->getContracts()) {
        auto* ensuresContract = dynamic_cast<EnsuresAST*>(contract.get());
        if (!ensuresContract) {
            continue;
        }
        if (!emitContractCheck(ensuresContract->getCondition(), "ensures")) {
            logCodegen("ensures check emission failed");
            return false;
        }
    }

    return true;
}

bool CodeGenVisitor::emitDefaultReturns() {
    if (!currentBlueprint) {
        return true;
    }

    logCodegen("emit default returns");

    if (!currentFunction) {
        return false;
    }

    auto* returnType = currentFunction->getReturnType();
    for (const auto& contract : currentBlueprint->getContracts()) {
        auto* defaultContract = dynamic_cast<DefaultAST*>(contract.get());
        if (!defaultContract) {
            continue;
        }

        auto* conditionExpr = const_cast<ExprAST*>(defaultContract->getCondition());
        llvm::Value* conditionValue = conditionExpr ? conditionExpr->accept(*this) : nullptr;
        conditionValue = toBoolean(conditionValue);
        if (!conditionValue) {
            logCodegen("default condition evaluation failed");
            return false;
        }

        llvm::Function* function = builder->GetInsertBlock()->getParent();
        llvm::BasicBlock* returnBlock = llvm::BasicBlock::Create(*context, "default.return", function);
        llvm::BasicBlock* nextBlock = llvm::BasicBlock::Create(*context, "default.next", function);
        builder->CreateCondBr(conditionValue, returnBlock, nextBlock);

        builder->SetInsertPoint(returnBlock);
        llvm::Value* value = nullptr;
        if (defaultContract->getValue()) {
            value = const_cast<ExprAST*>(defaultContract->getValue())->accept(*this);
            if (!value && !returnType->isVoidTy()) {
                logCodegen("default return value evaluation failed");
                return false;
            }
        }
        if (currentReturnSlot && value) {
            builder->CreateStore(value, currentReturnSlot);
        }
        if (!emitEnsuresChecks()) {
            logCodegen("ensures checks failed before default return");
            return false;
        }
        if (returnType->isVoidTy()) {
            builder->CreateRetVoid();
        } else {
            builder->CreateRet(value);
        }

        builder->SetInsertPoint(nextBlock);
    }

    return true;
}

llvm::Function* CodeGenVisitor::getOrCreateTopLevelFunction() {
    if (topLevelFunction) {
        return topLevelFunction;
    }

    auto* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*context), false);
    topLevelFunction = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "main", module.get());
    applyGeneralFunctionAttributes(topLevelFunction);
    auto* entry = llvm::BasicBlock::Create(*context, "entry", topLevelFunction);
    builder->SetInsertPoint(entry);
    return topLevelFunction;
}

llvm::Value* CodeGenVisitor::emitPrintValue(llvm::Value* value) {
    if (!value) {
        return nullptr;
    }

    auto* printfFn = getOrCreatePrintf();
    llvm::Value* printable = value;
    if (value->getType()->isIntegerTy(1)) {
        printable = builder->CreateZExt(value, llvm::Type::getInt32Ty(*context), "booltoint");
    }

    auto* formatGlobal = builder->CreateGlobalString("%d\n", "fmt");
    auto* zero = llvm::ConstantInt::get(llvm::Type::getInt32Ty(*context), 0);
    std::array<llvm::Constant*, 2> indices = { zero, zero };
    auto* formatPtr = llvm::ConstantExpr::getInBoundsGetElementPtr(
        formatGlobal->getValueType(),
        formatGlobal,
        indices
    );
    return builder->CreateCall(printfFn, {formatPtr, printable});
}

void CodeGenVisitor::applyGeneralFunctionAttributes(llvm::Function* function) {
    if (!function) {
        return;
    }

    function->addFnAttr(llvm::Attribute::NoUnwind);
    if (!function->getReturnType()->isVoidTy()) {
        function->addRetAttr(llvm::Attribute::NoUndef);
    }

    for (auto& arg : function->args()) {
        arg.addAttr(llvm::Attribute::NoUndef);
    }
}

void CodeGenVisitor::applyWillReturnAttribute(llvm::Function* function) {
    if (!function || mode != CodeGenMode::Optimise) {
        return;
    }

    auto it = willReturnMap.find(function->getName().str());
    if (it == willReturnMap.end() || !it->second) {
        return;
    }

    function->addFnAttr(llvm::Attribute::WillReturn);
}

llvm::Value* CodeGenVisitor::visit(IntegerExprAST* node) {
    return llvm::ConstantInt::get(*context, llvm::APInt(32, node->getValue(), true));
}

llvm::Value* CodeGenVisitor::visit(BoolExprAST* node) {
    return llvm::ConstantInt::get(*context, llvm::APInt(1, node->getValue(), false));
}

llvm::Value* CodeGenVisitor::visit(IdentifierExprAST* node) {
    auto it = namedValues.find(node->getName());
    if (it == namedValues.end()) {
        return nullptr;
    }
    return loadIfPointer(it->second, node->getName());
}

llvm::Value* CodeGenVisitor::visit(FunctionCallExprAST* node) {
    logCodegen("visit FunctionCallExprAST: " + node->getFunctionName());
    llvm::Function* callee = module->getFunction(node->getFunctionName());
    if (!callee) {
        logCodegen("missing callee: " + node->getFunctionName());
        return nullptr;
    }

    std::vector<llvm::Value*> args;
    args.reserve(node->getArguments().size());
    for (const auto& arg : node->getArguments()) {
        auto* argValue = arg->accept(*this);
        if (!argValue) {
            logCodegen("failed argument codegen for call: " + node->getFunctionName());
            return nullptr;
        }
        args.push_back(argValue);
    }

    return builder->CreateCall(callee, args, callee->getReturnType()->isVoidTy() ? "" : "calltmp");
}

llvm::Value* CodeGenVisitor::visit(BinaryExprAST* node) {
    llvm::Value* lhs = node->getLHS()->accept(*this);
    llvm::Value* rhs = node->getRHS()->accept(*this);
    if (!lhs || !rhs) {
        return nullptr;
    }

    switch (node->getOp()) {
        case BinaryExprAST::PLUS:
            return builder->CreateAdd(lhs, rhs, "addtmp");
        case BinaryExprAST::MINUS:
            return builder->CreateSub(lhs, rhs, "subtmp");
        case BinaryExprAST::MULTIPLY:
            return builder->CreateMul(lhs, rhs, "multmp");
        case BinaryExprAST::DIVIDE:
            return builder->CreateSDiv(lhs, rhs, "divtmp");
        case BinaryExprAST::MODULO:
            return builder->CreateSRem(lhs, rhs, "modtmp");
        case BinaryExprAST::EQUAL:
            return builder->CreateICmpEQ(lhs, rhs, "eqtmp");
        case BinaryExprAST::NOT_EQUAL:
            return builder->CreateICmpNE(lhs, rhs, "netmp");
        case BinaryExprAST::LESS_THAN:
            return builder->CreateICmpSLT(lhs, rhs, "lttmp");
        case BinaryExprAST::LESS_EQUAL:
            return builder->CreateICmpSLE(lhs, rhs, "letmp");
        case BinaryExprAST::GREATER_THAN:
            return builder->CreateICmpSGT(lhs, rhs, "gttmp");
        case BinaryExprAST::GREATER_EQUAL:
            return builder->CreateICmpSGE(lhs, rhs, "getmp");
        case BinaryExprAST::LOGICAL_AND: {
            llvm::Value* lhsBool = toBoolean(lhs);
            llvm::Value* rhsBool = toBoolean(rhs);
            if (!lhsBool || !rhsBool) {
                return nullptr;
            }
            return builder->CreateAnd(lhsBool, rhsBool, "andtmp");
        }
        case BinaryExprAST::LOGICAL_OR: {
            llvm::Value* lhsBool = toBoolean(lhs);
            llvm::Value* rhsBool = toBoolean(rhs);
            if (!lhsBool || !rhsBool) {
                return nullptr;
            }
            return builder->CreateOr(lhsBool, rhsBool, "ortmp");
        }
        default:
            return nullptr;
    }
}

llvm::Value* CodeGenVisitor::visit(UnaryExprAST* node) {
    llvm::Value* operand = node->getOperand()->accept(*this);
    if (!operand) {
        return nullptr;
    }

    switch (node->getOp()) {
        case UnaryExprAST::NEGATE:
            return builder->CreateNeg(operand, "negtmp");
        case UnaryExprAST::NOT: {
            llvm::Value* boolValue = toBoolean(operand);
            if (!boolValue) {
                return nullptr;
            }
            return builder->CreateNot(boolValue, "nottmp");
        }
        default:
            return nullptr;
    }
}

llvm::Value* CodeGenVisitor::visit(BlockStmtAST* node) {
    auto savedValues = namedValues;
    llvm::Value* last = nullptr;
    for (const auto& stmt : node->getStatements()) {
        if (!stmt) {
            return nullptr;
        }
        last = stmt->accept(*this);
    }
    namedValues = std::move(savedValues);
    return last;
}

llvm::Value* CodeGenVisitor::visit(VarDeclStmtAST* node) {
    if (!currentFunction) {
        return nullptr;
    }

    llvm::Type* llvmType = getLLVMType(node->getType()->getKind());
    llvm::AllocaInst* alloca = createEntryBlockAlloca(currentFunction, node->getName(), llvmType);

    llvm::Value* initValue = nullptr;
    if (node->getInitializer()) {
        initValue = node->getInitializer()->accept(*this);
        if (!initValue) {
            return nullptr;
        }
    } else {
        initValue = llvm::Constant::getNullValue(llvmType);
    }

    builder->CreateStore(initValue, alloca);
    namedValues[node->getName()] = alloca;
    return alloca;
}

llvm::Value* CodeGenVisitor::visit(AssignmentStmtAST* node) {
    auto it = namedValues.find(node->getName());
    if (it == namedValues.end()) {
        return nullptr;
    }

    llvm::Value* value = node->getValue()->accept(*this);
    if (!value) {
        return nullptr;
    }

    builder->CreateStore(value, it->second);
    return value;
}

llvm::Value* CodeGenVisitor::visit(IfStmtAST* node) {
    llvm::Value* condition = node->getCondition()->accept(*this);
    condition = toBoolean(condition);
    if (!condition) {
        return nullptr;
    }

    llvm::Function* function = builder->GetInsertBlock()->getParent();
    llvm::BasicBlock* thenBlock = llvm::BasicBlock::Create(*context, "then", function);
    llvm::BasicBlock* elseBlock = llvm::BasicBlock::Create(*context, "else", function);
    llvm::BasicBlock* mergeBlock = llvm::BasicBlock::Create(*context, "ifcont", function);

    builder->CreateCondBr(condition, thenBlock, elseBlock);

    builder->SetInsertPoint(thenBlock);
    llvm::Value* thenValue = node->getThenStmt()->accept(*this);
    if (!builder->GetInsertBlock()->getTerminator()) {
        builder->CreateBr(mergeBlock);
    }

    builder->SetInsertPoint(elseBlock);
    llvm::Value* elseValue = nullptr;
    if (node->getElseStmt()) {
        elseValue = node->getElseStmt()->accept(*this);
    }
    if (!builder->GetInsertBlock()->getTerminator()) {
        builder->CreateBr(mergeBlock);
    }

    builder->SetInsertPoint(mergeBlock);
    return thenValue ? thenValue : elseValue;
}

llvm::Value* CodeGenVisitor::visit(WhileStmtAST* node) {
    llvm::Function* function = builder->GetInsertBlock()->getParent();
    llvm::BasicBlock* condBlock = llvm::BasicBlock::Create(*context, "loopcond", function);
    llvm::BasicBlock* bodyBlock = llvm::BasicBlock::Create(*context, "loopbody", function);
    llvm::BasicBlock* exitBlock = llvm::BasicBlock::Create(*context, "loopexit", function);

    builder->CreateBr(condBlock);
    builder->SetInsertPoint(condBlock);
    llvm::Value* condition = node->getCondition()->accept(*this);
    condition = toBoolean(condition);
    if (!condition) {
        return nullptr;
    }
    builder->CreateCondBr(condition, bodyBlock, exitBlock);

    builder->SetInsertPoint(bodyBlock);
    node->getBody()->accept(*this);
    if (!builder->GetInsertBlock()->getTerminator()) {
        builder->CreateBr(condBlock);
    }

    builder->SetInsertPoint(exitBlock);
    return exitBlock;
}

llvm::Value* CodeGenVisitor::visit(ReturnStmtAST* node) {
    logCodegen("visit ReturnStmtAST");
    llvm::Value* value = nullptr;
    if (node->getValue()) {
        value = node->getValue()->accept(*this);
        if (!value) {
            logCodegen("failed return value codegen");
            return nullptr;
        }
        if (currentReturnSlot) {
            builder->CreateStore(value, currentReturnSlot);
        }
    }

    if (!emitEnsuresChecks()) {
        logCodegen("ensures checks failed before return");
        return nullptr;
    }

    if (value) {
        return builder->CreateRet(value);
    }

    return builder->CreateRetVoid();
}

llvm::Value* CodeGenVisitor::visit(ExprStmtAST* node) {
    return node->getExpr()->accept(*this);
}

llvm::Value* CodeGenVisitor::visit(PrintStmtAST* node) {
    llvm::Value* value = node->getExpr()->accept(*this);
    return emitPrintValue(value);
}

llvm::Value* CodeGenVisitor::visit(ExitStmtAST* node) {
    logCodegen("visit ExitStmtAST");
    llvm::Value* value = node->getExpr()->accept(*this);
    if (!value) {
        logCodegen("exit statement value codegen failed");
        return nullptr;
    }
    llvm::Value* exitCode = value;
    if (value->getType()->isIntegerTy(1)) {
        exitCode = builder->CreateZExt(value, llvm::Type::getInt32Ty(*context), "exitbool");
    } else if (!value->getType()->isIntegerTy(32)) {
        logCodegen("exit statement expects int32 or bool");
        return nullptr;
    }
    builder->CreateCall(getOrCreateExit(), { exitCode });
    builder->CreateUnreachable();
    return nullptr;
}

llvm::Value* CodeGenVisitor::visit(FunctionDeclAST* node) {
    logCodegen("visit FunctionDeclAST: " + node->getFunctionName());
    std::vector<llvm::Type*> paramTypes;
    paramTypes.reserve(node->getParameters().size());
    for (const auto& param : node->getParameters()) {
        llvm::Type* paramType = param.second ? getLLVMType(param.second->getKind()) : llvm::Type::getInt32Ty(*context);
        paramTypes.push_back(paramType);
    }

    llvm::Type* returnType = node->getType() ? getLLVMType(node->getType()->getKind()) : llvm::Type::getVoidTy(*context);
    llvm::FunctionType* funcType = llvm::FunctionType::get(returnType, paramTypes, false);

    llvm::Function* function = module->getFunction(node->getFunctionName());
    if (!function) {
        function = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, node->getFunctionName(), module.get());
    }

    applyGeneralFunctionAttributes(function);
    applyWillReturnAttribute(function);

    if (!function->empty()) {
        logCodegen("function already defined: " + node->getFunctionName());
        return function;
    }

    llvm::BasicBlock* entry = llvm::BasicBlock::Create(*context, "entry", function);
    builder->SetInsertPoint(entry);

    auto savedValues = namedValues;
    llvm::Function* savedFunction = currentFunction;
    const BlueprintAST* savedBlueprint = currentBlueprint;
    llvm::AllocaInst* savedReturnSlot = currentReturnSlot;
    currentFunction = function;
    currentBlueprint = node->getLinkedBlueprint();
    currentReturnSlot = nullptr;
    namedValues.clear();

    if (currentBlueprint) {
        logCodegen("linked blueprint found for function: " + node->getFunctionName());
    } else {
        logCodegen("no linked blueprint for function: " + node->getFunctionName());
    }

    unsigned index = 0;
    for (auto& arg : function->args()) {
        const auto& param = node->getParameters()[index++];
        llvm::AllocaInst* alloca = createEntryBlockAlloca(function, param.first, arg.getType());
        builder->CreateStore(&arg, alloca);
        namedValues[param.first] = alloca;
    }

    if (currentBlueprint && !returnType->isVoidTy()) {
        currentReturnSlot = createEntryBlockAlloca(function, node->getFunctionName(), returnType);
        namedValues[node->getFunctionName()] = currentReturnSlot;
    }

    if (!emitRequiresChecks()) {
        logCodegen("requires checks failed for function: " + node->getFunctionName());
        currentBlueprint = savedBlueprint;
        currentFunction = savedFunction;
        namedValues = std::move(savedValues);
        return nullptr;
    }

    if (!emitDefaultReturns()) {
        logCodegen("default returns failed for function: " + node->getFunctionName());
        currentBlueprint = savedBlueprint;
        currentFunction = savedFunction;
        namedValues = std::move(savedValues);
        return nullptr;
    }

    if (node->getBody()) {
        auto* body = const_cast<StmtAST*>(node->getBody());
        body->accept(*this);
    }

    if (!builder->GetInsertBlock()->getTerminator()) {
        if (currentReturnSlot && !returnType->isVoidTy()) {
            if (returnType->isIntegerTy(1)) {
                builder->CreateStore(llvm::ConstantInt::get(returnType, 0), currentReturnSlot);
            } else if (returnType->isIntegerTy()) {
                builder->CreateStore(llvm::ConstantInt::get(returnType, 0), currentReturnSlot);
            } else {
                builder->CreateStore(llvm::Constant::getNullValue(returnType), currentReturnSlot);
            }
        }
        if (!emitEnsuresChecks()) {
            logCodegen("ensures checks failed for function: " + node->getFunctionName());
            currentBlueprint = savedBlueprint;
            currentFunction = savedFunction;
            currentReturnSlot = savedReturnSlot;
            namedValues = std::move(savedValues);
            return nullptr;
        }
        if (returnType->isVoidTy()) {
            builder->CreateRetVoid();
        } else if (returnType->isIntegerTy(1)) {
            builder->CreateRet(llvm::ConstantInt::get(returnType, 0));
        } else if (returnType->isIntegerTy()) {
            builder->CreateRet(llvm::ConstantInt::get(returnType, 0));
        } else {
            builder->CreateRet(llvm::Constant::getNullValue(returnType));
        }
    }

    currentBlueprint = savedBlueprint;
    currentFunction = savedFunction;
    currentReturnSlot = savedReturnSlot;
    namedValues = std::move(savedValues);
    return function;
}

llvm::Value* CodeGenVisitor::visit(PrintAST* node) {
    if (!currentFunction) {
        currentFunction = getOrCreateTopLevelFunction();
    }

    auto* expr = const_cast<ExprAST*>(node->getValue());
    llvm::Value* value = expr ? expr->accept(*this) : nullptr;
    return emitPrintValue(value);
}

