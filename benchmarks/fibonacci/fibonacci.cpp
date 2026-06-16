#ifdef __clang__
    // Clang doesn't support C++26 contracts yet, so we erase them
    #define pre(condition)
    #define post(condition)
#endif

#include <iostream>
#include <cstdint>

int32_t fibonacci(int32_t n) 
    pre(n >= 0)
    post(r: r >= 0)
{
    if (n == 0) return 0;
    if (n == 1) return 1;

    return fibonacci(n - 1) + fibonacci(n - 2);
}

int32_t fibonacciStress() {
    int32_t result = 0;
    int32_t iterations = 45;
    int32_t i = 0;

    while (i <= iterations) {
        result = result + fibonacci(i);
        i = i + 1;
    }

    return result;
}

int main() {
    std::cout << fibonacciStress() << std::endl;
    return 0;
}
