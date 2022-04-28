<template>
  <div>
    <NuxtPage />
  </div>
</template>

<script setup lang="ts">
const config = useRuntimeConfig()
api_base.value = config.public.apiBase

state.locale = getLocale()
watchEffect(async () => {
  changeLocale(state.locale)
})

state.puzzle_number = todayPuzzleNumber()

apiPokemons().then(data => api_data.pokemons = data)

const loaded_statistics = loadStatistics()
statistics.last_puzzle_number = loaded_statistics.last_puzzle_number
statistics.clear_count = loaded_statistics.clear_count
statistics.last_guess_count = loaded_statistics.last_guess_count
statistics.total_guess_count = loaded_statistics.total_guess_count
statistics.last_best_rank = loaded_statistics.last_best_rank
statistics.last_best_similarity = loaded_statistics.last_best_similarity
statistics.streak = loaded_statistics.streak
statistics.best_streak = loaded_statistics.best_streak

const loaded_puzzle_number = loadPuzzleNumber()
if (loaded_puzzle_number === state.puzzle_number) {
  state.guess_data_list = loadGuessDataList()
}
</script>
