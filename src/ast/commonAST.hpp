#pragma once

#include <iostream>

class TypeAST {
	public:
		enum PrimitiveKind {
			INT32,
			BOOL,
			VOID,
		};

		TypeAST() = default;
		TypeAST(PrimitiveKind kind) : kind(kind) {}
		PrimitiveKind getKind() const { return kind; }

		void printAST() const {
			switch (kind) {
				case INT32: std::cout << "(Type INT32)"; break;
				case BOOL: std::cout << "(Type BOOL)"; break;
				case VOID: std::cout << "(Type VOID)"; break;
				default: std::cout << "(Type UNKNOWN)"; break;
			}
		}

	private:
		PrimitiveKind kind;
};
