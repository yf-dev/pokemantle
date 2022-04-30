<template>
  <nav class="flex items-center justify-between py-4 mx-auto">
    <div>
      <NuxtLink to="/" class="font-bold text-xl">{{ title }}</NuxtLink>
      <span v-if="subtitle" class="font-bold text-md ml-2 text-gray-700">{{ subtitle }}</span>
    </div>
    <select v-model="state.locale" class="rounded py-2 pl-2 border border-gray-200 shadow-sm">
      <option v-for="(_, locale) in fluentBundles" :value="locale">{{ $t('language-locale-' + locale) }}</option>
    </select>
  </nav>
</template>

<script setup lang="ts">
import { state, fluentBundles } from '#imports'

const props = defineProps({
  title: {
    type: String,
    default: fluent.format('pokemantle')
  },
  subtitle: {
    type: String
  }
})
</script>
