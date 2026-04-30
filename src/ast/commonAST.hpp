#pragma once

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

	private:
		PrimitiveKind kind;
};
