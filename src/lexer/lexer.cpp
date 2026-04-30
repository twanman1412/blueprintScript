#include <unordered_map>
#include <cctype>

#include "lexer.hpp"
#include "tokens.hpp"

// Initialize the keyword lookup table
std::unordered_map<std::string, Token> Lexer::keywords = {
	// Primitive types
	{"i32", tok_i32},
	{"bool", tok_bool},
	{"void", tok_void},

	// Literals
	{"true", tok_true},
	{"false", tok_false},

	// Function keywords
	{"function", tok_function},
	{"return", tok_return},

	// Blueprint keywords
	{"blueprint",tok_blueprint},
	{"input", tok_input},
	{"output", tok_output},
	{"requires", tok_requires},
	{"ensures", tok_ensures},
	{"default", tok_default},

	// Control flow
	{"if", tok_if},
	{"else", tok_else},
	{"while", tok_while},

	// Printing
	{"print", tok_print},
};

Lexer::Lexer(std::string sourceCode) : source(sourceCode) {
	this->currentToken = 0;
}

char Lexer::getchar() {
	if (currentIndex >= source.size()) {
		return EOF;
	}
	return source[currentIndex++];
}

int16_t Lexer::getNextToken() {
	int lastChar = ' ';

	while (isspace(lastChar))
		lastChar = this->getchar();

	if (lastChar == EOF) {
		return tok_eof;
	}

	if (isalpha(lastChar)) {
		std::string identifierStr;
		do {
			identifierStr += lastChar;
			lastChar = this->getchar();
		} while (isalnum(lastChar));
		ungetCurrentToken();

		this->currentToken = getKeywordToken(identifierStr);
		if (this->currentToken == tok_true) {
			this->boolValue = true;
		} else if (this->currentToken == tok_false) {
			this->boolValue = false;
		}
		return this->currentToken;
	}

	if (isdigit(lastChar)) {
		std::string numStr;
		bool isFloat = false;
		do {
			numStr += lastChar;
			lastChar = this->getchar();
		} while (isdigit(lastChar));
		ungetCurrentToken();

		this->integerValue = strtoll(numStr.c_str(), nullptr, 10);
		this->currentToken = tok_integer_literal;
		return this->currentToken;
	}

	if (lastChar == '/') {
		char nextChar = this->getchar();
		if (nextChar == '/') {
			// Single line comment
			do {
				lastChar = this->getchar();
			} while (lastChar != EOF && lastChar != '\n' && lastChar != '\r');

			if (lastChar != EOF)
				return getNextToken();
		} else if (nextChar == '*') {
			// Multi-line comment
			while (true) {
				lastChar = this->getchar();
				if (lastChar == EOF)
					return tok_eof;
				if (lastChar == '*') {
					lastChar = this->getchar();
					if (lastChar == '/')
						break;
				}
			}
			return getNextToken();
		}

		ungetCurrentToken();
		this->currentToken = '/';
		return this->currentToken;
	}

	this->currentToken = lastChar;
	return lastChar;
}

void Lexer::ungetCurrentToken() {
	this->currentIndex--;
}

int16_t Lexer::getCurrentToken() {
	return this->currentToken;
}

int64_t Lexer::getIntegerValue() {
	return this->integerValue;
}

bool Lexer::getBoolValue() {
	return this->boolValue;
}

std::string Lexer::getIdentifierName() {
	return this->identifierName;
}

Token Lexer::getKeywordToken(const std::string& identifier) {
	auto it = keywords.find(identifier);
	if (it != keywords.end()) {
		return it->second;
	} else {
		this->identifierName = identifier;
		return tok_identifier;
	}
}
