from typing import List
import numpy as np
import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity, euclidean_distances
from sklearn.preprocessing import normalize

from .models import GuessResult


def calculate_similarity_vector(pokedex: pd.DataFrame) -> np.ndarray:
    generation_oh = pd.get_dummies(pokedex.loc[:, "generation"], prefix="generation_")
    status_oh = pd.get_dummies(pokedex.loc[:, "status"], prefix="status_")

    species_oh = pd.get_dummies(pokedex.loc[:, "species"], prefix="species_")

    type_1_oh = pd.get_dummies(pokedex.loc[:, "type_1"], prefix="type_")
    type_2_oh = pd.get_dummies(pokedex.loc[:, "type_2"], prefix="type_")
    type_oh = type_1_oh.add(type_2_oh).fillna(0).astype("Int64")

    ability_1_oh = pd.get_dummies(pokedex.loc[:, "ability_1"], prefix="ability_")
    ability_2_oh = pd.get_dummies(pokedex.loc[:, "ability_2"], prefix="ability_")
    ability_hidden_oh = pd.get_dummies(
        pokedex.loc[:, "ability_hidden"], prefix="ability_"
    )
    ability_oh = (
        ability_1_oh.add(ability_2_oh).add(ability_hidden_oh).fillna(0).astype("Int64")
    )

    growth_rate_oh = pd.get_dummies(
        pokedex.loc[:, "growth_rate"], prefix="growth_rate_"
    )

    egg_type_1_oh = pd.get_dummies(pokedex.loc[:, "egg_type_1"], prefix="egg_type_")
    egg_type_2_oh = pd.get_dummies(pokedex.loc[:, "egg_type_2"], prefix="egg_type_")
    egg_type_oh = egg_type_1_oh.add(egg_type_2_oh).fillna(0).astype("Int64")

    dropped_pokedex = pokedex.drop(
        columns=[
            # unused columns
            "pokedex_number",
            "name",
            "image_path",
            # missing columns
            "catch_rate",
            "base_friendship",
            "base_experience",
            "percentage_male",
            "egg_cycles",
            # one-hot columns
            "generation",
            "status",
            "species",
            "type_1",
            "type_2",
            "ability_1",
            "ability_2",
            "ability_hidden",
            "growth_rate",
            "egg_type_1",
            "egg_type_2",
        ]
    )

    feature_vector_cosine: np.ndarray = (
        dropped_pokedex.drop(
            columns=[
                # numaric columns
                "type_number",
                "height_m",
                "weight_kg",
                "abilities_number",
                "total_points",
                "hp",
                "attack",
                "defense",
                "sp_attack",
                "sp_defense",
                "speed",
                "egg_type_number",
                "against_normal",
                "against_fire",
                "against_water",
                "against_electric",
                "against_grass",
                "against_ice",
                "against_fight",
                "against_poison",
                "against_ground",
                "against_flying",
                "against_psychic",
                "against_bug",
                "against_rock",
                "against_ghost",
                "against_dragon",
                "against_dark",
                "against_steel",
                "against_fairy",
            ]
        )
        .join(
            [
                generation_oh,
                status_oh,
                species_oh,
                type_oh,
                ability_oh,
                growth_rate_oh,
                egg_type_oh,
            ]
        )
        .values
    )
    feature_vector_euclidean: np.ndarray = normalize(
        dropped_pokedex.values, axis=0, norm="max"
    )
    return (
        (calculate_cosine_similarity_vector(feature_vector_cosine) * 2)
        + (calculate_euclidean_similarity_vector(feature_vector_euclidean) * 1)
    ) / 3


def calculate_cosine_similarity_vector(feature_vector: np.ndarray) -> np.ndarray:
    similarity_vector: np.ndarray = cosine_similarity(feature_vector)
    return similarity_vector


def calculate_euclidean_similarity_vector(feature_vector: np.ndarray) -> np.ndarray:
    similarity_vector: np.ndarray = euclidean_distances(feature_vector)
    return np.ones_like(similarity_vector) - normalize(
        similarity_vector, axis=1, norm="max"
    )


def calculate_ranks(
    pokemon_index: int, pokedex: pd.DataFrame, similarity_vector: np.ndarray
) -> List[GuessResult]:
    similarities = similarity_vector[pokemon_index]
    rank_indexes = similarities.argsort()[::-1]
    pokemon_names = pokedex["name"].values
    return [
        GuessResult(
            name=pokemon_names[index],
            rank=rank,
            similarity=similarities[index],
        )
        for rank, index in enumerate(rank_indexes)
    ]
