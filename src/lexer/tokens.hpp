#pragma once

#include <cstdint>

enum Token : int16_t {
	// End of file
	tok_eof = -01,

	// Types
	tok_i32 = -10,
	tok_bool = -11,
	tok_void = -12,

	// Literals
	tok_true = -20,
	tok_false = -21,
	tok_integer_literal = -22,

	// Identifiers
	tok_identifier = -30,

	// Function keywords
	tok_function = -40,
	tok_return = -41,

	// Blueprint keywords
	tok_blueprint = -50,
	tok_input = -51,
	tok_output = -52,
	tok_requires = -53,
	tok_ensures = -54,
	tok_default = -55,

	// Control flow
	tok_if = -60,
	tok_else = -61,
	tok_while = -62,

	// Printing
	tok_print = -70,
};

