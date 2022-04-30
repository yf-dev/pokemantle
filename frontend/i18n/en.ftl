pokemantle = Pokémantle
pokemantle-index-subtitle = #{$puzzle_number}
pokemantle-rank-subtitle = Rank of #{$puzzle_number}

og-description = Guess today's Pokémon! If you type in a Pokémon name, it tells you how close it is.

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

show-rank-list-button = Show all ranks

faq-what-it-is-title = What is {pokemantle}?
faq-what-it-is-description = {pokemantle} is the game to guess today's Pokémon inspired by {$semantle_link}.
  If you guess today's Pokémon, {pokemantle} tells you how similar it is to the answer.
  .semantle-link-label = Semantle

faq-generation-title = What Pokémon are included?
faq-generation-description = It includes all Pokémon that have appeared in Pokémon Sword and Shield, and form differences with different characteristics are treated as separate Pokémon, so there are a total of {$number}.

faq-similarity-title = How does it calculate the similarity?
faq-similarity-description = Similarity is calculated based on the characteristics of Pokémon(generation, category, type, ability, stat, height, weight, experience group, regional form, mega evolution, partner, form difference, mythical/legendary, egg group).
  More precisely, it convert the characteristic to feature vector and calculate cosine similarity.

faq-once-per-day-title = Can I play more than once a day?
faq-once-per-day-description = No. You can only play once a day.
  We think the key to a game like Wordle is "only once a day, everyone has the same answer."

faq-yesterday-title = What was the answer yesterday?
faq-yesterday-description = {$name}. A full list of rankings is available at {$yesterday_rank_link}.
  .yesterday-rank-link-label = here

faq-sort-title = Can I sort my guesses in a different order?
faq-sort-description = Yes. You can change the order by clicking on the top header of the guess list.

faq-source-code-title = Can I check the source code?
faq-source-code-description = You can check it at the {$source_code_link}.
  .source-code-link-label = {pokemantle} Github

faq-issue-title = How can I ask other questions or feedback?
faq-issue-description = Please contact us on {$issue_link}.
  .issue-link-label = {pokemantle} Github issue page

go-back-to-main = Go back to main page