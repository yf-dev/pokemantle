pokemantle = Pokémantle
pokemantle-with-number = {pokemantle} #{$puzzle_number}

language-locale-en = English
language-locale-ko = 한국어

guess-input-input = 
  .placeholder = Pokémon Name
guess-input-button = Guess

error-no-such-pokemon = No such Pokémon.
error-unknown = Unknown error.

guess-result-header-index = #
guess-result-header-name = Name
guess-result-header-similarity = Similarity
guess-result-header-rank = Rank

correct-guess = Found!

share-title = {pokemantle} #{$puzzle_number} Solved!

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
share-clipboard-text-alert = The results have been copied to clipboard.