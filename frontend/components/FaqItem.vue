<template>
  <details class="group">
    <summary
      class="flex items-center justify-between p-4 rounded cursor-pointer dark:text-slate-200 bg-gray-50 dark:bg-slate-700">
      <h5 class="font-medium text-gray-900 dark:text-slate-200">
        {{ title }}
      </h5>
      <svg class="flex-shrink-0 ml-1.5 w-5 h-5 transition duration-300 group-open:-rotate-180"
        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
      </svg>
    </summary>
    <p class="px-4 mt-4 leading-relaxed text-gray-700 dark:text-slate-300">
      <slot></slot>
    </p>
  </details>
</template>

<script setup lang="ts">
const props = defineProps<{
  title: string
}>()
</script>
