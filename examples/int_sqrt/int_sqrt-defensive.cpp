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

int main() {
    std::cout << intSqrt(70) << std::endl;
    return 0;
}
