from typing import List

import uvicorn
import os
from random import Random

from fastapi import FastAPI, Query, Path
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
import pandas as pd
import numpy as np

from .models import ErrorMessage, GuessResult, Pokemon, LocalName
from .poke2vec import (
    calculate_ranks,
    calculate_similarity_vector,
    create_feature_vector,
)

if "POKEMANTLE_POKEDEX" not in os.environ:
    raise Exception("environment variable POKEMANTLE_POKEDEX is not defined")

if "POKEMANTLE_NAME_MAP" not in os.environ:
    raise Exception("environment variable POKEMANTLE_NAME_MAP is not defined")

if "POKEMANTLE_OLD_SECRET" not in os.environ:
    raise Exception("environment variable POKEMANTLE_OLD_SECRET is not defined")

RANDOM = Random(os.environ.get("POKEMANTLE_RANDOM_SEED", 20220516))

POKEDEX = pd.read_csv(os.environ["POKEMANTLE_POKEDEX"]).replace({np.nan: None})
POKEMON_NAME_MAP = pd.read_csv(os.environ["POKEMANTLE_NAME_MAP"])
OLD_SECRET = pd.read_csv(os.environ["POKEMANTLE_OLD_SECRET"], index_col="puzzle_number")

POKEMON_SIZE = len(POKEDEX.index)
OLD_SECRET_SIZE = len(OLD_SECRET.index)
SECRET_INDEXES = RANDOM.sample(range(POKEMON_SIZE), k=POKEMON_SIZE)
SIMILARITY_VECTOR = calculate_similarity_vector(
    feature_vector=create_feature_vector(pokedex=POKEDEX)
)

app = FastAPI(
    docs_url=None if os.environ.get("POKEMANTLE_PRODUCTION", False) else "/docs",
    redoc_url=None,
)

if not os.environ.get("POKEMANTLE_PRODUCTION", False):
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
else:
    app.add_middleware(
        CORSMiddleware,
        allow_origins=[
            os.environ.get("POKEMANTLE_CORS_ORIGIN", "http://localhost:3000")
        ],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )


def secret_index(puzzle_number: int) -> int:
    if puzzle_number <= OLD_SECRET_SIZE:
        name = OLD_SECRET.loc[puzzle_number]["name"]
        return POKEDEX.index[POKEDEX["name"] == name].tolist()[0]
    return SECRET_INDEXES[puzzle_number % POKEMON_SIZE]


@app.get(
    "/languages",
    response_model=List[str],
    responses={
        200: {
            "content": {"application/json": {"example": ["en", "ko"]}},
        },
    },
)
async def languages():
    """The list of all languages"""
    return [name for name in POKEMON_NAME_MAP]


@app.get(
    "/pokemons",
    response_model=List[Pokemon],
)
async def pokemons():
    """The list of all Pokémons"""
    return [POKEDEX.loc[i].to_dict() for i in POKEDEX.index]


@app.get(
    "/pokemon_name_map/{language}",
    response_model=List[LocalName],
)
async def pokemon_name_map(
    language: str = Path(..., description="The language to use", example="ko"),
):
    """The list of all Pokémon's local names"""

    items = [POKEMON_NAME_MAP.loc[i] for i in POKEMON_NAME_MAP.index]
    return [
        LocalName(
            english_name=item["en"],
            local_name=item[language],
        )
        for item in items
    ]


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
        if guess_result.name.lower() == name.lower():
            return guess_result
    return JSONResponse(
        status_code=404,
        content=ErrorMessage(
            code=ErrorMessage.CodeConstant.CODE_POKEMON_NOT_FOUND,
            message="Pokémon not found.",
        ).dict(),
    )
