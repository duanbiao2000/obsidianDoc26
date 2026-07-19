#!/bin/bash
# update-tracker.sh
# Usage: ./update-tracker.sh "<raw_path>" "<wiki_page>" [status]
# Example: ./update-tracker.sh "raw/20_Prompts/xxx.md" "wiki/prompts/xxx.md" done

set -e

RAW_PATH="$1"
WIKI_PAGE="$2"
STATUS="${3:-done}"
DATE=$(date +%Y-%m-%d)

if [ -z "$RAW_PATH" ] || [ -z "$WIKI_PAGE" ]; then
    echo "Usage: $0 <raw_path> <wiki_page> [status]"
    exit 1
fi

echo "| \`$RAW_PATH\` | \`$WIKI_PAGE\` | $STATUS | $DATE | Batch conversion |" >> wiki/meta/Conversion-Tracker.md

echo "✅ Tracker updated with: $RAW_PATH → $WIKI_PAGE ($STATUS)"