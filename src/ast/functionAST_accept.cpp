#include "functionAST.hpp"
#include "../codegen/codeGenVisitor.hpp"

llvm::Value* PrintAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* FunctionDeclAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
