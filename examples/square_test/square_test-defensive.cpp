#include <iostream>
#include <cstdint>
#include <cassert>

int32_t isSquare(int32_t n) {
    assert(n >= 0);

    int32_t odd = 1;
    while (n > 0) {
        n = n - odd;
        odd = odd + 2;
    }

    return n == 0;
}

int main() {
    std::cout << isSquare(16) << std::endl;
    return 0;
}
