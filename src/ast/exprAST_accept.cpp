#include "exprAST.hpp"
#include "../codegen/codeGenVisitor.hpp"

llvm::Value* IntegerExprAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* BoolExprAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* IdentifierExprAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* FunctionCallExprAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* BinaryExprAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* UnaryExprAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
