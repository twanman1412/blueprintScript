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

cd "$TARGET_DIR"

run_benchmark() {
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

MD_FILE="${BENCHMARK}.md"

echo "# Benchmark Results: ${BENCHMARK}" > "$MD_FILE"
echo "" >> "$MD_FILE"

# Run regular
run_benchmark "$BENCHMARK" "$MD_FILE"

# Run defensive
run_benchmark "${BENCHMARK}-defensive" "$MD_FILE"

echo "Results written to $TARGET_DIR/$MD_FILE"
