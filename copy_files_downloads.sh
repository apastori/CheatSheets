#!/usr/bin/env bash

# Directories
SRC="/c/Users/alfon/Downloads"
DEST="/c/Users/alfon/Desktop/code/code-books/Second_Brain"

# Date
TODAY=$(date +%Y-%m-%d)

# Log file inside source folder
LOG_FILE="$SRC/move_pdfs_$TODAY.log"

echo "[$(date)] Starting PDF move process" | tee -a "$LOG_FILE"
echo "Source: $SRC" | tee -a "$LOG_FILE"
echo "Destination: $DEST" | tee -a "$LOG_FILE"
echo "------------------------------------------------------" | tee -a "$LOG_FILE"

# Move today's PDFs WITHOUT renaming
find "$SRC" -type f -iname "*.pdf" -newermt "$TODAY" ! -newermt "$TODAY +1 day" ! -name "move_pdfs_*.log" | while read -r file; do
    echo "[$(date)] Moving: $file -> $DEST/" | tee -a "$LOG_FILE"
    mv -n "$file" "$DEST/" 2>>"$LOG_FILE"
done

echo "[$(date)] Process finished" | tee -a "$LOG_FILE"
