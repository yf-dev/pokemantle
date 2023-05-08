<template>
  <div class="space-y-4">
    <div
      v-if="error_message"
      class="p-4 text-red-700 dark:text-red-300 border-l-4 border-red-700 bg-red-50 dark:bg-stone-800"
      role="alert"
    >
      <h3 class="text-sm font-medium">{{ $t(error_message) }}</h3>
    </div>
    <div class="flex items-center justify-center w-full">
      <div class="flex-shrink w-full relative">
        <input
          v-t:guess-input-input
          type="text"
          class="w-full p-2 box-border border-2 dark:text-slate-300 dark:bg-slate-700 border-gray-200 dark:border-slate-600 rounded focus:outline-none focus:border-indigo-400 dark:focus:border-indigo-600 focus:ring-0"
          :value="name"
          ref="nameInput"
          @input="debouncedNameInput"
          @keydown.enter="guess"
          @keydown.down.prevent="focusNextAutocompleteButton"
          @focus="focusedAutocompleteItemIndex = null"
          @focusout="unfocusInput"
        />
        <ul
          v-if="!isCloseAutocomplete && fuzzyPokemonNameMap.length > 0"
          class="absolute z-10 mt-1 w-full bg-white dark:bg-slate-600 shadow-lg max-h-56 rounded ring-1 ring-black ring-opacity-5 overflow-auto focus:outline-none text-sm"
        >
          <li
            v-for="(name_item, index) in fuzzyPokemonNameMap"
            :key="name_item.english_name"
            class="text-gray-900 dark:text-slate-200 relative"
          >
            <div
              class="w-full h-full p-2 text-left cursor-pointer focus:outline-none focus:ring-0 focus:bg-indigo-100 dark:focus:bg-indigo-900"
              ref="autocompleteButtons"
              :data-index="index"
              tabindex="0"
              @focus="focusedAutocompleteItemIndex = index"
              @keydown.down.prevent="focusNextAutocompleteButton"
              @keydown.up.prevent="focusPrevAutocompleteButton"
              @keydown.enter.prevent="autocompleteItemClicked(name_item)"
              @keydown.escape.prevent="nameInput?.focus()"
              @focusout="unfocusInput"
              @click="autocompleteItemClicked(name_item)"
            >
              <span class="block ml-1 truncate">{{
                name_item.local_name
              }}</span>
            </div>
          </li>
        </ul>
      </div>
      <button
        v-t:guess-input-button
        class="inline-flex flex-shrink-0 ml-1 py-2 px-3 font-medium text-white dark:text-slate-200 bg-indigo-600 dark:bg-indigo-700 border border-indigo-600 dark:border-indigo-800 rounded shadow-sm active:text-indigo-500 hover:bg-transparent dark:hover:bg-indigo-600 hover:text-indigo-600 focus:outline-none focus:ring"
        @click="guess"
      ></button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { FetchError } from "ohmyfetch"
import _ from "lodash"

const state = useStore()

const name = ref("")
const error_message = ref("")
const nameInput = ref<HTMLInputElement | null>(null)
const isCloseAutocomplete = ref(false)
const focusedAutocompleteItemIndex = ref<number | null>(null)
const autocompleteButtons = ref<HTMLButtonElement[]>([])

async function guess() {
  nameInput.value?.focus()
  const trimmed_name = name.value.trim()
  if (trimmed_name === "") {
    name.value = ""
    return
  }
  error_message.value = ""
  try {
    const eng_name = state.translatePokemonName(trimmed_name, true)
    if (eng_name === undefined) {
      error_message.value = "error-no-such-pokemon"
      name.value = ""
      return
    }
    const data = await apiGuess(state.puzzle_number, eng_name)
    state.last_guess_data = state.addGuessResult(data)
    name.value = ""
    updateStatistics()
  } catch (e) {
    if (e instanceof FetchError) {
      error_message.value = "error-no-such-pokemon"
      name.value = ""
      return
    } else {
      error_message.value = "error-unknown"
      name.value = ""
      return
    }
  }
}

const fuzzyPokemonNameMap = computed(() => {
  const text = name.value.trim().normalize("NFD")
  if (text.length < 1) {
    return []
  }
  const searcher = nameSearcher(text)
  const result: LocalName[] = _.keys(state.api_data.pokemon_local_name_map)
    .filter((local_name) => {
      return searcher.test(local_name.normalize("NFD"))
    })
    .map((local_name) => {
      const english_name = state.translatePokemonName(local_name, true)
      return {
        english_name: english_name,
        local_name: state.translatePokemonName(english_name, false), // to use proper-cased name
      }
    })
  return result
})

function nameSearcher(text: string) {
  const pattern = text.toLowerCase().split("").map(escapeRegExp).join("")
  return new RegExp(pattern)
}

function escapeRegExp(text: string) {
  return text.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
}

const debouncedNameInput = _.debounce((event) => {
  name.value = (event.target as HTMLTextAreaElement).value
  isCloseAutocomplete.value = false
})

function autocompleteItemClicked(name_item: LocalName) {
  name.value = name_item.local_name
  isCloseAutocomplete.value = true
  nameInput.value?.focus()
}

function updateStatistics() {
  if (
    state.last_guess_data?.rank === 0 &&
    state.statistics.last_puzzle_number !== state.puzzle_number
  ) {
    state.statistics.clear_count += 1
    state.statistics.last_guess_count = state.guess_data_list.length
    state.statistics.total_guess_count += state.statistics.last_guess_count
    const sortedGuesses = state.guess_data_list.sort((a, b) => a.rank - b.rank)
    const correct_guess = sortedGuesses[0]
    const best_guess =
      sortedGuesses.length > 1
        ? sortedGuesses.sort((a, b) => a.rank - b.rank)[1]
        : correct_guess
    state.statistics.last_best_guess = Object.assign({}, best_guess)
    state.statistics.last_correct_guess = Object.assign({}, correct_guess)
    if (state.statistics.last_puzzle_number === state.puzzle_number - 1) {
      state.statistics.streak += 1
    } else {
      state.statistics.streak = 1
    }
    if (state.statistics.streak > state.statistics.best_streak) {
      state.statistics.best_streak = state.statistics.streak
    }
    state.statistics.last_puzzle_number = state.puzzle_number
    saveStatistics(state.statistics)
  }
}

function getAutocompleteButton(index: number): HTMLButtonElement | undefined {
  return autocompleteButtons.value.find(
    (v) => parseInt(v.dataset.index, 10) === index
  )
}

function focusNextAutocompleteButton() {
  if (focusedAutocompleteItemIndex.value === null) {
    getAutocompleteButton(0)?.focus()
  } else {
    getAutocompleteButton(focusedAutocompleteItemIndex.value + 1)?.focus()
  }
}

function focusPrevAutocompleteButton() {
  if (focusedAutocompleteItemIndex.value === 0) {
    nameInput.value?.focus()
  } else {
    getAutocompleteButton(focusedAutocompleteItemIndex.value - 1)?.focus()
  }
}

function unfocusInput(event) {
  if (event.relatedTarget === nameInput.value) {
    return
  }
  if (
    autocompleteButtons.value.find((v) => v === event.relatedTarget) !==
    undefined
  ) {
    return
  }
  isCloseAutocomplete.value = true
  focusedAutocompleteItemIndex.value = null
}
</script>
