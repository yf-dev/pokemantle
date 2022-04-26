<template>
  <div class="space-y-4">
    <div v-if="error_message" class="p-4 text-red-700 border-l-4 border-red-700 bg-red-50" role="alert">
      <h3 class="text-sm font-medium">{{ $t(error_message) }}</h3>
    </div>
    <div class="flex items-center justify-center w-full">
      <div class="flex-shrink w-full relative">
        <input v-t:guess-input-input type="text" class="w-full p-2 border-2 border-gray-200 rounded" :value="name"
          ref="nameInput" @input="debouncedNameInput" @keydown.enter="guess" />
        <ul v-if="!isCloseAutocomplete && fuzzyPokemonNameMap.length > 0"
          class="absolute z-10 mt-1 w-full bg-white shadow-lg max-h-56 rounded py-1 ring-1 ring-black ring-opacity-5 overflow-auto focus:outline-none text-sm">
          <li v-for="(name_item, name_item_index) in fuzzyPokemonNameMap" :key="name_item.english_name"
            class="text-gray-900 relative">
            <button class="w-full h-full p-2 text-left" @click="autocompleteItemClicked(name_item)">
              <span class="block ml-1 truncate">{{ name_item.local_name }}</span>
            </button>
          </li>
        </ul>
      </div>
      <button v-t:guess-input-button
        class="inline-flex flex-shrink-0 ml-1 py-2 px-3 font-medium text-white bg-indigo-600 border border-indigo-600 rounded active:text-indigo-500 hover:bg-transparent hover:text-indigo-600 focus:outline-none focus:ring"
        @click="guess"></button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { FetchError } from "ohmyfetch"
import _ from "lodash"

const name = ref("")
const error_message = ref("")
const nameInput = ref<HTMLInputElement | null>(null)
const isCloseAutocomplete = ref(false)


async function guess() {
  nameInput.value?.focus()
  const trimmed_name = name.value.trim()
  if (trimmed_name === "") {
    name.value = ""
    return
  }
  error_message.value = ""
  try {
    const eng_name = translatePokemonName(trimmed_name, true)
    if (eng_name === undefined) {
      error_message.value = "error-no-such-pokemon"
      name.value = ""
      return
    }
    const data = await apiGuess(state.puzzle_number, eng_name)
    state.last_guess_data = addGuessResult(data)
    name.value = ""
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
  const text = name.value.trim().normalize('NFD')
  if (text.length < 1) {
    return []
  }
  const searcher = nameSearcher(text)
  const result = api_data.pokemon_name_map.filter((v) => {
    return searcher.test(v.local_name.normalize('NFD'));
  })
  return result
})

function nameSearcher(text) {
  const pattern = text.split('').map(escapeRegExp).join('');
  return new RegExp(pattern);
}

function escapeRegExp(text) {
  return text.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
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
</script>
