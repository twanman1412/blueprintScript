#ifdef __clang__
    // Clang doesn't support C++26 contracts yet, so we erase them
    #define pre(condition)
    #define post(condition)
#endif

#include <iostream>
#include <cstdint>

bool isPrime(int32_t n) 
    pre(n >= 0)
{
    if (n <= 1) return false;
    if (n == 2) return true;

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

int32_t primeStress() {
    int32_t count = 0;
    int32_t i = 2;
    int32_t limit = 50000000;

    while (i <= limit) {
        if (isPrime(i)) {
            count = count + 1;
        }
        i = i + 1;
    }

    return count;
}

int main() {
    std::cout << primeStress() << std::endl;
    return 0;
}
