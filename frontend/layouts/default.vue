<template>
  <div class="container max-w-xl mx-auto px-2 mb-10">
    <slot />
  </div>
  <div class="px-2 pb-10 text-xs text-gray-700 dark:text-slate-400 text-center">
    Pokémon © 2002-{{ new Date().getFullYear() }} Pokémon. © 1995-{{
      new Date().getFullYear()
    }}
    Nintendo/Creatures Inc./GAME FREAK inc. TM, ® and Pokémon character names
    are trademarks of Nintendo.<br />
    No copyright or trademark infringement is intended in using Pokémon content
    on Pokémantle.
  </div>
</template>
