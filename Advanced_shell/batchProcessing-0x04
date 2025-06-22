#!/bin/bash

mkdir -p pokemon_data
POKEMONS=(bulbasaur ivysaur venusaur charmander charmeleon)

fetch_pokemon() {
    NAME="$1"
    echo "Fetching data for $NAME..."
    curl -s "https://pokeapi.co/api/v2/pokemon/$NAME" -o "pokemon_data/${NAME}.json"
    if [ $? -eq 0 ]; then
        echo "Saved data to pokemon_data/${NAME}.json ✅"
    else
        echo "Failed to fetch $NAME ❌"
    fi
}

for NAME in "${POKEMONS[@]}"; do
    fetch_pokemon "$NAME" &
done

wait
echo "All fetch operations completed."
