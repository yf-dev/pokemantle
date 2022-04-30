<template>
  <div>
    <NuxtLayout name="default">
      <NuxtPage />
    </NuxtLayout>
  </div>
</template>

<script setup lang="ts">
import { trackRouter, useState } from "vue-gtag-next"

const config = useRuntimeConfig()
api_base.value = config.public.apiBase

state.locale = getLocale()
watchEffect(async () => {
  changeLocale(state.locale)
})

state.puzzle_number = todayPuzzleNumber()

apiPokemons().then((data) => (api_data.pokemons = data))

const loaded_statistics = loadStatistics()
statistics.last_puzzle_number = loaded_statistics.last_puzzle_number
statistics.clear_count = loaded_statistics.clear_count
statistics.last_guess_count = loaded_statistics.last_guess_count
statistics.total_guess_count = loaded_statistics.total_guess_count
statistics.last_best_guess = loaded_statistics.last_best_guess
statistics.last_correct_guess = loaded_statistics.last_correct_guess
statistics.streak = loaded_statistics.streak
statistics.best_streak = loaded_statistics.best_streak

const loaded_puzzle_number = loadPuzzleNumber()
if (loaded_puzzle_number === state.puzzle_number) {
  state.guess_data_list = loadGuessDataList()
}

if (process.env.NODE_ENV === 'production' && typeof window !== "undefined") {
  const router = useRouter()
  trackRouter(router)
  useState().property.value = {
    id: config.public.gtagId
  }
}
</script>
