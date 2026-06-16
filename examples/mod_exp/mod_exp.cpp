#ifdef __clang__
    // Clang doesn't support C++26 contracts yet, so we erase them
    #define pre(condition)
    #define post(condition)
#endif

#include <iostream>
#include <cstdint>

int32_t mulMod(int32_t a, int32_t b, int32_t mod) 
    pre(b >= 0 && mod > 1)
    post(r: r >= 0 && r < mod)
{
    if (a == 0) return 0;
    if (b == 0) return 0;

    int32_t result = 0;
    a = a % mod;

    while (b > 0) {
        if (b % 2 == 1) {
            result = (result + a) % mod;
        }
        a = (a + a) % mod;
        b = b / 2;
    }

    return result;
}

int32_t modExp(int32_t base, int32_t exp, int32_t mod)
    pre(exp >= 0 && mod > 1)
    post(r: r >= 0 && r < mod)
{
    if (exp == 0) return 1;
    if (base % mod == 0) return 0;

    int32_t result = 1;
    base = base % mod;
    
    while (exp > 0) {
        if (exp % 2 == 1) {
            result = mulMod(result, base, mod);
        }
        exp = exp / 2;
        base = mulMod(base, base, mod);
    }
    
    return result;
}

int main() {
    std::cout << modExp(2, 10, 1000) << std::endl;
    return 0;
}
