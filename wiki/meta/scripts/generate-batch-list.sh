#!/bin/bash
# generate-batch-list.sh
# Usage: ./generate-batch-list.sh <source_folder> <batch_name>
# Example: ./generate-batch-list.sh "raw/20_Prompts/copilot/custom" "Prompts-Batch-02"

set -e

SOURCE="$1"
BATCH_NAME="$2"
OUTPUT_FILE="${BATCH_NAME}-files.txt"

if [ -z "$SOURCE" ] || [ -z "$BATCH_NAME" ]; then
    echo "Usage: $0 <source_folder> <batch_name>"
    exit 1
fi

echo "# ${BATCH_NAME} - File List" > "$OUTPUT_FILE"
echo "Generated: $(date '+%Y-%m-%d %H:%M:%S')" >> "$OUTPUT_FILE"
echo "Source: $SOURCE" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Find all markdown files
find "$SOURCE" -name "*.md" | sort >> "$OUTPUT_FILE"

COUNT=$(wc -l < "$OUTPUT_FILE")
echo "✅ File list saved to $OUTPUT_FILE"
echo "Total files found: $COUNT"