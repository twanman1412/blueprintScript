#include <iostream>
#include <cstdint>
#include <cassert>

int32_t mulMod(int32_t a, int32_t b, int32_t mod) {
	assert(a >= 0);
    assert(b >= 0);
    assert(mod > 1);

    int32_t result = 0;
    a = a % mod;

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
	assert(base >= 0);
    assert(exp >= 0);
    assert(mod > 1);

    int32_t result = 1;
    base = base % mod;

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

int32_t discreteLog(int32_t base, int32_t target, int32_t mod) {
    assert(mod > 1);
    assert(base >= 0);
    assert(target >= 0);

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
