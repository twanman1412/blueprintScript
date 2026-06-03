#!/bin/bash

# Exit on error
set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 <benchmark_name>"
    echo "Example: $0 bbs_bits"
    exit 1
fi

BENCHMARK=$1
TARGET_DIR="examples/$BENCHMARK"

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
    echo "" >> "$md_file"
    echo "| Run | Time (s) |" >> "$md_file"
    echo "|---|---|" >> "$md_file"
    
    # Create a temporary file to store times for awk
    local tmp_file=$(mktemp)
    
    for i in {1..100}; do
        # We need to capture stderr because /usr/bin/time outputs there
        # %e gives the elapsed real time in seconds
        time_output=$(/usr/bin/time -f "%e" "./$binary_name" 2>&1 >/dev/null)
        
        # In case the time command output has multiple lines, grab the last one which should be our time
        real_time=$(echo "$time_output" | tail -n 1 | tr -d '[:space:]')
        
        echo "| $i | $real_time |" >> "$md_file"
        echo "$real_time" >> "$tmp_file"
        
        # Optional progress indicator
        if [ $((i % 10)) -eq 0 ]; then
            echo -n "."
        fi
    done
    echo " Done."
    
    # Calculate stats using awk
    # Sample standard deviation (N-1)
    stats=$(awk '
        { sum += $1; sumsq += ($1 * $1); count++ }
        END {
            if (count > 0) {
                avg = sum / count;
                if (count > 1) {
                    variance = (sumsq - (sum * sum / count)) / (count - 1);
                    stddev = sqrt(variance);
                } else {
                    stddev = 0;
                }
                printf "%.4f %.4f", avg, stddev;
            }
        }
    ' "$tmp_file")
    
    rm -f "$tmp_file"
    
    local avg=$(echo $stats | cut -d' ' -f1)
    local stddev=$(echo $stats | cut -d' ' -f2)
    
    echo "" >> "$md_file"
    echo "**Statistics:**" >> "$md_file"
    echo "- **Average:** $avg s" >> "$md_file"
    echo "- **Standard Deviation (Sample):** $stddev s" >> "$md_file"
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