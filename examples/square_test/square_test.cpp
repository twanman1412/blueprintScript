#ifdef __clang__
    // Clang doesn't support C++26 contracts yet, so we erase them
    #define pre(condition)
    #define post(condition)
#endif

#include <iostream>
#include <cstdint>

int32_t isSquare(int32_t n) pre(n >= 0)
{
    if (n == 0) return true;

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
