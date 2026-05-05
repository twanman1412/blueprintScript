#pragma once

#include <iostream>
#include <string>
#include <sstream>
#include <cstdio>
#include <cstdarg>

class Logger {
public:
    enum class Level {
        INFO,
        DEBUG,
        ERROR
    };

    Logger(bool debug_enabled = false) : debug_enabled_(debug_enabled) {}

    void set_debug(bool enabled) {
        debug_enabled_ = enabled;
    }

    // Info level logging
    template<typename T>
    Logger& info(const T& value) {
        std::cout << value;
        return *this;
    }

    template<typename T>
    Logger& infoln(const T& value) {
        std::cout << value << std::endl;
        return *this;
    }

    Logger& infof(const char* format, ...) {
        va_list args;
        va_start(args, format);
        vprintf(format, args);
        va_end(args);
        return *this;
    }

    // Debug level logging
    template<typename T>
    Logger& debug(const T& value) {
        if (debug_enabled_) {
            std::cout << value;
        }
        return *this;
    }

    template<typename T>
    Logger& debugln(const T& value) {
        if (debug_enabled_) {
            std::cout << value << std::endl;
        }
        return *this;
    }

    Logger& debugf(const char* format, ...) {
        if (debug_enabled_) {
            va_list args;
            va_start(args, format);
            vprintf(format, args);
            va_end(args);
        }
        return *this;
    }

    // Error level logging
    template<typename T>
    Logger& error(const T& value) {
        std::cerr << value;
        return *this;
    }

    template<typename T>
    Logger& errorln(const T& value) {
        std::cerr << value << std::endl;
        return *this;
    }

    Logger& errorf(const char* format, ...) {
        va_list args;
        va_start(args, format);
        vfprintf(stderr, format, args);
        va_end(args);
        return *this;
    }

    // Stream-style formatting support
    Logger& operator<<(const std::string& str) {
        std::cout << str;
        return *this;
    }

private:
    bool debug_enabled_;
};

// Global logger instance
inline Logger logger(
#ifdef DO_DEBUG
    true
#else
    false
#endif
);
