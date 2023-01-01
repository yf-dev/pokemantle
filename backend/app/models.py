from typing import Optional
from pydantic import BaseModel, Field


class Pokemon(BaseModel):
    name: str = Field(..., example="Mimikyu")
    generation: int = Field(..., example=7)
    status: str = Field(..., example="Normal")
    species: str = Field(..., example="Disguise Pokémon")
    is_paldean: bool = Field(..., example=False)
    is_hisuian: bool = Field(..., example=False)
    is_galarian: bool = Field(..., example=False)
    is_alolan: bool = Field(..., example=False)
    is_mega: bool = Field(..., example=False)
    is_gigantamax: bool = Field(..., example=False)
    is_partner: bool = Field(..., example=False)
    has_form_difference: bool = Field(..., example=True)
    is_forme_change: bool = Field(..., example=False)
    type_number: int = Field(..., example=2)
    type_1: str = Field(..., example="Ghost")
    type_2: Optional[str] = Field(None, example="Fairy")
    height_m: float = Field(..., example=0.2)
    weight_kg: float = Field(..., example=0.7)
    abilities_number: int = Field(..., example=1)
    ability_1: Optional[str] = Field(None, example="Disguise")
    ability_2: Optional[str] = Field(None, example=None)
    ability_hidden: Optional[str] = Field(None, example=None)
    total_points: int = Field(..., example=476)
    hp: int = Field(..., example=55)
    attack: int = Field(..., example=90)
    defense: int = Field(..., example=80)
    sp_attack: int = Field(..., example=50)
    sp_defense: int = Field(..., example=105)
    speed: int = Field(..., example=96)
    catch_rate: Optional[int] = Field(None, example=45)
    base_friendship: Optional[int] = Field(None, example=70)
    base_experience: Optional[int] = Field(None, example=167)
    growth_rate: Optional[str] = Field(None, example="Medium Fast")
    egg_type_number: int = Field(..., example=1)
    egg_type_1: Optional[str] = Field(None, example="Amorphous")
    egg_type_2: Optional[str] = Field(None, example=None)
    percentage_male: Optional[int] = Field(None, example=50)
    egg_cycles: Optional[int] = Field(None, example=20)
    against_normal: float = Field(..., example=0)
    against_fire: float = Field(..., example=1)
    against_water: float = Field(..., example=1)
    against_electric: float = Field(..., example=1)
    against_grass: float = Field(..., example=1)
    against_ice: float = Field(..., example=1)
    against_fight: float = Field(..., example=0)
    against_poison: float = Field(..., example=1)
    against_ground: float = Field(..., example=1)
    against_flying: float = Field(..., example=1)
    against_psychic: float = Field(..., example=1)
    against_bug: float = Field(..., example=0.25)
    against_rock: float = Field(..., example=1)
    against_ghost: float = Field(..., example=2)
    against_dragon: float = Field(..., example=0)
    against_dark: float = Field(..., example=1)
    against_steel: float = Field(..., example=2)
    against_fairy: float = Field(..., example=1)
    image_path: Optional[str] = Field(..., example='0.png')


class LocalName(BaseModel):
    english_name: str = Field(..., example="Mimikyu")
    local_name: str = Field(..., example="따라큐")


class ErrorMessage(BaseModel):
    code: int = Field(..., example=11)
    message: str = Field(..., example="Pokémon not found.")

    class CodeConstant:
        CODE_POKEMON_NOT_FOUND = 11


class GuessResult(BaseModel):
    name: str = Field(..., example="Mimikyu")
    rank: int = Field(..., example=942)
    similarity: float = Field(..., example=0.40116975602242083)
