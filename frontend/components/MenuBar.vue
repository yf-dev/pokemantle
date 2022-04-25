<template>
  <div>
    <select v-model="state.locale">
      <option v-for="(_, locale) in fluentBundles" :value="locale">{{ $t('language-locale-' + locale) }}</option>
    </select>
  </div>
</template>

<script setup lang="ts">
import { state, fluentBundles } from '#imports'

watch(() => state.locale, (newLocale, _) => {
  changeLocale(newLocale)
})

state.locale = getLocale()

</script>
