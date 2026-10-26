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

check_cursor_rules() {
  local log_file="${1:-cursor_rules_check.log}"

  local dirs=(
    "true-toto"
    "false-toto"
    "pwd-toto"
    "yes-toto"
    "whoami-toto"
    "cat-toto"
    "cal-toto"
    "tree-toto"
    "rm-toto"
    "mkdir-toto"
    "wc-toto"
    "touch-toto"
    "seq-toto"
  )

  local rules=(
    "code-style.mdc"
    "implementation.mdc"
    "project-overview.mdc"
    "readme.mdc"
    "testing.mdc"
    "toolchain-structure.mdc"
  )

  # Clear or initialize the log file
  : > "$log_file"

  # Helper function to print to terminal and append to log
  log_msg() {
    echo -e "$@" | tee -a "$log_file"
  }

  log_msg "=============================================="
  log_msg " Cursor Rules Verification Report"
  log_msg " Date: $(date)"
  log_msg "=============================================="

  for dir in "${dirs[@]}"; do
    log_msg ""
    log_msg "Checking directory: ./$dir"

    local rules_path="./$dir/.cursor/rules"

    if [[ ! -d "$dir" ]]; then
      log_msg "  [MISSING DIR] Directory '$dir' does not exist."
      continue
    fi

    if [[ ! -d "$rules_path" ]]; then
      log_msg "  [MISSING PATH] Path '$rules_path' does not exist."
      continue
    fi

    local missing_count=0
    for rule in "${rules[@]}"; do
      if [[ -f "$rules_path/$rule" ]]; then
        log_msg "  [FOUND]   $rule"
      else
        log_msg "  [MISSING] $rule"
        ((missing_count++))
      fi
    done

    if [[ $missing_count -eq ${#rules[@]} ]]; then
      log_msg "  [ALERT] Directory '$dir' contains NONE of the required cursor rules!"
    elif [[ $missing_count -gt 0 ]]; then
      log_msg "  [WARNING] Directory '$dir' is missing $missing_count of ${#rules[@]} rules."
    else
      log_msg "  [OK] All rules present in '$dir'."
    fi
  done

  log_msg ""
  log_msg "=============================================="
  log_msg " Audit complete. Log written to: $log_file"
  log_msg "=============================================="
}
