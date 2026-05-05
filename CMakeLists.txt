cmake_minimum_required(VERSION 3.23)

project(BlueprintScript LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE BLUEPRINTSCRIPT_SOURCES CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

add_executable(BlueprintScript
    ${BLUEPRINTSCRIPT_SOURCES}
)

find_package(LLVM REQUIRED CONFIG)
if (TARGET LLVM)
	target_link_libraries(BlueprintScript PRIVATE LLVM)
else()
	message(FATAL_ERROR "LLVM library not found")
endif()
