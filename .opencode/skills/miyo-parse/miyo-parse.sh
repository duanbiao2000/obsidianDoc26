#!/bin/sh
# Parse one local PDF or EPUB through the Miyo CLI and print Markdown/text.
die() {
  printf '%s\n' "$1" >&2
  exit "${2:-2}"
}

FILE="$1"
[ -n "$FILE" ] || die "Usage: sh miyo-parse.sh <file>" 1

# Absolute install path first (Obsidian shells often miss Miyo's bin on PATH).
if [ -x "$HOME/.miyo/bin/miyo" ]; then
  MIYO="$HOME/.miyo/bin/miyo"
elif command -v miyo >/dev/null 2>&1; then
  MIYO=miyo
else
  die "Miyo CLI not found (no ~/.miyo/bin/miyo and 'miyo' not on PATH). The Miyo desktop app is not installed — tell the user to install Miyo, then retry. Do not retry in a loop." 3
fi

"$MIYO" parse "$FILE"
