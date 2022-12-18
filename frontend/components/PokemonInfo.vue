<template>
  <div
    class="grid grid-cols-1 zs:grid-cols-2 xs:grid-cols-3 gap-2 text-xs dark:text-slate-300"
  >
    <PokemonInfoBlock>
      <p class="leading-relaxed">
        {{
          $t("pokemon-info-name", {
            name: state.translatePokemonName(pokemon.name, false),
          })
        }}
      </p>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-generation", { generation: pokemon.generation }) }}
      </p>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-species", { species: pokemon.species }) }}
      </p>
    </PokemonInfoBlock>
    <PokemonInfoBlock>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-height", { height: pokemon.height_m }) }}
      </p>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-weight", { weight: pokemon.weight_kg }) }}
      </p>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-growth-rate-label") }}
        <PokemonInfoTag :class="growthRateBgClass(pokemon.growth_rate)">{{
          $t("pokemon-info-growth-rate", {
            growth_rate: pokemon.growth_rate.replaceAll(" ", ""),
          })
        }}</PokemonInfoTag>
      </p>
    </PokemonInfoBlock>
    <PokemonInfoBlock>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-status-label") }}
        <PokemonInfoTag :class="statusBgClass(pokemon.status)">{{
          $t("pokemon-info-status", {
            status: pokemon.status.replaceAll(" ", ""),
          })
        }}</PokemonInfoTag>
      </p>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-type-1-label") }}
        <PokemonInfoTag :class="typeBgClass(pokemon.type_1)">{{
          $t("pokemon-info-type-1", {
            type_1: pokemon.type_1,
          })
        }}</PokemonInfoTag>
      </p>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-type-2-label") }}
        <PokemonInfoTag :class="typeBgClass(pokemon.type_2)">{{
          $t("pokemon-info-type-2", {
            type_2: pokemon.type_2 !== null ? pokemon.type_2 : "NONE",
          })
        }}</PokemonInfoTag>
      </p>
    </PokemonInfoBlock>
    <PokemonInfoBlock>
      <p class="leading-relaxed">
        {{
          $t("pokemon-info-ability-1", {
            ability_1:
              pokemon.ability_1 !== null
                ? $t(
                    `ability-${pokemon.ability_1
                      .toLowerCase()
                      .replaceAll(" ", "-")
                      .replaceAll(/[^a-z-]/g, "")}`
                  )
                : "NONE",
          })
        }}
      </p>
      <p class="leading-relaxed">
        {{
          $t("pokemon-info-ability-2", {
            ability_2:
              pokemon.ability_2 !== null
                ? $t(
                    `ability-${pokemon.ability_2
                      .toLowerCase()
                      .replaceAll(" ", "-")
                      .replaceAll(/[^a-z-]/g, "")}`
                  )
                : "NONE",
          })
        }}
      </p>
      <p class="leading-relaxed">
        {{
          $t("pokemon-info-ability-hidden", {
            ability_hidden:
              pokemon.ability_hidden !== null
                ? $t(
                    `ability-${pokemon.ability_hidden
                      .toLowerCase()
                      .replaceAll(" ", "-")
                      .replaceAll(/[^a-z-]/g, "")}`
                  )
                : "NONE",
          })
        }}
      </p>
    </PokemonInfoBlock>
    <PokemonInfoBlock>
      <p class="leading-relaxed">
        {{
          $t("pokemon-info-hp-speed", { hp: pokemon.hp, speed: pokemon.speed })
        }}
      </p>
      <p class="leading-relaxed">
        {{
          $t("pokemon-info-attack", {
            attack: pokemon.attack,
            sp_attack: pokemon.sp_attack,
          })
        }}
      </p>
      <p class="leading-relaxed">
        {{
          $t("pokemon-info-defense", {
            defense: pokemon.defense,
            sp_defense: pokemon.sp_defense,
          })
        }}
      </p>
    </PokemonInfoBlock>
    <PokemonInfoBlock>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-egg-type-1-label") }}
        <PokemonInfoTag :class="eggTypeBgClass(pokemon.egg_type_1)">{{
          $t("pokemon-info-egg-type-1", {
            egg_type_1:
              pokemon.egg_type_1 !== null
                ? pokemon.egg_type_1.replaceAll(" ", "")
                : "NONE",
          })
        }}</PokemonInfoTag>
      </p>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-egg-type-2-label") }}
        <PokemonInfoTag :class="eggTypeBgClass(pokemon.egg_type_2)">{{
          $t("pokemon-info-egg-type-2", {
            egg_type_2:
              pokemon.egg_type_2 !== null
                ? pokemon.egg_type_2.replaceAll(" ", "")
                : "NONE",
          })
        }}</PokemonInfoTag>
      </p>
      <p class="leading-relaxed">
        {{ $t("pokemon-info-etc-label") }}
        <PokemonInfoTag
          v-if="pokemon.is_paldean"
          class="bg-amber-200 dark:bg-amber-900"
          >{{ $t("pokemon-info-etc-is-paldean") }}</PokemonInfoTag
        >
        <PokemonInfoTag
          v-if="pokemon.is_hisuian"
          class="bg-teal-200 dark:bg-teal-900"
          >{{ $t("pokemon-info-etc-is-hisuian") }}</PokemonInfoTag
        >
        <PokemonInfoTag
          v-if="pokemon.is_galarian"
          class="bg-purple-200 dark:bg-purple-900"
          >{{ $t("pokemon-info-etc-is-galarian") }}</PokemonInfoTag
        >
        <PokemonInfoTag
          v-if="pokemon.is_alolan"
          class="bg-orange-200 dark:bg-orange-900"
          >{{ $t("pokemon-info-etc-is-alolan") }}
        </PokemonInfoTag>
        <PokemonInfoTag
          v-if="pokemon.is_mega"
          class="bg-lime-200 dark:bg-lime-900"
          >{{ $t("pokemon-info-etc-is-mega") }}
        </PokemonInfoTag>
        <PokemonInfoTag
          v-if="pokemon.is_gigantamax"
          class="bg-violet-300 dark:bg-violet-900"
          >{{ $t("pokemon-info-etc-is-gigantamax") }}
        </PokemonInfoTag>
        <PokemonInfoTag
          v-if="pokemon.is_partner"
          class="bg-indigo-200 dark:bg-indigo-900"
          >{{ $t("pokemon-info-etc-is-partner") }}
        </PokemonInfoTag>
        <PokemonInfoTag
          v-if="pokemon.has_form_difference"
          class="bg-rose-200 dark:bg-rose-900"
          >{{ $t("pokemon-info-etc-has-form-difference") }}</PokemonInfoTag
        >
        <PokemonInfoTag
          v-if="pokemon.is_forme_change"
          class="bg-zinc-200 dark:bg-zinc-700"
          >{{ $t("pokemon-info-etc-is-forme-change") }}</PokemonInfoTag
        >
      </p>
    </PokemonInfoBlock>
  </div>
</template>

<script setup lang="ts">
const state = useStore()
const props = defineProps<{
  pokemon: Pokemon
}>()

function growthRateBgClass(growth_rate?: string): string {
  const class_name = {
    Slow: "bg-amber-300 dark:bg-amber-800",
    "Medium Slow": "bg-amber-200 dark:bg-amber-900",
    "Medium Fast": "bg-teal-200 dark:bg-teal-900",
    Fast: "bg-teal-300 dark:bg-teal-800",
    Fluctuating: "bg-cyan-200 dark:bg-cyan-900",
    Erratic: "bg-lime-200 dark:bg-lime-900",
  }[growth_rate]
  return class_name === undefined ? "bg-none" : class_name
}

function statusBgClass(status?: string): string {
  const class_name = {
    Normal: "bg-sky-200 dark:bg-sky-900",
    "Sub Legendary": "bg-lime-200 dark:bg-lime-900",
    Legendary: "bg-rose-200 dark:bg-rose-900",
    Mythical: "bg-violet-200 dark:bg-violet-900",
  }[status]
  return class_name === undefined ? "bg-none" : class_name
}

function typeBgClass(type?: string): string {
  const class_name = {
    Bug: "bg-lime-200 dark:bg-lime-900",
    Dark: "bg-gray-400 dark:bg-gray-700",
    Dragon: "bg-indigo-200 dark:bg-indigo-900",
    Electric: "bg-yellow-200 dark:bg-yellow-900",
    Fairy: "bg-pink-200 dark:bg-pink-900",
    Fighting: "bg-orange-200 dark:bg-orange-900",
    Fire: "bg-red-200 dark:bg-red-900",
    Flying: "bg-fuchsia-200 dark:bg-fuchsia-900",
    Ghost: "bg-purple-200  dark:bg-purple-900",
    Grass: "bg-green-200 dark:bg-green-900",
    Ground: "bg-amber-200 dark:bg-amber-900",
    Ice: "bg-sky-200 dark:bg-sky-900",
    Normal: "bg-gray-200 dark:bg-gray-700",
    Poison: "bg-violet-200 dark:bg-violet-900",
    Psychic: "bg-pink-200 dark:bg-pink-900",
    Rock: "bg-stone-400 dark:bg-stone-700",
    Steel: "bg-zinc-200 dark:bg-zinc-700",
    Water: "bg-blue-200 dark:bg-blue-900",
  }[type]
  return class_name === undefined ? "bg-none" : class_name
}

function eggTypeBgClass(egg_type?: string): string {
  const class_name = {
    Amorphous: "bg-gray-200 dark:bg-gray-700",
    Bug: "bg-lime-200 dark:bg-lime-900",
    Ditto: "bg-purple-200  dark:bg-purple-900",
    Dragon: "bg-indigo-200 dark:bg-indigo-900",
    Fairy: "bg-pink-200 dark:bg-pink-900",
    Field: "bg-yellow-200 dark:bg-yellow-900",
    Flying: "bg-fuchsia-200 dark:bg-fuchsia-900",
    Grass: "bg-green-200 dark:bg-green-900",
    "Human-Like": "bg-orange-200 dark:bg-orange-900",
    Mineral: "bg-amber-200 dark:bg-amber-900",
    Monster: "bg-rose-200 dark:bg-rose-900",
    Undiscovered: "bg-stone-200 dark:bg-stone-700",
    "Water 1": "bg-sky-200 dark:bg-sky-900",
    "Water 2": "bg-sky-300 dark:bg-sky-800",
    "Water 3": "bg-sky-400 dark:bg-sky-700",
  }[egg_type]
  return class_name === undefined ? "bg-none" : class_name
}
</script>
