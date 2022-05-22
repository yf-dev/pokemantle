<template>
  <div>
    <MenuBar
      :subtitle="
        $t('pokemantle-rank-subtitle', { puzzle_number: puzzle_number })
      "
    />
    <div
      v-if="error_message"
      class="p-4 text-red-700 border-l-4 border-red-700 bg-red-50"
      role="alert"
    >
      <h3 class="text-sm font-medium">{{ $t(error_message) }}</h3>
    </div>
    <ClientOnly>
      <GuessResult
        :guess_list="rank_data.guess_list"
        v-if="rank_data.guess_list.length > 0"
      />
    </ClientOnly>
  </div>
</template>

<script setup lang="ts">
import { FetchError } from "ohmyfetch"

const error_message = ref("")
const puzzle_number = ref<undefined | number>(undefined)
const english_name = ref<undefined | string>(undefined)
const rank_data = reactive<{
  guess_list: Array<GuessData>
}>({
  guess_list: [],
})

const route = useRoute()
if (
  typeof route.params.puzzle_number === "string" &&
  typeof route.params.base64_english_name === "string"
) {
  puzzle_number.value = parseInt(route.params.puzzle_number, 10)
  english_name.value = b64ToUtf8(route.params.base64_english_name)
  load_data().then()
} else {
  useRouter().push("/")
}

async function load_data() {
  error_message.value = ""
  try {
    const data = await apiRank(puzzle_number.value)
    if (data[0].name !== english_name.value) {
      error_message.value = "error-invalid-request"
      return
    }
    rank_data.guess_list = data.map((guess_result) => {
      return {
        index: null,
        name: guess_result.name,
        rank: guess_result.rank,
        similarity: guess_result.similarity,
      }
    })
  } catch (e) {
    if (e instanceof FetchError) {
      error_message.value = "error-no-rank"
      return
    } else {
      error_message.value = "error-unknown"
      return
    }
  }
}
</script>
