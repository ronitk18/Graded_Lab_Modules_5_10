#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Exactly one argument is required."
    exit 1
fi

# Check if the path exists
if [ ! -e "$1" ]; then
    echo "Error: Path does not exist."
    exit 1
fi

# If argument is a file
if [ -f "$1" ]; then
    echo "It is a file."
    echo "Number of lines: $(wc -l < "$1")"
    echo "Number of words: $(wc -w < "$1")"
    echo "Number of characters: $(wc -m < "$1")"

# If argument is a directory
elif [ -d "$1" ]; then
    echo "It is a directory."
    echo "Total number of files: $(find "$1" -type f | wc -l)"
    echo "Number of .txt files: $(find "$1" -type f -name "*.txt" | wc -l)"

else
    echo "Error: Invalid input."
fi
