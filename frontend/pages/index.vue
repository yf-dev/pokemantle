<template>
  <div>
    <MenuBar :subtitle="$t('pokemantle-index-subtitle', { puzzle_number: state.puzzle_number })" />
    <ClientOnly>
      <Share v-if="isFinished" />
    </ClientOnly>
    <GuessInput />
    <ClientOnly>
      <GuessResult :guess_list="state.guess_data_list" :is_show_index="true" :is_show_fixed_last="true"
        v-if="state.guess_data_list.length > 0" />
    </ClientOnly>
    <Faq class="mt-8" />
  </div>
</template>

<script setup lang="ts">
import { state } from '#imports'
const title = fluent.format('pokemantle')
useHead({
  title: title,
  meta: [
    { name: 'og:title', content: title },
    { name: 'og:type', content: 'website' },
    { name: 'og:description', content: fluent.format('og-description') },
  ]
})
const isFinished = computed(() => state.guess_data_list.find((v) => v.rank === 0) !== undefined)
</script>
