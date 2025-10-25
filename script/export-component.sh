#!/bin/bash
DIR=$(dirname "$0")
DIR="$DIR/.."
INDEX_FILE="$DIR/src/component/index.ts"

echo > "$INDEX_FILE"

for dir in "$DIR/src/component/"*/; do
    if [ -d "$dir" ] && [ "$(basename "$dir")" != "node_modules" ]; then
        dir_name=$(basename "$dir")
        echo "export * from './$dir_name'" >> "$INDEX_FILE"
    fi
done
