#include <iostream>
#include <cstdint>
#include <cassert>

int32_t mulMod(int32_t a, int32_t b, int32_t mod) {
    assert(b >= 0);
    assert(mod > 1);

    int32_t result = 0;
    a = a % mod;
    if (a < 0) {
        a = a + mod;
    }

    while (b > 0) {
        if (b % 2 == 1) {
            result = (result + a) % mod;
            assert(result >= 0);
        }
        a = (a + a) % mod;
        assert(a >= 0);
        b = b / 2;
    }

    return result;
}

int32_t modExp(int32_t base, int32_t exp, int32_t mod) {
    assert(exp >= 0);
    assert(mod > 1);

    int32_t result = 1;
    base = base % mod;
    if (base < 0) {
        base = base + mod;
    }

    while (exp > 0) {
        if (exp % 2 == 1) {
            result = mulMod(result, base, mod);
            assert(result >= 0);
        }
        exp = exp / 2;
        base = mulMod(base, base, mod);
        assert(base >= 0);
    }

    assert(result >= 0);
    assert(result < mod);
    return result;
}

int32_t modInverse(int32_t a, int32_t mod) {
    assert(mod > 1);
    return modExp(a, mod - 2, mod);
}

int main() {
    std::cout << modInverse(3, 11) << std::endl;
    return 0;
}
