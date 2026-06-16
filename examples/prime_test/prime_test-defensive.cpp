#include <iostream>
#include <cstdint>
#include <cassert>

bool isPrime(int32_t n) {
    assert(n >= 0);
    
    if (n <= 1) {
        return false;
    }
    if (n <= 3) {
        return true;
    }
    if (n % 2 == 0) {
        return false;
    }

    int32_t i = 3;
    while (i <= n / i) {
        if (n % i == 0) {
            return false;
        }
        i = i + 2;
    }

    return true;
}

int main() {
    std::cout << isPrime(29) << std::endl;
    return 0;
}
