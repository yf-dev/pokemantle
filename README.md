# Pokémantle

https://pokemantle.update.sh/

Pokémon guessing game inspired by [Semantle](https://semantle.novalis.org/)

## Clone

```bash
git clone --recursive https://github.com/yf-dev/pokemantle.git
```

## Start server

```bash
docker-compose up # http://localhost:3000/
```

## Generate old_secret.csv

```bash
cd backend
poetry run poe export-old-secret 10
```

## Validate data

```bash
cd backend
poetry run poe validate-data
```

## Data source

pokedex.csv is based on [Complete Pokemon Dataset](https://www.kaggle.com/datasets/mariotormo/complete-pokemon-dataset-updated-090420) by Mario Tormo Romero, CC BY-SA 4.0

images are based on [PokéAPI Sprites](https://github.com/PokeAPI/sprites), CC0 1.0 Universal

# LICENSE

MIT
