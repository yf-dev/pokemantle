interface Pokemon {
  name: string
  generation: number
  status: string
  species: string
  is_galarian: boolean
  is_alolan: boolean
  is_mega: boolean
  is_partner: boolean
  has_form_difference: boolean
  is_forme_change: boolean
  type_number: number
  type_1: string
  type_2?: string
  height_m: number
  weight_kg: number
  abilities_number: number
  ability_1?: string
  ability_2?: string
  ability_hidden?: string
  total_points: number
  hp: number
  attack: number
  defense: number
  sp_attack: number
  sp_defense: number
  speed: number
  catch_rate?: number
  base_friendship?: number
  base_experience?: number
  growth_rate?: string
  egg_type_number: number
  egg_type_1?: string
  egg_type_2?: string
  percentage_male?: number
  egg_cycles?: number
  against_normal: number
  against_fire: number
  against_water: number
  against_electric: number
  against_grass: number
  against_ice: number
  against_fight: number
  against_poison: number
  against_ground: number
  against_flying: number
  against_psychic: number
  against_bug: number
  against_rock: number
  against_ghost: number
  against_dragon: number
  against_dark: number
  against_steel: number
  against_fairy: number
}


interface LocalName {
  english_name: string
  local_name: string
}

interface GuessResult {
  name: string
  rank: number
  similarity: number
}

interface GuessData {
  index: number
  name: string
  rank: number
  similarity: number
}
