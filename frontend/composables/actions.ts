export const addGuessResult = (guess_result: GuessResult) => {
  if (!state.guess_results.some((x) => x.name === guess_result.name)) {
    state.guess_results.push(guess_result)
  }
}
