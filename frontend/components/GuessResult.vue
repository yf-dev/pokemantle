<template>
  <table
    class="mt-4 w-full max-w-xl divide-y divide-gray-200 dark:divide-slate-600"
  >
    <thead>
      <tr class="text-left whitespace-nowrap text-gray-900 dark:text-slate-200">
        <th class="p-2" v-if="is_show_index">
          <button
            class="flex items-center w-full font-bold"
            @click="changeSort('index')"
          >
            {{ $t("guess-result-header-index") }}
            <ArrowIcon
              v-if="sort_key === 'index'"
              class="w-4 h-4 ml-1.5 text-gray-700"
              :class="{ 'rotate-180': !is_sort_asc }"
            >
            </ArrowIcon>
          </button>
        </th>
        <th class="p-2">
          <button
            class="flex items-center w-full font-bold"
            @click="changeSort('name')"
          >
            {{ $t("guess-result-header-name") }}
            <ArrowIcon
              v-if="sort_key === 'name'"
              class="w-4 h-4 ml-1.5 text-gray-700"
              :class="{ 'rotate-180': !is_sort_asc }"
            >
            </ArrowIcon>
          </button>
        </th>
        <th class="p-2">
          <button
            class="flex items-center w-full font-bold"
            @click="changeSort('similarity')"
          >
            {{ $t("guess-result-header-similarity") }}
            <ArrowIcon
              v-if="sort_key === 'similarity'"
              class="w-4 h-4 ml-1.5 text-gray-700"
              :class="{ 'rotate-180': !is_sort_asc }"
            >
            </ArrowIcon>
          </button>
        </th>
        <th class="p-2">
          <button
            class="flex items-center w-full font-bold"
            @click="changeSort('rank')"
          >
            {{ $t("guess-result-header-rank") }}
            <ArrowIcon
              v-if="sort_key === 'rank'"
              class="w-4 h-4 ml-1.5 text-gray-700"
              :class="{ 'rotate-180': !is_sort_asc }"
            >
            </ArrowIcon>
          </button>
        </th>
      </tr>
    </thead>
    <tbody class="divide-y dark:divide-slate-700">
      <ClientOnly fallbackTag="tr">
        <GuessResultRow
          v-if="
            is_show_fixed_last &&
            is_fixed_last &&
            state.last_guess_data !== undefined
          "
          class="dark:text-slate-300 bg-gray-50 dark:bg-slate-800 border-gray-300 dark:border-slate-700 border-y"
          :guess_data="state.last_guess_data"
          :is_show_index="is_show_index"
        >
        </GuessResultRow>
        <GuessResultRow
          v-for="guess_data in sortedGuessDataList"
          :guess_data="guess_data"
          :is_show_index="is_show_index"
          :key="guess_data.name"
          class="dark:text-slate-300"
        ></GuessResultRow>
      </ClientOnly>
    </tbody>
  </table>
</template>

<script setup lang="ts">
const state = useStore()

const props = defineProps<{
  guess_list: Array<GuessData>
  is_show_index?: boolean
  is_show_fixed_last?: boolean
}>()

const is_sort_asc = ref(true)
const sort_key = ref("rank")
const is_fixed_last = ref(true)

const filteredGuessDataList = computed(() => {
  if (is_fixed_last.value && state.last_guess_data !== undefined) {
    return props.guess_list.filter(
      (v) => v.index !== state.last_guess_data.index
    )
  }
  return [...props.guess_list]
})

const sortedGuessDataList = computed(() => {
  return filteredGuessDataList.value.sort((a, b) => {
    const a_data =
      sort_key.value === "name"
        ? state.translatePokemonName(a[sort_key.value], false)
        : a[sort_key.value]
    const b_data =
      sort_key.value === "name"
        ? state.translatePokemonName(b[sort_key.value], false)
        : b[sort_key.value]
    const comp =
      typeof a_data === "string"
        ? a_data.localeCompare(b_data)
        : a_data - b_data
    return is_sort_asc.value ? comp : -comp
  })
})

function changeSort(key: string) {
  is_fixed_last.value = false
  if (key === sort_key.value) {
    is_sort_asc.value = !is_sort_asc.value
    return
  }
  is_sort_asc.value = true
  sort_key.value = key
}

watch(
  () => state.last_guess_data,
  () => {
    is_fixed_last.value = true
  }
)
</script>
