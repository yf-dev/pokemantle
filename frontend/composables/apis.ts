export const apiGuess = (puzzle_number: number, name: string) =>
  $fetch<GuessResult>(`${api_base.value}/guess/${puzzle_number}?name=${name}`)
