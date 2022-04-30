<template>
  <div class="mb-4 px-4 pt-4 pb-6 bg-white border border-gray-200 rounded shadow-sm">
    <p class="text-xl font-bold">{{ $t('share-title', { puzzle_number: state.puzzle_number }) }}</p>

    <div class="grid grid-cols-1 zs:grid-cols-2 xs:grid-cols-3 gap-2">
      <div>
        <p class="text-sm font-medium text-gray-500 mt-3">{{ $t('share-guess-count-title') }}</p>
        <p class="mt-1">
          <span class="inline-block text-2xl font-medium leading-none">{{ $t('share-guess-count-value', {
              value:
                statistics.last_guess_count
            })
          }}</span>
          <span class="inline-block ml-1 text-xs text-gray-500">{{ $t('share-guess-count-average', {
              value:
                (statistics.total_guess_count / statistics.clear_count).toFixed(2)
            })
          }}</span>
        </p>
      </div>
      <div>
        <p class="text-sm font-medium text-gray-500 mt-3">{{ $t('share-best-rank-title') }}</p>
        <p class="mt-1">
          <span class="inline-block text-2xl font-medium leading-none">{{ $t('share-best-rank-value', {
              value:
                statistics.last_best_guess.rank
            })
          }}</span>
          <span class="inline-block ml-1 text-xs text-gray-500">{{ $t('share-best-rank-similarity', {
              value:
                (statistics.last_best_guess.similarity * 100).toFixed(2)
            })
          }}</span>
        </p>
      </div>

      <div>
        <p class="text-sm font-medium text-gray-500 mt-3">{{ $t('share-streak-title') }}</p>
        <p class="mt-1">
          <span class="inline-block text-2xl font-medium leading-none">{{ $t('share-streak-value', {
              value:
                statistics.streak
            })
          }}</span>
          <span class="inline-block ml-1 text-xs text-gray-500">{{ $t('share-streak-best', {
              value:
                statistics.best_streak
            })
          }}</span>
        </p>
      </div>
    </div>
    <div class="zs:flex zs:flex-row-reverse mt-4">
      <button
        class="inline-block w-full zs:w-fit py-2 px-3 text-sm font-medium text-indigo-600 border border-indigo-600 rounded shadow-sm hover:bg-indigo-600 hover:text-white active:bg-indigo-500 focus:outline-none focus:ring"
        @click="copyToClipboard">
        {{ $t('share-button') }}
      </button>
      <button
        class="inline-block w-full zs:w-fit mt-1 zs:mt-0 mr-0 zs:mr-1 py-2 px-3 text-sm font-medium text-indigo-600 border border-indigo-600 rounded shadow-sm hover:bg-indigo-600 hover:text-white active:bg-indigo-500 focus:outline-none focus:ring"
        @click="showRankList">
        {{ $t('show-rank-list-button') }}
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { state, statistics } from '#imports'

function copyToClipboard() {
  const url = typeof window !== "undefined" ? window.location.href : useRuntimeConfig().public.frontendBase + useRoute().fullPath
  navigator.clipboard.writeText(fluent.format('share-clipboard-text', {
    puzzle_number: state.puzzle_number,
    guess_count: statistics.last_guess_count,
    best_rank: statistics.last_best_guess.rank,
    best_similarity: statistics.last_best_guess.similarity,
  }) + '\n' + url).then(() => {
    alert(fluent.format('share-clipboard-text-alert'))
  })
}

function showRankList() {
  if (typeof statistics.last_correct_guess === "undefined") {
    // this is old format. try to convert
    // TODO: remove this
    statistics.last_correct_guess = Object.assign({}, state.guess_data_list.find((v) => v.rank === 0))
  }
  useRouter().push(`/rank/${state.puzzle_number}/${utf8ToB64(statistics.last_correct_guess.name)}`)
}
</script>