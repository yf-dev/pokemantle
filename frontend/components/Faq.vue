<template>
  <div class="space-y-4">
    <FaqItem :title="$t('faq-what-it-is-title')" open>
      <ClientOnly>
        <i18n path="faq-what-it-is-description">
          <template #semantle_link="{ semantleLinkLabel }">
            <a
              target="_blank"
              href="https://semantle.novalis.org/"
              class="text-blue-600"
              >{{ semantleLinkLabel }}</a
            >
          </template>
        </i18n>
      </ClientOnly>
    </FaqItem>
    <FaqItem :title="$t('faq-generation-title')">
      {{
        $t("faq-generation-description", {
          number: state.api_data.pokemons.length,
        })
      }}
    </FaqItem>
    <FaqItem :title="$t('faq-show-info-title')">
      {{ $t("faq-show-info-description") }}
    </FaqItem>
    <FaqItem :title="$t('faq-similarity-title')">
      {{ $t("faq-similarity-description") }}
    </FaqItem>
    <FaqItem :title="$t('faq-once-per-day-title')">
      {{ $t("faq-once-per-day-description") }}
    </FaqItem>
    <FaqItem :title="$t('faq-yesterday-title')">
      <ClientOnly>
        <i18n
          path="faq-yesterday-description"
          :args="{
            name: state.translatePokemonName(yesterdayName, false) || '',
          }"
        >
          <template #yesterday_rank_link="{ yesterdayRankLinkLabel }">
            <NuxtLink
              :to="`/rank/${state.puzzle_number - 1}/${utf8ToB64(
                yesterdayName
              )}`"
              class="text-blue-600"
              >{{ yesterdayRankLinkLabel }}
            </NuxtLink>
          </template>
        </i18n>
      </ClientOnly>
    </FaqItem>
    <FaqItem :title="$t('faq-sort-title')">
      {{ $t("faq-sort-description") }}
    </FaqItem>
    <FaqItem :title="$t('faq-source-code-title')">
      <ClientOnly>
        <i18n path="faq-source-code-description">
          <template #source_code_link="{ sourceCodeLinkLabel }">
            <a
              target="_blank"
              href="https://github.com/yf-dev/pokemantle"
              class="text-blue-600"
              >{{ sourceCodeLinkLabel }}</a
            >
          </template>
        </i18n>
      </ClientOnly>
    </FaqItem>
    <FaqItem :title="$t('faq-issue-title')">
      <ClientOnly>
        <i18n path="faq-issue-description">
          <template #issue_link="{ issueLinkLabel }">
            <a
              target="_blank"
              href="https://github.com/yf-dev/pokemantle/issues"
              class="text-blue-600"
              >{{ issueLinkLabel }}</a
            >
          </template>
        </i18n>
      </ClientOnly>
    </FaqItem>
  </div>
</template>

<script setup lang="ts">
import { utf8ToB64 } from "#imports"

const yesterdayName = ref("")
const state = useStore()

apiRank(state.puzzle_number - 1).then((data) => {
  yesterdayName.value = data[0].name
})
</script>
