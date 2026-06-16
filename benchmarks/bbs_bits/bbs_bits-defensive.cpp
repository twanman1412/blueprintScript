#include <iostream>
#include <cstdint>
#include <cassert>

int32_t mulMod(int32_t a, int32_t b, int32_t mod) {
    assert(b >= 0);
    assert(mod > 1);

    int32_t result = 0;
    a = a % mod;
    assert(a >= 0); // Wait, looking at the bps this looks different but I will follow the bps: `assert(a >= 0)`

    // Actually the defensive bps has `a = a % mod; assert(a >= 0);` but it's clearly a bug if `a` was negative before... Oh wait, defensive bps didn't have `if (a < 0) a = a + mod;`. Let me check the exact defensive bps.
    // Yes: "a = a % mod; assert(a >= 0);"

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

int32_t bbsBits(int32_t seed, int32_t modulus, int32_t count) {
    assert(count >= 0);
    assert(modulus > 1);

    int32_t result = 0;
    int32_t sumMod = 1000000007;
    int32_t i = 0;

    seed = seed % modulus;
    if (seed < 0) {
        seed = seed + modulus;
    }

    while (i < count) {
        seed = mulMod(seed, seed, modulus);
        result = (result + (seed % 2)) % sumMod;
        assert(result >= 0);
        i = i + 1;
    }

    return result;
}

int32_t bbsStress() {
    int32_t seed = 123456789;
    int32_t modulus = 1000003;
    int32_t count = 200000000;

    return bbsBits(seed, modulus, count);
}

int main() {
    std::cout << bbsStress() << std::endl;
    return 0;
}
