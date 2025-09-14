#!/bin/bash

# Usage: ./fetch.sh filename
# Example: ./fetch.sh data.txt

if [ -z $1 ]; then
    echo "Usage: tldr.sh COMMAND"
    echo "       tldr.sh tar"
    exit 0
fi

CACHE_DIR="$HOME/.config/tldr"
URL_BASE1="https://raw.githubusercontent.com/tldr-pages/tldr/refs/heads/main/pages/common"
URL_BASE2="https://raw.githubusercontent.com/tldr-pages/tldr/refs/heads/main/pages/linux"

FILENAME="$1"
CACHE_FILE="$CACHE_DIR/${FILENAME}.md"

# Create cache directory if it doesn't exist
if [ ! -d "$CACHE_DIR" ]; then
    mkdir -p "$CACHE_DIR"
fi
# Check if file already in cache
if [ -f "$CACHE_FILE" ]; then
    echo "File taken from cache: $CACHE_FILE"
    cat "$CACHE_FILE" | batcat -l md --style=plain
    exit 0
fi

# Try first URL
URL1="$URL_BASE1/${FILENAME}.md"
URL2="$URL_BASE2/${FILENAME}.md"

echo "Attempting to fetch: $URL1"
if curl -f -s -o "$CACHE_FILE" "$URL1"; then
    echo "Downloaded $FILENAME from $URL1"
    cat "$CACHE_FILE" | batcat -l md --style=plain
    exit 0
fi

echo "First URL failed, trying: $URL2"
if curl -f -s -o "$CACHE_FILE" "$URL2"; then
    echo "Downloaded $FILENAME from $URL2"
    cat "$CACHE_FILE" | batcat -l md --style=plain
    exit 0
fi

echo "Both URLs failed. File not downloaded."
exit 1
