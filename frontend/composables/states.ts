export const api_base = ref("")

export const state = reactive<{
  puzzle_number: number;
  guess_data_list: GuessData[];
  last_guess_data: GuessData | undefined;
  locale: string | undefined;
}>({
  puzzle_number: 0,
  guess_data_list: [],
  last_guess_data: undefined,
  locale: undefined,
})

export const api_data = reactive<{
  pokemons: Pokemon[];
  pokemon_name_map: LocalName[];
}>({
  pokemons: [],
  pokemon_name_map: [],
})

export const saveGuessDataList = (guess_data_list: GuessData[]) => {
  if (typeof window !== "undefined") {
    localStorage.setItem('guess_data_list', JSON.stringify(guess_data_list))
  }
}

export const savePuzzleNumber = (puzzle_number: number) => {
  if (typeof window !== "undefined") {
    localStorage.setItem('puzzle_number', puzzle_number.toString())
  }
}

export const loadGuessDataList = (): GuessData[] => {
  if (typeof window !== "undefined") {
    return JSON.parse(localStorage.getItem('guess_data_list') || "[]")
  }
}

export const loadPuzzleNumber = (): number => {
  if (typeof window !== "undefined") {
    return parseInt(localStorage.getItem('puzzle_number') || state.puzzle_number.toString())
  }
}