# Combine contents of files in a directory into a single file
function combinefiles() {
    if [ -z "$1" ]; then
        echo "Usage: combinefiles <target_directory> [output_file_name]"
        return 1
    fi

    local TARGET_DIR="$1"
    local OUTPUT_FILE="${2:-combined_output.txt}"

    if [ ! -d "$TARGET_DIR" ]; then
        echo "Error: Directory '$TARGET_DIR' does not exist."
        return 1
    fi

    > "$OUTPUT_FILE"

    for file in "$TARGET_DIR"/*; do
        if [ -f "$file" ]; then
            if [ "$(basename "$file")" = "$OUTPUT_FILE" ]; then
                continue
            fi

            echo "$(basename "$file")" >> "$OUTPUT_FILE"
            echo "" >> "$OUTPUT_FILE"
            cat "$file" >> "$OUTPUT_FILE"
            echo "" >> "$OUTPUT_FILE"
        fi
    done

    echo "Done! All files combined into '$OUTPUT_FILE'."
}


