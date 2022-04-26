export const api_base = ref("")

export const state = reactive<{
  puzzle_number: number;
  pokemons: Pokemon[];
  pokemon_name_map: LocalName[];
  guess_data_list: GuessData[];
  locale: string;
}>({
  puzzle_number: 0,
  pokemons: [],
  pokemon_name_map: [],
  guess_data_list: [],
  locale: 'en',
})
