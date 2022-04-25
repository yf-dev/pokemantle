<template>
  <div>
    <table>
      <thead>
        <tr>
          <th>{{ $t('guess-result-header-name') }}</th>
          <th>{{ $t('guess-result-header-similarity') }}</th>
          <th>{{ $t('guess-result-header-rank') }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="guess_result in sortedGuessResults">
          <td>{{ translatePokemonName(guess_result.name, false) }}</td>
          <td>{{ (guess_result.similarity * 100).toFixed(2) }}</td>
          <td>{{ guess_result.rank }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup lang="ts">
import { state, translatePokemonName } from '#imports'

const sortedGuessResults = computed(() => {
  return [...state.guess_results].sort((a, b) => { return a.rank - b.rank })
})

</script>
