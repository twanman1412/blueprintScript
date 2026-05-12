#pragma once

class AnalysisContext;
class CodeGenVisitor;

namespace llvm {
class Value;
}

class ProgramAST {
	public:
		virtual ~ProgramAST() = default;
		virtual void printAST() const = 0;
		virtual bool checkNode(AnalysisContext &ctx) { (void)ctx; return true; }
		virtual llvm::Value* accept(CodeGenVisitor &visitor) = 0;
};

