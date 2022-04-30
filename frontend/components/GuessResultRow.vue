<template>
  <tr>
    <td class="p-2" v-if="is_show_index">{{ guess_data.index + 1 }}</td>
    <td class="p-2">{{ translatePokemonName(guess_data.name, false) }}</td>
    <td class="p-2">{{ (guess_data.similarity * 100).toFixed(2) }}</td>
    <td class="p-2"
      :style="{ background: 'linear-gradient(to left, transparent ' + rankPercent + '%, #9bff8d ' + rankPercent + '%)' }">
      {{
          isCorrect ? $t('correct-guess') : guess_data.rank
      }}</td>
  </tr>
</template>

<script setup lang="ts">
import { translatePokemonName } from '#imports'
const props = defineProps<{
  guess_data: GuessData
  is_show_index?: boolean,
}>()
const rankPercent = computed(() => {
  return props.guess_data.rank / api_data.pokemons.length * 100
})
const isCorrect = computed(() => {
  return props.guess_data.rank === 0
})
</script>
