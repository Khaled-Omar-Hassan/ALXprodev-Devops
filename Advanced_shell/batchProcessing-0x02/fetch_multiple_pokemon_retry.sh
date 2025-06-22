#!/bin/bash

mkdir -p pokemon_data
POKEMONS=(bulbasaur ivysaur venusaur charmander charmeleon)
ERROR_LOG="errors.txt"

for NAME in "${POKEMONS[@]}"; do
    echo "Fetching data for $NAME..."
    ATTEMPTS=0
    SUCCESS=0

    while [ $ATTEMPTS -lt 3 ]; do
        curl -s --fail "https://pokeapi.co/api/v2/pokemon/$NAME" -o "pokemon_data/${NAME}.json"
        if [ $? -eq 0 ]; then
            echo "Saved data to pokemon_data/${NAME}.json ✅"
            SUCCESS=1
            break
        fi
        ((ATTEMPTS++))
        sleep 1
    done

    if [ $SUCCESS -ne 1 ]; then
        echo "Failed to fetch $NAME after 3 attempts" >> "$ERROR_LOG"
    fi
done
