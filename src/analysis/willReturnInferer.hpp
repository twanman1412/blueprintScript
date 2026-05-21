#pragma once

#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

class ProgramAST;

class WillReturnInferer {
public:
    std::unordered_map<std::string, bool> infer(const std::vector<std::unique_ptr<ProgramAST>>& nodes) const;
};
