<template>
  <nav class="flex items-center justify-between py-4 mx-auto">
    <NuxtLink to="/" class="font-bold">{{ $t('pokemantle-with-number', { puzzle_number: state.puzzle_number }) }}
    </NuxtLink>
    <select v-model="state.locale" class="rounded py-2 pl-2 border border-gray-200 shadow-sm">
      <option v-for="(_, locale) in fluentBundles" :value="locale">{{ $t('language-locale-' + locale) }}</option>
    </select>
  </nav>
</template>

<script setup lang="ts">
import { state, fluentBundles } from '#imports'
</script>
