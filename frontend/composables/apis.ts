export const apiLanguages = () =>
  $fetch<Array<string>>(`${api_base.value}/languages`)

export const apiPokemons = () =>
  $fetch<Array<Pokemon>>(`${api_base.value}/pokemons`)

export const apiPokemonNameMap = (language: string) =>
  $fetch<Array<LocalName>>(`${api_base.value}/pokemon_name_map/${language}`)

export const apiRank = (puzzle_number: number) =>
  $fetch<Array<GuessResult>>(`${api_base.value}/rank/${puzzle_number}`)

export const apiGuess = (puzzle_number: number, name: string) =>
  $fetch<GuessResult>(`${api_base.value}/guess/${puzzle_number}?name=${name}`)
