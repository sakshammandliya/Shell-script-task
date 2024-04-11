#!/bin/bash

# Define directories for different file types
TEXT_DIR="TextFiles"
CSV_DIR="CSVFiles"
PDF_DIR="PDFFiles"
# Add more directories for other file types if needed

# Create directories if they don't exist
mkdir -p "$TEXT_DIR" "$CSV_DIR" "$PDF_DIR"

# Move files to appropriate directories and rename with timestamp
for file in *; do
    if [[ -f $file ]]; then
        case "$file" in
            *.txt) dest_dir="$TEXT_DIR";;
            *.csv) dest_dir="$CSV_DIR";;
            *.pdf) dest_dir="$PDF_DIR";;
            *) continue;;
        esac

        # Get current timestamp
        timestamp=$(date +"%Y%m%d%H%M%S")

        # Move file to destination directory and rename
        mv "$file" "$dest_dir/${file%.*}_${timestamp}.${file##*.}"
        echo "Moved $file to $dest_dir and renamed to ${file%.*}_${timestamp}.${file##*.}"
    fi
done
