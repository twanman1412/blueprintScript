#include <iostream>

#include "metadataInferer_tests.hpp"
#include "willReturnInferer_tests.hpp"

int main() {
    int failures = 0;
    failures += MetadataInfererTests::runTests();
    failures += WillReturnInfererTests::runTests();

    if (failures == 0) {
        std::cout << "All tests passed!\n";
    } else {
        std::cout << failures << " test(s) failed.\n";
    }

    return failures;
}