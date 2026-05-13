#include "stmtAST.hpp"
#include "../codegen/codeGenVisitor.hpp"

llvm::Value* BlockStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* VarDeclStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* AssignmentStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* IfStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* WhileStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* ReturnStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* ExprStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* PrintStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
llvm::Value* ExitStmtAST::accept(CodeGenVisitor &visitor) { return visitor.visit(this); }
