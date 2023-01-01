import { defineStore } from "pinia"

export const api_server_base = ref("")
export const api_client_base = ref("")
export const sprite_base = ref("")

export const useStore = defineStore("state", {
  state: () => {
    return {
      puzzle_number: 0,
      guess_data_list: [],
      last_guess_data: undefined,
      locale: undefined,
      api_data: {
        pokemons: [],
        pokemon_local_name_map: new Map(),
        pokemon_english_name_map: new Map(),
      },
      statistics: {
        last_puzzle_number: NaN,
        clear_count: 0,
        last_guess_count: 0,
        total_guess_count: 0,
        streak: 0,
        best_streak: 0,
        last_correct_guess: undefined,
        last_best_guess: undefined,
      },
    } as State
  },
  actions: {
    addGuessResult(guess_result: GuessResult): GuessData {
      const old_guess_data: GuessData | undefined = this.guess_data_list.find(
        (x: GuessData) => x.name === guess_result.name
      )
      if (old_guess_data !== undefined) {
        return old_guess_data
      }
      const guess_data: GuessData = Object.assign(
        { index: this.guess_data_list.length },
        guess_result
      )
      this.guess_data_list.push(guess_data)
      savePuzzleNumber(this.puzzle_number)
      saveGuessDataList(this.guess_data_list)
      return guess_data
    },
    changeLocale(locale: string) {
      if (isValidFluentLocale(locale)) {
        changeFluentLocale(locale)
        apiPokemonNameMap(locale).then((data) => {
          this.api_data.pokemon_local_name_map = new Map()
          this.api_data.pokemon_english_name_map = new Map()
          for (const item of data) {
            this.api_data.pokemon_local_name_map[
              item.local_name.toLowerCase()
            ] = item.english_name
            this.api_data.pokemon_english_name_map[
              item.english_name.toLowerCase()
            ] = item.local_name
          }
          saveApiData(this.api_data)
        })
      }
    },
    translatePokemonName(name: string, to_eng: boolean): string | undefined {
      if (to_eng) {
        return this.api_data.pokemon_local_name_map[name.toLowerCase()]
      } else {
        return this.api_data.pokemon_english_name_map[name.toLowerCase()]
      }
    },
  },
})

export const saveToLocalStorage = (key: string, data: any): void => {
  if (process.client) {
    localStorage.setItem(key, JSON.stringify(data))
  }
}

export const loadFromLocalStorage = (key: string): any | null => {
  if (process.client) {
    const localdata = localStorage.getItem(key)
    if (typeof localdata === "string") {
      return JSON.parse(localdata)
    }
  }
  return null
}

export const saveGuessDataList = (guess_data_list: GuessData[]) =>
  saveToLocalStorage("guess_data_list", guess_data_list)
export const savePuzzleNumber = (puzzle_number: number) =>
  saveToLocalStorage("puzzle_number", puzzle_number)
export const saveStatistics = (statistics: Statistics) =>
  saveToLocalStorage("statistics", statistics)
export const saveApiData = (api_data: ApiData) =>
  saveToLocalStorage("api_data", api_data)

export const loadGuessDataList = (): GuessData[] | null =>
  loadFromLocalStorage("guess_data_list")
export const loadPuzzleNumber = (): number | null =>
  loadFromLocalStorage("puzzle_number")
export const loadStatistics = (): Statistics | null =>
  loadFromLocalStorage("statistics")
export const loadApiData = (): ApiData | null =>
  loadFromLocalStorage("api_data")
