<template>
  <div>
    <input type="text" class="border rounded border-black" placeholder="포켓몬 이름" />
    <button class="border rounded border-black" @click="guess">추측</button>
  </div>
</template>

<script setup>

async function guess() {
  const pokemon = "Mimikyu"
  const puzzle_number = 1
  const { data } = await useFetch(`http://localhost:8000/guess/${puzzle_number}?name=${pokemon}`)
  addGuessResult(data.value)
  console.log(guess_results)
}
</script>