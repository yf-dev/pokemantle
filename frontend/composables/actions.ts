export const addGuessResult = (guess_result: GuessResult): GuessData => {
  const old_guess_data: GuessData | undefined = state.guess_data_list.find((x) => x.name === guess_result.name)
  if (old_guess_data !== undefined) {
    return old_guess_data
  }
  const guess_data: GuessData = Object.assign({ index: state.guess_data_list.length }, guess_result)
  state.guess_data_list.push(guess_data)
  savePuzzleNumber(state.puzzle_number)
  saveGuessDataList(state.guess_data_list)
  return guess_data
}

export const changeLocale = (locale: string) => {
  if (isValidFluentLocale) {
    changeFluentLocale(locale)
    apiPokemonNameMap(locale).then((data) => {
      api_data.pokemon_local_name_map = new Map()
      api_data.pokemon_english_name_map = new Map()
      for (const item of data) {
        api_data.pokemon_local_name_map[item.local_name.toLowerCase()] = item.english_name
        api_data.pokemon_english_name_map[item.english_name.toLowerCase()] = item.local_name
      }
    })
  }
}

export const translatePokemonName = (name: string, to_eng: boolean): string | undefined => {
  if (to_eng) {
    return api_data.pokemon_local_name_map[name.toLowerCase()];
  } else {
    return api_data.pokemon_english_name_map[name.toLowerCase()];
  }
}
