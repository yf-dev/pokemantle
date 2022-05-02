<template>
  <nav class="flex items-center justify-between py-4 mx-auto">
    <div>
      <NuxtLink to="/" class="font-bold text-xl dark:text-slate-200">{{ title }}</NuxtLink>
      <span v-if="subtitle" class="font-bold text-md ml-2 text-gray-700 dark:text-slate-300">{{ subtitle }}</span>
    </div>
    <div class="inline-flex">
      <button v-if="$colorMode.value === 'dark'" class="p-2 mr-2" @click="$colorMode.preference = 'light'">
        <SunIcon></SunIcon>
      </button>
      <button v-if="$colorMode.value === 'light'" class="p-2 mr-2" @click="$colorMode.preference = 'dark'">
        <MoonIcon></MoonIcon>
      </button>
      <select v-model="state.locale"
        class="rounded py-2 pl-2 border border-gray-200 dark:border-slate-600 dark:bg-slate-700 dark:text-slate-200 shadow-sm">
        <option v-for="(_, locale) in fluentBundles" :value="locale">{{ $t('language-locale-' + locale) }}</option>
      </select>
    </div>
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
