cmake_minimum_required(VERSION 3.23)

project(BlueprintScript LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE BLUEPRINTSCRIPT_SOURCES CONFIGURE_DEPENDS
	"${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)

set(BLUEPRINTSCRIPT_LIB_SOURCES ${BLUEPRINTSCRIPT_SOURCES})
list(FILTER BLUEPRINTSCRIPT_LIB_SOURCES EXCLUDE REGEX "/src/main.cpp$")

add_library(BlueprintScriptLib
	${BLUEPRINTSCRIPT_LIB_SOURCES}
)

add_executable(BlueprintScript
	${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
)

find_package(LLVM REQUIRED CONFIG)
if (TARGET LLVM)
	target_link_libraries(BlueprintScriptLib PRIVATE LLVM)
	target_link_libraries(BlueprintScript PRIVATE BlueprintScriptLib)
else()
	message(FATAL_ERROR "LLVM library not found")
endif()

enable_testing()
add_executable(BlueprintScriptTests
	${CMAKE_CURRENT_SOURCE_DIR}/tests/test.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/tests/metadataInferer_tests.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/tests/willReturnInferer_tests.cpp
)
target_link_libraries(BlueprintScriptTests PRIVATE BlueprintScriptLib)
add_test(NAME blueprintscript_metadata_inferer COMMAND BlueprintScriptTests)
