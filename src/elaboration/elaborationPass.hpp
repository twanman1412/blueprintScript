#pragma once

#include <memory>
#include <vector>

class ProgramAST;

class ElaborationPass {
public:
    void elaborate(std::vector<std::unique_ptr<ProgramAST>>& nodes) const;
};
