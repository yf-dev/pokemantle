<template>
  <div
    class="mb-4 px-4 pt-4 pb-6 bg-white dark:bg-slate-800 border border-gray-200 dark:border-slate-700 dark:text-slate-300 rounded shadow-sm"
  >
    <p class="text-xl font-bold">
      {{ $t("share-title", { puzzle_number: state.puzzle_number }) }}
    </p>
    <p v-if="!is_hide_answer" class="text-md font-bold mt-2">
      {{
        $t("share-pokemon-name", {
          name: state.translatePokemonName(
            state.statistics.last_correct_guess.name,
            false
          ),
        })
      }}
    </p>

    <div class="grid grid-cols-1 zs:grid-cols-2 xs:grid-cols-3 gap-2">
      <div>
        <p class="text-sm font-medium text-gray-500 dark:text-slate-400 mt-3">
          {{ $t("share-guess-count-title") }}
        </p>
        <p class="mt-1">
          <span class="inline-block text-2xl font-medium leading-none">{{
            $t("share-guess-count-value", {
              value: state.statistics.last_guess_count,
            })
          }}</span>
          <span
            class="inline-block ml-1 text-xs text-gray-500 dark:text-slate-400"
            >{{
              $t("share-guess-count-average", {
                value: (
                  state.statistics.total_guess_count /
                  state.statistics.clear_count
                ).toFixed(2),
              })
            }}</span
          >
        </p>
      </div>
      <div>
        <p class="text-sm font-medium text-gray-500 dark:text-slate-400 mt-3">
          {{ $t("share-best-rank-title") }}
        </p>
        <p class="mt-1">
          <span class="inline-block text-2xl font-medium leading-none">{{
            $t("share-best-rank-value", {
              value: state.statistics.last_best_guess.rank,
            })
          }}</span>
          <span
            class="inline-block ml-1 text-xs text-gray-500 dark:text-slate-400"
            >{{
              $t("share-best-rank-similarity", {
                value: (
                  state.statistics.last_best_guess.similarity * 100
                ).toFixed(2),
              })
            }}</span
          >
        </p>
      </div>

      <div>
        <p class="text-sm font-medium text-gray-500 dark:text-slate-400 mt-3">
          {{ $t("share-streak-title") }}
        </p>
        <p class="mt-1">
          <span class="inline-block text-2xl font-medium leading-none">{{
            $t("share-streak-value", {
              value: state.statistics.streak,
            })
          }}</span>
          <span
            class="inline-block ml-1 text-xs text-gray-500 dark:text-slate-400"
            >{{
              $t("share-streak-best", {
                value: state.statistics.best_streak,
              })
            }}</span
          >
        </p>
      </div>
    </div>
    <div class="zs:flex zs:flex-row-reverse mt-4">
      <button
        class="inline-block w-full zs:w-fit py-2 px-3 text-sm font-medium text-indigo-600 dark:text-indigo-200 border border-indigo-600 dark:border-indigo-200 rounded shadow-sm hover:bg-indigo-600 dark:hover:bg-indigo-800 hover:text-white active:bg-indigo-500 focus:outline-none focus:ring"
        @click="copyToClipboard"
      >
        {{ $t("share-button") }}
      </button>
      <button
        class="inline-block w-full zs:w-fit mt-1 zs:mt-0 mr-0 zs:mr-1 py-2 px-3 text-sm font-medium text-indigo-600 dark:text-indigo-200 border border-indigo-600 dark:border-indigo-200 rounded shadow-sm hover:bg-indigo-600 dark:hover:bg-indigo-800 hover:text-white active:bg-indigo-500 focus:outline-none focus:ring"
        @click="showRankList"
      >
        {{ $t("show-rank-list-button") }}
      </button>
    </div>
    <div class="inline-flex items-center w-full justify-end mt-4">
      <input
        v-model="is_hide_answer"
        class="appearance-none h-4 w-4 mr-2 rounded-sm bg-white checked:bg-indigo-600 cursor-pointer"
        type="checkbox"
        id="shareHideAnswer"
      />
      <label
        class="inline-block text-xs text-gray-500 dark:text-slate-400"
        for="shareHideAnswer"
      >
        {{ $t("share-hide-answer-checkbox-label") }}
      </label>
    </div>
  </div>
</template>

<script setup lang="ts">
const state = useStore()

const is_hide_answer = ref(false)

function copyToClipboard() {
  const url = process.client
    ? window.location.href
    : useRuntimeConfig().public.frontendBase + useRoute().fullPath
  navigator.clipboard
    .writeText(
      fluent.format("share-clipboard-text", {
        puzzle_number: state.puzzle_number,
        guess_count: state.statistics.last_guess_count,
        best_rank: state.statistics.last_best_guess.rank,
        best_similarity: (
          state.statistics.last_best_guess.similarity * 100
        ).toFixed(2),
      }) +
        "\n" +
        url
    )
    .then(() => {
      alert(fluent.format("share-clipboard-text-alert"))
    })
}

function showRankList() {
  useRouter().push(
    `/rank/${state.puzzle_number}/${utf8ToB64(
      state.statistics.last_correct_guess.name
    )}`
  )
}
</script>
