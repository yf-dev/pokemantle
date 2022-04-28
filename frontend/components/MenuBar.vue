<template>
  <nav class="flex items-center justify-between py-4 mx-auto">
    <NuxtLink to="/" class="font-bold">{{ $t('pokemantle', { puzzle_number: state.puzzle_number }) }}</NuxtLink>
    <select v-model="state.locale" class="rounded py-2 pl-2 border-2 border-gray-200">
      <option v-for="(_, locale) in fluentBundles" :value="locale">{{ $t('language-locale-' + locale) }}</option>
    </select>
  </nav>
</template>

<script setup lang="ts">
import { state, fluentBundles } from '#imports'
</script>
