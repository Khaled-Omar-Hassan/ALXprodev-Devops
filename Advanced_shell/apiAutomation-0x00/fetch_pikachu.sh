#!/bin/bash

URL="https://pokeapi.co/api/v2/pokemon/pikachu"
OUTPUT="data.json"
ERROR_LOG="errors.txt"

curl -s --fail "$URL" -o "$OUTPUT"
if [ $? -ne 0 ]; then
    echo "Failed to fetch data for Pikachu at $(date)" >> "$ERROR_LOG"
fi
