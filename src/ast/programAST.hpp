#pragma once

class ProgramAST {
	public:
		virtual ~ProgramAST() = default;
		virtual void printAST() const = 0;
};

