<template>
  <div>
    <MenuBar
      :subtitle="
        $t('pokemantle-index-subtitle', { puzzle_number: state.puzzle_number })
      "
    />
    <ClientOnly>
      <Share v-if="isFinished" />
    </ClientOnly>
    <GuessInput />
    <ClientOnly>
      <GuessResult
        :guess_list="state.guess_data_list"
        :is_show_index="true"
        :is_show_fixed_last="true"
        v-if="state.guess_data_list.length > 0"
      />
    </ClientOnly>
    <Faq class="mt-24" />
  </div>
</template>

<script setup lang="ts">
const state = useStore()
const isFinished = computed(
  () => state.guess_data_list.find((v) => v.rank === 0) !== undefined
)
</script>
