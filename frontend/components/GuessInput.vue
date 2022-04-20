<template>
  <div>
    <input
      type="text"
      class="border rounded border-black"
      placeholder="이름"
      :value="name"
      @input="(event) => (name = event.target.value)"
      @keydown.enter="guess"
    />
    <button class="border rounded border-black" @click="guess">추측</button>
  </div>
</template>

<script setup lang="ts">
import { FetchError } from "ohmyfetch"
const name = ref("")
async function guess() {
  try {
    const data = await apiGuess(puzzle_number.value, name.value)
    addGuessResult(data)
    name.value = ""
  } catch (e) {
    if (e instanceof FetchError) {
      console.error(e.data.code === 11)
    } else {
      throw e
    }
  }
}
</script>
