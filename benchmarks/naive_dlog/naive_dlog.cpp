#ifdef __clang__
    // Clang doesn't support C++26 contracts yet, so we erase them
    #define pre(condition)
    #define post(condition)
#endif

#include <iostream>
#include <cstdint>

int32_t mulMod(int32_t a, int32_t b, const int32_t mod) 
    pre(a >= 0 && b >= 0 && mod > 1)
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

int32_t modExp(int32_t base, int32_t exp, const int32_t mod)
    pre(base >= 0 && exp >= 0 && mod > 1)
    post(r: r >= 0 && r < mod)
{
    if (exp == 0) return 1;

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

int32_t discreteLog(int32_t base, int32_t target, const int32_t mod)
    pre(mod > 1)
    post(r: r >= -1 && r < mod)
{
    if (target == 1) return 0;

    int32_t value = 1;
    int32_t x = 0;

    while (x < mod) {
        if (value == target) {
            return x;
        }
        value = mulMod(value, base, mod);
        x = x + 1;
    }

    return -1;
}

int32_t dlogStress() {
    int32_t modulus = 1000003;
    int32_t base = 2;
    int32_t sum = 0;
    int32_t i = 1;
    int32_t iterations = 100000;

    while (i <= iterations) {
        int32_t target = modExp(base, i, modulus);
        int32_t res = discreteLog(base, target, modulus);
        sum = (sum + res) % modulus;
        i = i + 1;
    }

    return sum;
}

int main() {
    std::cout << dlogStress() << std::endl;
    return 0;
}
