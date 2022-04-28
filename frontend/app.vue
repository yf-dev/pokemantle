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

const loaded_puzzle_number = loadPuzzleNumber()
if (loaded_puzzle_number === state.puzzle_number) {
  state.guess_data_list = loadGuessDataList()
}
</script>
