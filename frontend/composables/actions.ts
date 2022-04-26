export const addGuessResult = (guess_result: GuessResult) => {
  if (!state.guess_data_list.some((x) => x.name === guess_result.name)) {
    state.guess_data_list.push(Object.assign({ index: state.guess_data_list.length }, guess_result))
  }
}
