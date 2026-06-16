#include <iostream>
#include <cstdint>
#include <cassert>

int32_t fibonacci(int32_t n) {
    assert(n >= 0);

    if (n <= 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }

    int32_t res = fibonacci(n - 1) + fibonacci(n - 2);
    assert(res >= 0);
    return res;
}

int main() {
    std::cout << fibonacci(10) << std::endl;
    return 0;
}
