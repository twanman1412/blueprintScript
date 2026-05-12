#pragma once

#include <string>
#include <unordered_map>
#include <vector>

#include "../ast/commonAST.hpp"
#include "../logger.hpp"

class BlueprintAST;

class AnalysisContext {
	public:
		enum class SymbolKind {
			VARIABLE,
			FUNCTION,
			PARAMETER,
		};

		struct Symbol {
			std::string name;
			TypeAST::PrimitiveKind type;
			SymbolKind kind;

			Symbol(const std::string& name, TypeAST::PrimitiveKind type, SymbolKind kind)
				: name(name), type(type), kind(kind) {}
		};

		struct FunctionSignature {
			std::string name;
			TypeAST::PrimitiveKind returnType;
			std::vector<std::pair<std::string, TypeAST::PrimitiveKind>> parameters;

			FunctionSignature(const std::string& name, TypeAST::PrimitiveKind returnType)
				: name(name), returnType(returnType) {}
		};

		AnalysisContext(Logger &logger)
			: logger_(logger), currentFunctionReturnType_(TypeAST::VOID) {
				scopes_.emplace_back();
			}

		void pushScope() {
			scopes_.emplace_back();
		}

		void popScope() {
			if (scopes_.size() <= 1) {
				return;
			}

			scopes_.pop_back();
		}

		bool declareSymbol(const std::string& name, TypeAST::PrimitiveKind type, SymbolKind kind) {
			auto& currentScope = scopes_.back();
			for (const auto& symbol : currentScope) {
				if (symbol.name == name) {
					logger_.errorln("Error: Symbol '" + name + "' already declared in this scope");
					return false;
				}
			}

			currentScope.emplace_back(name, type, kind);
			return true;
		}

		bool lookupSymbol(const std::string& name, Symbol*& outSymbol) {
			for (auto scopeIt = scopes_.rbegin(); scopeIt != scopes_.rend(); ++scopeIt) {
				for (auto symbolIt = scopeIt->rbegin(); symbolIt != scopeIt->rend(); ++symbolIt) {
					if (symbolIt->name == name) {
						outSymbol = &(*symbolIt);
						return true;
					}
				}
			}

			return false;
		}

		bool declareFunctionSignature(const std::string& name, TypeAST::PrimitiveKind returnType,
				const std::vector<std::pair<std::string, TypeAST::PrimitiveKind>>& parameters) {
			if (functionSignatures_.find(name) != functionSignatures_.end()) {
				logger_.errorln("Error: Function '" + name + "' already declared");
				return false;
			}

			FunctionSignature sig(name, returnType);
			sig.parameters = parameters;
			functionSignatures_.emplace(name, sig);
			return true;
		}

		bool lookupFunctionSignature(const std::string& name, FunctionSignature*& outSig) {
			auto it = functionSignatures_.find(name);
			if (it == functionSignatures_.end()) {
				return false;
			}

			outSig = &it->second;
			return true;
		}

		bool declareBlueprint(const std::string& name, const BlueprintAST* blueprint) {
			if (blueprints_.find(name) != blueprints_.end()) {
				logger_.errorln("Error: Blueprint '" + name + "' already declared");
				return false;
			}
			blueprints_.emplace(name, blueprint);
			return true;
		}

		bool lookupBlueprint(const std::string& name, const BlueprintAST*& outBlueprint) const {
			auto it = blueprints_.find(name);
			if (it == blueprints_.end()) {
				outBlueprint = nullptr;
				return false;
			}
			outBlueprint = it->second;
			return true;
		}

		void setCurrentFunction(TypeAST::PrimitiveKind returnType) {
			currentFunctionReturnType_ = returnType;
		}

		TypeAST::PrimitiveKind getCurrentFunctionReturnType() const {
			return currentFunctionReturnType_;
		}

		void clearCurrentFunction() {
			currentFunctionReturnType_ = TypeAST::VOID;
		}

		Logger &getLogger() const {
			return logger_;
		}

	private:
		Logger &logger_;
		std::vector<std::vector<Symbol>> scopes_;
		std::unordered_map<std::string, FunctionSignature> functionSignatures_;
		std::unordered_map<std::string, const BlueprintAST*> blueprints_;
		TypeAST::PrimitiveKind currentFunctionReturnType_;
};
