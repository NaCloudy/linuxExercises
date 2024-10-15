#!/bin/bash

rm -rf five

mkdir five

for dir_num in {1..5}; do
    mkdir five/dir$dir_num
    
    for file_num in {1..4}; do
        seq -s "\n" $file_num | tr -d '[:digit:]' | sed "s/^/$file_num/" > five/dir$dir_num/file$file_num
    done
done

echo "Directories and files created successfully."
