#pragma once

class AnalysisContext;

class ProgramAST {
	public:
		virtual ~ProgramAST() = default;
		virtual void printAST() const = 0;
		virtual bool checkNode(AnalysisContext &ctx) { (void)ctx; return true; }
};

