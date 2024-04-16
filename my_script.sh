#!/bin/bash
source_dir="source_directory"
declare -A dest_dirs=(
    [".txt"]="TextFiles"
    [".csv"]="CSVFiles"
    [".pdf"]="PDFFiles"
    # Add more file extensions and corresponding directories as needed
)
for dest_dir in "${dest_dirs[@]}"; do
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
    fi
done
organize_files() {
    local src_dir=$1
    local -n dest_arr=$2
    for file in "$src_dir"/*; do
        if [ -f "$file" ]; then
            ext="${file##*.}"
            if [ "${dest_arr[$ext]+isset}" ]; then
                timestamp=$(date +"%Y%m%d%H%M%S")
                new_name="${timestamp}_$(basename "$file")"
                dest="${dest_arr[$ext]}"
                mv "$file" "$dest/$new_name"
echo "Moved $(basename "$file") to $dest/$new_name"
            fi
        fi
    done
}
organize_files "$source_dir" dest_dirs
