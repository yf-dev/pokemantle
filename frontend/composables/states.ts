export const api_base = ref("")
export const puzzle_number = ref(todayPuzzleNumber())
export const guess_results = reactive<Array<GuessResult>>([])
