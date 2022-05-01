export const api_base = ref("")

export const state = reactive<State>({
  puzzle_number: 0,
  guess_data_list: [],
  last_guess_data: undefined,
  locale: undefined,
})

const default_api_data = {
  pokemons: [],
  pokemon_local_name_map: new Map(),
  pokemon_english_name_map: new Map(),
}

export const api_data = reactive<ApiData>(default_api_data)

const default_statistics = {
  last_puzzle_number: NaN,
  clear_count: 0,
  last_guess_count: 0,
  total_guess_count: 0,
  streak: 0,
  best_streak: 0,
  last_correct_guess: undefined,
  last_best_guess: undefined,
}

export const statistics = reactive<Statistics>(default_statistics)

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

export const saveApiData = () => {
  if (typeof window !== "undefined") {
    localStorage.setItem('api_data', JSON.stringify(api_data))
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

export const loadStatistics = (): Statistics => {
  if (typeof window !== "undefined") {
    const data = JSON.parse(localStorage.getItem('statistics') || JSON.stringify(default_statistics))

    if (typeof data.last_best_rank !== "undefined") {
      // this is old format. try to convert
      // TODO: remove this
      data.last_best_guess = {
        name: "",
        rank: data.last_best_rank,
        similarity: data.last_best_similarity,
      }
      data.last_correct_guess = undefined
    }
    return data
  }
  return default_statistics
}

export const loadApiData = (): ApiData => {
  if (typeof window !== "undefined") {
    const data = JSON.parse(localStorage.getItem('api_data') || JSON.stringify(default_api_data))
    return data
  }
  return default_api_data
}