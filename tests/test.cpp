#include <iostream>

#include "metadataInferer_tests.hpp"
#include "willReturnInferer_tests.hpp"
#include "expressionSimplifier_tests.hpp"

int main(int argc, char *argv[]) {
    int failures = 0;
    failures += MetadataInfererTests::runTests();
    failures += WillReturnInfererTests::runTests();
    failures += ExpressionSimplifierTests::runTests();

    if (failures == 0) {
        std::cout << "All tests passed!\n";
    } else {
        std::cout << failures << " test(s) failed.\n";
    }

    return failures;
}