<template>
  <div>
    <NuxtPage />
  </div>
</template>

<script setup lang="ts">
const config = useRuntimeConfig()
api_base.value = config.public.apiBase
</script>
