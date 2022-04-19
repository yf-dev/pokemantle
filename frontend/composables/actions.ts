export const addGuessResult = (guess_result: GuessResult) => {
  if (!guess_results.some(x => x.name === guess_result.name)) {
    guess_results.push(guess_result)
  }
}
