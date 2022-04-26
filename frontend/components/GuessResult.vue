<template>
  <table class="mx-auto mt-4 w-full max-w-xl divide-y divide-gray-200">
    <thead>
      <tr class="text-left whitespace-nowrap text-gray-900">
        <th class="p-2">
          <button class="flex items-center w-full font-bold" @click="changeSort('index')">
            {{ $t('guess-result-header-index') }}
            <ArrowIcon v-if="sort_key === 'index'" class="w-4 h-4 ml-1.5 text-gray-700"
              :class="{ 'rotate-180': !is_sort_asc }">
            </ArrowIcon>
          </button>
        </th>
        <th class="p-2">
          <button class="flex items-center w-full font-bold" @click="changeSort('name')">
            {{ $t('guess-result-header-name') }}
            <ArrowIcon v-if="sort_key === 'name'" class="w-4 h-4 ml-1.5 text-gray-700"
              :class="{ 'rotate-180': !is_sort_asc }">
            </ArrowIcon>
          </button>
        </th>
        <th class="p-2">
          <button class="flex items-center w-full font-bold" @click="changeSort('similarity')">
            {{ $t('guess-result-header-similarity') }}
            <ArrowIcon v-if="sort_key === 'similarity'" class="w-4 h-4 ml-1.5 text-gray-700"
              :class="{ 'rotate-180': !is_sort_asc }">
            </ArrowIcon>
          </button>
        </th>
        <th class="p-2">
          <button class="flex items-center w-full font-bold" @click="changeSort('rank')">
            {{ $t('guess-result-header-rank') }}
            <ArrowIcon v-if="sort_key === 'rank'" class="w-4 h-4 ml-1.5 text-gray-700"
              :class="{ 'rotate-180': !is_sort_asc }">
            </ArrowIcon>
          </button>
        </th>
      </tr>
    </thead>
    <tbody class="divide-y divide-gray-100">
      <tr v-for="guess_data in sortedGuessDataList">
        <td class="p-2">{{ guess_data.index + 1 }}</td>
        <td class="p-2">{{ translatePokemonName(guess_data.name, false) }}</td>
        <td class="p-2">{{ (guess_data.similarity * 100).toFixed(2) }}</td>
        <td class="p-2">{{ guess_data.rank }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script setup lang="ts">
import { state, translatePokemonName } from '#imports'

const is_sort_asc = ref(true)
const sort_key = ref("rank")

const sortedGuessDataList = computed(() => {
  return [...state.guess_data_list].sort((a, b) => {
    const a_data = sort_key.value === 'name' ? translatePokemonName(a[sort_key.value], false) : a[sort_key.value]
    const b_data = sort_key.value === 'name' ? translatePokemonName(b[sort_key.value], false) : b[sort_key.value]
    const comp = typeof a_data === 'string' ? a_data.localeCompare(b_data) : a_data - b_data;
    return is_sort_asc.value ? comp : -comp;
  })
})

function changeSort(key: string) {
  if (key === sort_key.value) {
    is_sort_asc.value = !is_sort_asc.value
    return
  }
  is_sort_asc.value = true
  sort_key.value = key
}

</script>
