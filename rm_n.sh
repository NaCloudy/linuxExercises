#!/bin/bash

# remove all files in <dir> larger than <n> bytes 

# usage
if [[ $# -ne 2 ]]; then
    echo "usage: ./$0 <dir> <n>" 1>&2
    exit 0
fi

dir=$1
n=$2

find "$dir" -type f -size +"${n}c" -exec rm {} \;

echo "Files in $dir larger than $n bytes have been removed."
