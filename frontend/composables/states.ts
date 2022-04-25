export const api_base = ref("")

export const state = reactive<{
  puzzle_number: number;
  pokemons: Pokemon[];
  pokemon_name_map: LocalName[];
  guess_results: GuessResult[];
  locale: string;
}>({
  puzzle_number: 0,
  pokemons: [],
  pokemon_name_map: [],
  guess_results: [],
  locale: 'en',
})
