<template>
  <tr
    v-bind="$attrs"
    :class="mainClass"
    @click="is_show_pokemon_info = !is_show_pokemon_info"
  >
    <td class="p-2" v-if="is_show_index">{{ guess_data.index + 1 }}</td>
    <td class="p-2">
      {{ state.translatePokemonName(guess_data.name, false) }}
    </td>
    <td
      class="p-2"
      :style="{
        color: similarityColor(guess_data.rank),
      }"
    >
      {{ (guess_data.similarity * 100).toFixed(2) }}
    </td>
    <td
      class="p-2"
      :style="{
        background:
          'linear-gradient(to left, transparent ' +
          rankPercent +
          '%, ' +
          ($colorMode.value === 'dark' ? '#125409' : '#9bff8d') +
          ' ' +
          rankPercent +
          '%)',
      }"
    >
      {{ isCorrect ? $t("correct-guess") : guess_data.rank }}
    </td>
  </tr>
  <tr v-if="is_show_pokemon_info">
    <td class="p-2" :colspan="is_show_index ? 4 : 3">
      <PokemonInfo :pokemon="pokemon"></PokemonInfo>
    </td>
  </tr>
</template>

<script setup lang="ts">
const state = useStore()
const colorMode = useColorMode()
const props = defineProps<{
  guess_data: GuessData
  is_show_index?: boolean
}>()

const is_show_pokemon_info = ref(false)

const mainClass = computed(() => {
  const klass = "cursor-pointer"
  const attrs = useAttrs()
  return attrs.class ? `${attrs.class} ${klass}` : klass
})

const rankPercent = computed(() => {
  return (props.guess_data.rank / state.api_data.pokemons.length) * 100
})
const isCorrect = computed(() => {
  return props.guess_data.rank === 0
})
const pokemon = computed(() => {
  return state.api_data.pokemons.find((v) => v.name === props.guess_data.name)
})

const pokemonCount = computed(() => state.api_data.pokemons.length)

function similarityColor(rank: number): string {
  const relative_rank = 1 - Math.pow(1 - rank / pokemonCount.value, 5) // easeOutQuint
  if (colorMode.value === "dark") {
    return `rgb(203, ${213 * relative_rank}, ${225 * relative_rank})`
  }
  return `rgb(${255 * (1 - relative_rank)}, 0, 0)`
}
</script>
