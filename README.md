Pokémantle
==========

https://pokemantle.update.sh/

Pokémon guessing game inspired by [Semantle](https://semantle.novalis.org/)

# Start server

```bash
docker-compose up # http://localhost:3000/
```

# Generate old_secret.csv

```bash
python -m app.export_old_secret 10 > ../data/old_secret_temp.csv
```

# Data source

pokedex.csv is based on [Complete Pokemon Dataset](https://www.kaggle.com/datasets/mariotormo/complete-pokemon-dataset-updated-090420) by Mario Tormo Romero, CC BY-SA 4.0

# LICENSE

MIT
