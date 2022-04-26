<template>
  <div class="space-y-4">
    <div v-if="error_message" class="p-4 text-red-700 border-l-4 border-red-700 bg-red-50" role="alert">
      <h3 class="text-sm font-medium">{{ $t(error_message) }}</h3>
    </div>
    <div class="flex items-center justify-center w-full">
      <input v-t:guess-input-input type="text" class="flex-shrink w-full p-2 border-2 border-gray-200 rounded "
        :value="name" @input="(event) => (name = (event.target as HTMLTextAreaElement).value)" @keydown.enter="guess" />
      <button v-t:guess-input-button
        class="inline-flex flex-shrink-0 ml-1 py-2 px-3 font-medium text-white bg-indigo-600 border border-indigo-600 rounded active:text-indigo-500 hover:bg-transparent hover:text-indigo-600 focus:outline-none focus:ring"
        @click="guess"></button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { FetchError } from "ohmyfetch"
const name = ref("")
const error_message = ref("")
async function guess() {
  try {
    error_message.value = ""
    const eng_name = translatePokemonName(name.value, true)
    if (eng_name === undefined) {
      error_message.value = "error-no-such-pokemon"
      name.value = ""
      return
    }
    const data = await apiGuess(state.puzzle_number, translatePokemonName(name.value, true))
    addGuessResult(data)
    name.value = ""
  } catch (e) {
    if (e instanceof FetchError) {
      error_message.value = "error-no-such-pokemon"
      name.value = ""
      return
    } else {
      error_message.value = "error-unknown"
      name.value = ""
      return
    }
  }
}
</script>
