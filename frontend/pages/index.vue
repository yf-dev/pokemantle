<template>
  <div class="container max-w-xl mx-auto px-2">
    <MenuBar />
    <ClientOnly>
      <Share v-if="isFinished" />
    </ClientOnly>
    <GuessInput />
    <GuessResult />
  </div>
</template>

<script setup lang="ts">
const title = fluent.format('pokemantle-with-number', { puzzle_number: state.puzzle_number })
useHead({
  title: title,
  meta: [
    { name: 'og:title', content: fluent.format('pokemantle-with-number', { puzzle_number: state.puzzle_number }) },
    { name: 'og:type', content: 'website' },
  ]
})
const isFinished = computed(() => state.guess_data_list.find((v) => v.rank === 0) !== undefined)
</script>