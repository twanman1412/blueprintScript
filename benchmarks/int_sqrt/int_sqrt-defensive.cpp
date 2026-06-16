#include <iostream>
#include <cstdint>
#include <cassert>

int32_t intSqrt(int32_t n) {
    assert(n >= 0);

    int32_t low = 0;
    int32_t high = n;
    int32_t result = 0;

    while (low <= high) {
        int32_t mid = low + (high - low) / 2;
        if (mid == 0) {
            result = 0;
            low = 1;
        } else if (mid <= n / mid) {
            result = mid;
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }

    return result;
}

int32_t intSqrtStress() {
    int32_t sum = 0;
    int32_t modulus = 1000000007;
    int32_t i = 0;
    int32_t limit = 100000000;

    while (i <= limit) {
        sum = (sum + intSqrt(i)) % modulus;
        i = i + 1;
    }

    return sum;
}

int main() {
    std::cout << intSqrtStress() << std::endl;
    return 0;
}
