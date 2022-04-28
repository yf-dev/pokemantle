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

const default_statistics = {
  last_puzzle_number: NaN,
  clear_count: 0,
  last_guess_count: 0,
  total_guess_count: 0,
  last_best_rank: 0,
  last_best_similarity: 0,
  streak: 0,
  best_streak: 0,
}

export const statistics = reactive<{
  last_puzzle_number: number;
  clear_count: number;
  last_guess_count: number;
  total_guess_count: number;
  last_best_rank: number;
  last_best_similarity: number;
  streak: number;
  best_streak: number;
}>(default_statistics)

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

export const saveStatistics = () => {
  if (typeof window !== "undefined") {
    localStorage.setItem('statistics', JSON.stringify(statistics))
  }
}

export const loadGuessDataList = (): GuessData[] => {
  if (typeof window !== "undefined") {
    return JSON.parse(localStorage.getItem('guess_data_list') || "[]")
  }
  return []
}

export const loadPuzzleNumber = (): number => {
  if (typeof window !== "undefined") {
    return parseInt(localStorage.getItem('puzzle_number') || state.puzzle_number.toString())
  }
  return state.puzzle_number
}

export const loadStatistics = () => {
  if (typeof window !== "undefined") {
    return JSON.parse(localStorage.getItem('statistics') || JSON.stringify(default_statistics))
  }
  return default_statistics
}