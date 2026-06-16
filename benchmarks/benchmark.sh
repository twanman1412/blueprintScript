#!/bin/bash

iterations=20

# Exit on error
set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <benchmark_name>"
    echo "Example: $0 bbs_bits"
    exit 1
fi

BENCHMARK=$1
TARGET_DIR="$BENCHMARK"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory $TARGET_DIR does not exist."
    exit 1
fi

CWD=$(pwd)
BLUEPRINT_EXECUTABLE="$CWD/../BlueprintScript"

cd "$TARGET_DIR"

run_blueprint_benchmark() {
	echo "Compiling $1 with BlueprintScript..."

	local benchmark_name=$1
	$($BLUEPRINT_EXECUTABLE --mode=optimise "$benchmark_name.bps" > /dev/null)

    local binary_name=$1
    local md_file=$2
    
    if [ ! -x "./$binary_name" ]; then
        echo "Warning: Executable ./$binary_name not found or not executable. Skipping."
        return
    fi
    
    echo "Benchmarking ./$binary_name..."
    
    echo "## $binary_name" >> "$md_file"
	echo '```txt' >> "$md_file"

	local output=$(perf stat -r $iterations --table -o "tmp_$binary_name" ./$binary_name > /dev/null)
	cat "tmp_$binary_name" >> "$md_file"
	echo '```' >> "$md_file"

	rm "tmp_$binary_name"
    echo " Done."
    
    echo "" >> "$md_file"
}

run_cpp_benchmark() {
	echo "Compiling $1 with clang++..."

	local benchmark_name=$1
	$(clang++ -std=c++26 -O3 -o cpp-$1 $1.cpp > /dev/null)

	local binary_name="cpp-$benchmark_name"
	local md_file=$2
	
	if [ ! -x "./$benchmark_name" ]; then
		echo "Warning: Executable ./$benchmark_name not found or not executable. Skipping."
		return
	fi
	
	echo "Benchmarking ./$benchmark_name..."
	
	echo "## $benchmark_name cpp" >> "$md_file"
	echo '```txt' >> "$md_file"

	local output=$(perf stat -r $iterations --table -o "tmp_$benchmark_name" ./cpp-$benchmark_name > /dev/null)
	cat "tmp_$benchmark_name" >> "$md_file"
	echo '```' >> "$md_file"

	rm "tmp_$benchmark_name"
	echo " Done."
	
	echo "" >> "$md_file"
}

MD_FILE="${BENCHMARK}.md"

echo "# Benchmark Results: ${BENCHMARK}" > "$MD_FILE"
echo "" >> "$MD_FILE"

run_blueprint_benchmark "$BENCHMARK" "$MD_FILE"
run_blueprint_benchmark "${BENCHMARK}-defensive" "$MD_FILE"

run_cpp_benchmark "$BENCHMARK" "$MD_FILE"
run_cpp_benchmark "${BENCHMARK}-defensive" "$MD_FILE"

echo "Results written to $TARGET_DIR/$MD_FILE"
