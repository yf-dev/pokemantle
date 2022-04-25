<template>
  <div>
    <p :v-if="error_message">{{ $t(error_message) }}</p>
    <input v-t:guess-input-input type="text" class="border rounded border-black" :value="name"
      @input="(event) => (name = (event.target as HTMLTextAreaElement).value)" @keydown.enter="guess" />
    <button v-t:guess-input-button class="border rounded border-black" @click="guess"></button>
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
