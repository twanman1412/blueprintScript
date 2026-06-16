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
    if (a < 0) {
        a = a + mod;
    }

    while (b > 0) {
        if (b % 2 == 1) {
            result = (result + a) % mod;
        }
        a = (a + a) % mod;
        b = b / 2;
    }

    return result;
}

int32_t bbsBits(int32_t seed, int32_t modulus, int32_t count)
    pre(count >= 0 && modulus > 1)
    post(r: r >= 0)
{
    if (count == 0) return 0;

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
        i = i + 1;
    }

    return result;
}

int main() {
    std::cout << bbsBits(123456789, 1000003, 10) << std::endl;
    return 0;
}
