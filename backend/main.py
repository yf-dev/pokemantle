from typing import List

import uvicorn
import os
from random import Random

from fastapi import FastAPI, Query, Path
from fastapi.responses import JSONResponse
import pandas as pd
import numpy as np

from .models import ErrorMessage, GuessResult, Pokemon
from .poke2vec import (
    calculate_ranks,
    calculate_similarity_vector,
    create_feature_vector,
)

if "POKEMANTLE_POKEDEX" not in os.environ:
    raise Exception("environment variable POKEMANTLE_POKEDEX is not defined")

RANDOM = Random(os.environ.get("POKEMANTLE_RANDOM_SEED", 20211101))

POKEDEX = pd.read_csv(os.environ["POKEMANTLE_POKEDEX"]).replace({np.nan: None})
POKEMON_SIZE = len(POKEDEX.index)
SECRET_INDEXES = RANDOM.sample(range(POKEMON_SIZE), k=POKEMON_SIZE)
SIMILARITY_VECTOR = calculate_similarity_vector(
    feature_vector=create_feature_vector(pokedex=POKEDEX)
)


app = FastAPI()


def secret_index(puzzle_number: int) -> int:
    print(puzzle_number % POKEMON_SIZE)
    return SECRET_INDEXES[puzzle_number % POKEMON_SIZE]


@app.get(
    "/pokemons",
    response_model=List[Pokemon],
)
async def pokemons():
    """The list of all Pokémons"""
    return [POKEDEX.loc[i].to_dict() for i in POKEDEX.index]


@app.get(
    "/rank/{puzzle_number}",
    response_model=List[GuessResult],
)
async def rank(
    puzzle_number: int = Path(..., description="Number of Pokémantle.", example=1),
):
    """Similarity ranking"""
    index = secret_index(puzzle_number)
    ranks = calculate_ranks(
        pokemon_index=index,
        pokedex=POKEDEX,
        similarity_vector=SIMILARITY_VECTOR,
    )
    return ranks


@app.get(
    "/guess/{puzzle_number}",
    response_model=GuessResult,
    responses={
        404: {
            "model": ErrorMessage,
            "description": "The Pokémon was not found",
            "content": {
                "application/json": {
                    "example": ErrorMessage(
                        code=ErrorMessage.CodeConstant.CODE_POKEMON_NOT_FOUND,
                        message="Pokémon not found.",
                    )
                }
            },
        }
    },
)
async def guess(
    puzzle_number: int = Path(..., description="Number of Pokémantle.", example=1),
    name: str = Query(..., description="Pokémon's English name.", example="Mimikyu"),
):
    """Guess the Pokémon"""
    index = secret_index(puzzle_number)
    ranks = calculate_ranks(
        pokemon_index=index,
        pokedex=POKEDEX,
        similarity_vector=SIMILARITY_VECTOR,
    )
    for guess_result in ranks:
        if guess_result.name == name:
            return guess_result
    return JSONResponse(
        status_code=404,
        content=ErrorMessage(
            code=ErrorMessage.CodeConstant.CODE_POKEMON_NOT_FOUND,
            message="Pokémon not found.",
        ).dict(),
    )


def start():
    uvicorn.run("backend.main:app", host="0.0.0.0", port=8000, reload=True)
