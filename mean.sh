#!/bin/bash

# Check if at least one argument is provided
if [[ $# -lt 1 ]]; then
  echo "usage: $0 <column> [file.csv]" 1>&2
  exit 1
fi

# Set column number and file input (default to stdin if no file provided)
column=$1
file=${2:-/dev/stdin}

# Initialize sum and count variables
sum=0
count=0

# Use cut to extract the specific column, and tail to skip the header
# Read the column values in a while loop
while read value; do
  sum=$(echo "$sum + $value" | bc)
  count=$((count + 1))
done < <(cut -d, -f$column "$file" | tail -n +2)

if [[ $count -ne 0 ]]; then
    mean=$(echo "scale=2; $sum / $count" | bc)
    echo "mean: $mean" 
else
    echo "No data to calculate mean."
fi