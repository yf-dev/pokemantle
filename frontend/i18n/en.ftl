pokemantle = Pokémantle
pokemantle-index-subtitle = #{$puzzle_number}
pokemantle-rank-subtitle = Rank of #{$puzzle_number}

og-description = Guess today's Pokémon! Type a Pokémon name, it tells you how close you are.

language-locale-en = English
language-locale-ko = 한국어

guess-input-input = 
  .placeholder = Pokémon Name
guess-input-button = Guess

error-no-such-pokemon = No such Pokémon.
error-no-rank = No such Rank.
error-invalid-request = This request is not valid.
error-unknown = Unknown error.

guess-result-header-index = #
guess-result-header-name = Name
guess-result-header-similarity = Similarity
guess-result-header-rank = Rank

correct-guess = Found!

share-title = {pokemantle} #{$puzzle_number} Solved!
share-pokemon-name = Answer: {$name}

share-guess-count-title = Guesses
share-guess-count-value = {$value}
share-guess-count-average = Avg. {$value}

share-best-rank-title = Nearest Rank
share-best-rank-value = {$value}
share-best-rank-similarity = Similarity {$value}

share-streak-title = Win Streak
share-streak-value = {$value}
share-streak-best = Best {$value}

share-button = Share
share-hide-answer-checkbox-label = Hide answer
share-clipboard-text = {pokemantle} #{$puzzle_number} Solved!
  I found Pokémon on { NUMBER($guess_count, type: "ordinal") ->
    [one] the {$guess_count}st guess
    [two] the {$guess_count}nd guess
    [few] the {$guess_count}rd guess
    *[other] the {$guess_count}th guess
  }.
  My nearest guess had a similarity of {$best_similarity} and ranked { NUMBER($guess_count, type: "ordinal") ->
    [one] {$guess_count}st place
    [two] {$guess_count}nd place
    [few] {$guess_count}rd place
    *[other] {$guess_count}th place
  }.
share-clipboard-text-alert = The result has been copied to clipboard.

show-rank-list-button = Show all ranks

faq-what-it-is-title = What is {pokemantle}?
faq-what-it-is-description = {pokemantle} is the game to guess today's Pokémon inspired by {$semantle_link}.
  If you guess today's Pokémon, {pokemantle} tells you how similar it is to the answer.
  .semantle-link-label = Semantle

faq-generation-title = What kinds of Pokémon are included?
faq-generation-description = It includes all Pokémon, even appeared in Pokémon Legends: Arceus, and form differences with different characteristics are treated as a separate Pokémon. In total, there are {$number} Pokémon.

faq-show-info-title = Can I see the details of Pokémon?
faq-show-info-description = Yes, click on the Pokémon you guessed in the list to see the details.

faq-similarity-title = How does it calculate the similarity?
faq-similarity-description = Similarity is calculated based on the characteristics of Pokémon(generation, category, type, ability, stat, height, weight, experience group, regional form, mega evolution, partner, form difference, mythical/legendary, egg group).
  More precisely, it converts the characteristic to feature vectors and calculate the cosine similarity.

faq-once-per-day-title = Can I play more than once a day?
faq-once-per-day-description = Unfortunately, you can only play once a day.
  We think the key to a game, like Wordle, is that you play "only once a day, everyone gets the same answer."

faq-yesterday-title = What was the answer yesterday?
faq-yesterday-description = {$name}. A full list of rankings is available at {$yesterday_rank_link}.
  .yesterday-rank-link-label = here

faq-sort-title = Can I sort my guesses in a different order?
faq-sort-description = Yes. You can change the order by clicking on the top header of the guess list.

faq-source-code-title = Can I check the source code?
faq-source-code-description = You can check it at the {$source_code_link}.
  .source-code-link-label = {pokemantle} Github

faq-issue-title = How can I ask other questions or send feedback?
faq-issue-description = Please contact us on {$issue_link}.
  .issue-link-label = {pokemantle} Github issue page

go-back-to-main = Go back to main page

pokemon-info-name = Name: {$name}
pokemon-info-generation = Generation: {NUMBER($generation, type: "ordinal") ->
    [one] {$generation}st
    [two] {$generation}nd
    [few] {$generation}rd
    *[other] {$generation}th
  }
pokemon-info-species = Species: {$species}
pokemon-info-height = Height: {$height}m
pokemon-info-weight = Weight: {$weight}kg
pokemon-info-growth-rate-label = Growth rate:
pokemon-info-growth-rate = {$growth_rate ->
  [NONE] None
  [Slow] Slow
  [MediumSlow] Medium Slow
  [MediumFast] Medium Fast 
  [Fast] Fast
  [Fluctuating] Fluctuating
  [Erratic] Erratic
  *[other] {$growth_rate}
}
pokemon-info-status-label = Status:
pokemon-info-status = {$status ->
  [NONE] None
  [Normal] Normal
  [SubLegendary] Sub Legendary
  [Legendary] Legendary
  [Mythical] Mythical
  *[other] {$status}
}
pokemon-info-type-1-label = Type 1:
pokemon-info-type-1 = {$type_1 ->
  [NONE] None
  [Bug] Bug
  [Dark] Dark
  [Dragon] Dragon
  [Electric] Electric
  [Fairy] Fairy
  [Fighting] Fighting
  [Fire] Fire
  [Flying] Flying
  [Ghost] Ghost
  [Grass] Grass
  [Ground] Ground
  [Ice] Ice
  [Normal] Normal
  [Poison] Poison
  [Psychic] Psychic
  [Rock] Rock
  [Steel] Steel
  [Water] Water
  *[other] {$type_1}
}
pokemon-info-type-2-label = Type 2:
pokemon-info-type-2 = {$type_2 ->
  [NONE] None
  [Bug] Bug
  [Dark] Dark
  [Dragon] Dragon
  [Electric] Electric
  [Fairy] Fairy
  [Fighting] Fighting
  [Fire] Fire
  [Flying] Flying
  [Ghost] Ghost
  [Grass] Grass
  [Ground] Ground
  [Ice] Ice
  [Normal] Normal
  [Poison] Poison
  [Psychic] Psychic
  [Rock] Rock
  [Steel] Steel
  [Water] Water
  *[other] {$type_2}
}
pokemon-info-ability-1 = Ability 1: {$ability_1 ->
  [NONE] None
  *[other] {$ability_1}
}
pokemon-info-ability-2 = Ability 2: {$ability_2 ->
  [NONE] None
  *[other] {$ability_2}
}
pokemon-info-ability-hidden = Hidden Ability: {$ability_hidden ->
  [NONE] None
  *[other] {$ability_hidden}
}
pokemon-info-hp-speed = HP / SPD: {$hp} / {$speed}
pokemon-info-attack = ATK / SP. ATK: {$attack} / {$sp_attack}
pokemon-info-defense = DEF / SP. DEF: {$defense} / {$sp_defense}
pokemon-info-egg-type-1-label = Egg Type 1:
pokemon-info-egg-type-1 = {$egg_type_1 ->
  [NONE] None
  [Amorphous] Amorphous
  [Bug] Bug
  [Ditto] Ditto
  [Dragon] Dragon
  [Fairy] Fairy
  [Field] Field
  [Flying] Flying
  [Grass] Grass
  [Human-Like] Human-Like
  [Mineral] Mineral
  [Monster] Monster
  [Undiscovered] Undiscovered
  [Water1] Water 1
  [Water2] Water 2
  [Water3] Water 3
  *[other] {$egg_type_1}
}
pokemon-info-egg-type-2-label = Egg Type 2:
pokemon-info-egg-type-2 = {$egg_type_2 ->
  [NONE] None
  [Amorphous] Amorphous
  [Bug] Bug
  [Ditto] Ditto
  [Dragon] Dragon
  [Fairy] Fairy
  [Field] Field
  [Flying] Flying
  [Grass] Grass
  [Human-Like] Human-Like
  [Mineral] Mineral
  [Monster] Monster
  [Undiscovered] Undiscovered
  [Water1] Water 1
  [Water2] Water 2
  [Water3] Water 3
  *[other] {$egg_type_2}
}
pokemon-info-etc-label = Etc:
pokemon-info-etc-is-hisuian = Hisuian
pokemon-info-etc-is-galarian = Galarian
pokemon-info-etc-is-alolan = Alolan
pokemon-info-etc-is-mega = Mega
pokemon-info-etc-is-partner = Partner
pokemon-info-etc-has-form-difference = Has Form Difference
pokemon-info-etc-is-forme-change = Forme Change

ability-adaptability = Adaptability
ability-aerilate = Aerilate
ability-aftermath = Aftermath
ability-air-lock = Air Lock
ability-analytic = Analytic
ability-anger-point = Anger Point
ability-anticipation = Anticipation
ability-arena-trap = Arena Trap
ability-aroma-veil = Aroma Veil
ability-as-one = As One
ability-aura-break = Aura Break
ability-bad-dreams = Bad Dreams
ability-ball-fetch = Ball Fetch
ability-battery = Battery
ability-battle-armor = Battle Armor
ability-battle-bond = Battle Bond
ability-beast-boost = Beast Boost
ability-berserk = Berserk
ability-big-pecks = Big Pecks
ability-blaze = Blaze
ability-bulletproof = Bulletproof
ability-cheek-pouch = Cheek Pouch
ability-chilling-neigh = Chilling Neigh
ability-chlorophyll = Chlorophyll
ability-clear-body = Clear Body
ability-cloud-nine = Cloud Nine
ability-color-change = Color Change
ability-comatose = Comatose
ability-competitive = Competitive
ability-compound-eyes = Compound Eyes
ability-contrary = Contrary
ability-corrosion = Corrosion
ability-cotton-down = Cotton Down
ability-curious-medicine = Curious Medicine
ability-cursed-body = Cursed Body
ability-cute-charm = Cute Charm
ability-damp = Damp
ability-dancer = Dancer
ability-dark-aura = Dark Aura
ability-dauntless-shield = Dauntless Shield
ability-dazzling = Dazzling
ability-defeatist = Defeatist
ability-defiant = Defiant
ability-delta-stream = Delta Stream
ability-desolate-land = Desolate Land
ability-disguise = Disguise
ability-download = Download
ability-dragons-maw = Dragon's Maw
ability-drizzle = Drizzle
ability-drought = Drought
ability-dry-skin = Dry Skin
ability-early-bird = Early Bird
ability-effect-spore = Effect Spore
ability-electric-surge = Electric Surge
ability-emergency-exit = Emergency Exit
ability-fairy-aura = Fairy Aura
ability-filter = Filter
ability-flame-body = Flame Body
ability-flare-boost = Flare Boost
ability-flash-fire = Flash Fire
ability-flower-gift = Flower Gift
ability-flower-veil = Flower Veil
ability-fluffy = Fluffy
ability-forecast = Forecast
ability-forewarn = Forewarn
ability-friend-guard = Friend Guard
ability-frisk = Frisk
ability-full-metal-body = Full Metal Body
ability-fur-coat = Fur Coat
ability-gale-wings = Gale Wings
ability-galvanize = Galvanize
ability-gluttony = Gluttony
ability-gooey = Gooey
ability-gorilla-tactics = Gorilla Tactics
ability-grass-pelt = Grass Pelt
ability-grassy-surge = Grassy Surge
ability-grim-neigh = Grim Neigh
ability-gulp-missile = Gulp Missile
ability-guts = Guts
ability-harvest = Harvest
ability-healer = Healer
ability-heatproof = Heatproof
ability-heavy-metal = Heavy Metal
ability-honey-gather = Honey Gather
ability-huge-power = Huge Power
ability-hunger-switch = Hunger Switch
ability-hustle = Hustle
ability-hydration = Hydration
ability-hyper-cutter = Hyper Cutter
ability-ice-body = Ice Body
ability-ice-face = Ice Face
ability-ice-scales = Ice Scales
ability-illuminate = Illuminate
ability-illusion = Illusion
ability-immunity = Immunity
ability-imposter = Imposter
ability-infiltrator = Infiltrator
ability-innards-out = Innards Out
ability-inner-focus = Inner Focus
ability-insomnia = Insomnia
ability-intimidate = Intimidate
ability-intrepid-sword = Intrepid Sword
ability-iron-barbs = Iron Barbs
ability-iron-fist = Iron Fist
ability-justified = Justified
ability-keen-eye = Keen Eye
ability-klutz = Klutz
ability-leaf-guard = Leaf Guard
ability-levitate = Levitate
ability-libero = Libero
ability-light-metal = Light Metal
ability-lightning-rod = Lightning Rod
ability-limber = Limber
ability-liquid-ooze = Liquid Ooze
ability-liquid-voice = Liquid Voice
ability-long-reach = Long Reach
ability-magic-bounce = Magic Bounce
ability-magic-guard = Magic Guard
ability-magician = Magician
ability-magma-armor = Magma Armor
ability-magnet-pull = Magnet Pull
ability-marvel-scale = Marvel Scale
ability-mega-launcher = Mega Launcher
ability-merciless = Merciless
ability-mimicry = Mimicry
ability-minus = Minus
ability-mirror-armor = Mirror Armor
ability-misty-surge = Misty Surge
ability-mold-breaker = Mold Breaker
ability-moody = Moody
ability-motor-drive = Motor Drive
ability-moxie = Moxie
ability-multiscale = Multiscale
ability-multitype = Multitype
ability-mummy = Mummy
ability-natural-cure = Natural Cure
ability-neuroforce = Neuroforce
ability-neutralizing-gas = Neutralizing Gas
ability-no-guard = No Guard
ability-normalize = Normalize
ability-oblivious = Oblivious
ability-overcoat = Overcoat
ability-overgrow = Overgrow
ability-own-tempo = Own Tempo
ability-parental-bond = Parental Bond
ability-pastel-veil = Pastel Veil
ability-perish-body = Perish Body
ability-pickpocket = Pickpocket
ability-pickup = Pickup
ability-pixilate = Pixilate
ability-plus = Plus
ability-poison-heal = Poison Heal
ability-poison-point = Poison Point
ability-poison-touch = Poison Touch
ability-power-construct = Power Construct
ability-power-of-alchemy = Power of Alchemy
ability-power-spot = Power Spot
ability-prankster = Prankster
ability-pressure = Pressure
ability-primordial-sea = Primordial Sea
ability-prism-armor = Prism Armor
ability-propeller-tail = Propeller Tail
ability-protean = Protean
ability-psychic-surge = Psychic Surge
ability-punk-rock = Punk Rock
ability-pure-power = Pure Power
ability-queenly-majesty = Queenly Majesty
ability-quick-draw = Quick Draw
ability-quick-feet = Quick Feet
ability-rain-dish = Rain Dish
ability-rattled = Rattled
ability-receiver = Receiver
ability-reckless = Reckless
ability-refrigerate = Refrigerate
ability-regenerator = Regenerator
ability-ripen = Ripen
ability-rivalry = Rivalry
ability-rks-system = RKS System
ability-rock-head = Rock Head
ability-rough-skin = Rough Skin
ability-run-away = Run Away
ability-sand-force = Sand Force
ability-sand-rush = Sand Rush
ability-sand-spit = Sand Spit
ability-sand-stream = Sand Stream
ability-sand-veil = Sand Veil
ability-sap-sipper = Sap Sipper
ability-schooling = Schooling
ability-scrappy = Scrappy
ability-screen-cleaner = Screen Cleaner
ability-serene-grace = Serene Grace
ability-shadow-shield = Shadow Shield
ability-shadow-tag = Shadow Tag
ability-shed-skin = Shed Skin
ability-sheer-force = Sheer Force
ability-shell-armor = Shell Armor
ability-shield-dust = Shield Dust
ability-shields-down = Shields Down
ability-simple = Simple
ability-skill-link = Skill Link
ability-slow-start = Slow Start
ability-slush-rush = Slush Rush
ability-sniper = Sniper
ability-snow-cloak = Snow Cloak
ability-snow-warning = Snow Warning
ability-solar-power = Solar Power
ability-solid-rock = Solid Rock
ability-soul-heart = Soul-Heart
ability-soundproof = Soundproof
ability-speed-boost = Speed Boost
ability-stakeout = Stakeout
ability-stall = Stall
ability-stalwart = Stalwart
ability-stamina = Stamina
ability-stance-change = Stance Change
ability-static = Static
ability-steadfast = Steadfast
ability-steam-engine = Steam Engine
ability-steelworker = Steelworker
ability-steely-spirit = Steely Spirit
ability-stench = Stench
ability-sticky-hold = Sticky Hold
ability-storm-drain = Storm Drain
ability-strong-jaw = Strong Jaw
ability-sturdy = Sturdy
ability-suction-cups = Suction Cups
ability-super-luck = Super Luck
ability-surge-surfer = Surge Surfer
ability-swarm = Swarm
ability-sweet-veil = Sweet Veil
ability-swift-swim = Swift Swim
ability-symbiosis = Symbiosis
ability-synchronize = Synchronize
ability-tangled-feet = Tangled Feet
ability-tangling-hair = Tangling Hair
ability-technician = Technician
ability-telepathy = Telepathy
ability-teravolt = Teravolt
ability-thick-fat = Thick Fat
ability-tinted-lens = Tinted Lens
ability-torrent = Torrent
ability-tough-claws = Tough Claws
ability-toxic-boost = Toxic Boost
ability-trace = Trace
ability-transistor = Transistor
ability-triage = Triage
ability-truant = Truant
ability-turboblaze = Turboblaze
ability-unaware = Unaware
ability-unburden = Unburden
ability-unnerve = Unnerve
ability-unseen-fist = Unseen Fist
ability-victory-star = Victory Star
ability-vital-spirit = Vital Spirit
ability-volt-absorb = Volt Absorb
ability-wandering-spirit = Wandering Spirit
ability-water-absorb = Water Absorb
ability-water-bubble = Water Bubble
ability-water-compaction = Water Compaction
ability-water-veil = Water Veil
ability-weak-armor = Weak Armor
ability-white-smoke = White Smoke
ability-wimp-out = Wimp Out
ability-wonder-guard = Wonder Guard
ability-wonder-skin = Wonder Skin
ability-zen-mode = Zen Mode