pokemantle = Pokémantle
pokemantle-index-subtitle = #{$puzzle_number}
pokemantle-rank-subtitle = #{$puzzle_number} 전체 순위

og-description = 오늘의 포켓몬을 맞춰보세요! 포켓몬 이름을 입력하면 정답과 얼마나 비슷한지 알려줍니다.

language-locale-en = English
language-locale-ko = 한국어

guess-input-input = 
  .placeholder = 포켓몬 이름
guess-input-button = 추측하기

error-no-such-pokemon = 잘못된 포켓몬 이름입니다.
error-no-rank = 잘못된 순위 정보입니다.
error-invalid-request = 잘못된 요청입니다.
error-unknown = 알 수 없는 오류입니다.

guess-result-header-index = #
guess-result-header-name = 이름
guess-result-header-similarity = 유사도
guess-result-header-rank = 순위

correct-guess = 정답!

share-title = {pokemantle} #{$puzzle_number} 성공!

share-guess-count-title = 추측 횟수
share-guess-count-value = {$value}회
share-guess-count-average = 평균 {$value}회

share-best-rank-title = 최고 유사 순위
share-best-rank-value = {$value}위
share-best-rank-similarity = 유사도 {$value}

share-streak-title = 연속 정답
share-streak-value = {$value}회
share-streak-best = 최고기록 {$value}회

share-button = 공유하기
share-clipboard-text = {pokemantle} #{$puzzle_number} 성공!
  {$guess_count}번째 추측에서 포켓몬을 맞췄습니다.
  가장 유사한 추측의 순위는 {$best_rank}위이며, 유사도는 {$best_similarity}입니다.
share-clipboard-text-alert = 결과를 클립보드에 복사했습니다.

show-rank-list-button = 전체 순위 보기

faq-what-it-is-title = {pokemantle}이 뭔가요?
faq-what-it-is-description = {pokemantle}은 오늘의 포켓몬을 맞추는 게임입니다.
  오늘의 포켓몬을 추측하면, 추측한 포켓몬이 정답 포켓몬과 얼마나 비슷한지 알려줍니다.
  {pokemantle}은 {$semantle_link}에서 영감을 받아 만들어졌습니다.
  .semantle-link-label = Semantle

faq-generation-title = 어떤 포켓몬이 포함되어 있나요?
faq-generation-description = 포켓몬스터 소드 · 실드 까지 등장한 포켓몬을 모두 포함하며, 서로 다른 특징을 가지는 폼체인지 등은 별도의 포켓몬으로 취급하여 총 {$number} 가지입니다. 

faq-show-info-title = 포켓몬의 상세 정보를 볼 수 있나요?
faq-show-info-description = 네. 추측한 포켓몬을 목록에서 클릭하면 상세 정보가 표시됩니다.

faq-similarity-title = 유사도는 어떻게 계산하나요?
faq-similarity-description = 포켓몬의 특징(세대, 분류, 타입, 특성, 종족값, 키, 몸무게, 경험치 그룹, 리전폼, 메가진화, 파트너, 폼체인지, 환상/전설, 알그룹)을 기반으로 유사도를 계산합니다.
  더 정확하게는 각각의 특징을 벡터로 변환하여 코사인 유사도를 계산합니다.

faq-once-per-day-title = 하루에 한 번 이상 플레이할 수 있나요?
faq-once-per-day-description = 아니오. 하루에 한 번만 플레이할 수 있습니다.
  저희는 Wordle과 같은 게임의 핵심 요소는 "하루에 한 번만, 모두가 동일한 정답"이라고 생각합니다.

faq-yesterday-title = 어제의 정답은 뭐였나요?
faq-yesterday-description = {$name} 입니다. 전체 순위 목록은 {$yesterday_rank_link}에서 볼 수 있습니다.
  .yesterday-rank-link-label = 여기

faq-sort-title = 내 추측을 다른 방식으로 정렬할 수 있나요?
faq-sort-description = 네. 추측 목록 상단 헤더를 클릭하여 정렬 방식을 변경할 수 있습니다.

faq-source-code-title = 소스 코드를 확인할 수 있나요?
faq-source-code-description = {$source_code_link}에서 확인할 수 있습니다.
  .source-code-link-label = {pokemantle} Github

faq-issue-title = 다른 질문이나 피드백은 어떻게 보내나요?
faq-issue-description = {$issue_link}에서 문의해주세요.
  .issue-link-label = {pokemantle} Github 이슈

go-back-to-main = 메인 페이지로 돌아가기

pokemon-info-name = 이름: {$name}
pokemon-info-generation = 세대: {$generation}세대
pokemon-info-species = 분류: {$species}
pokemon-info-height = 키: {$height}m
pokemon-info-weight = 몸무게: {$weight}kg
pokemon-info-growth-rate-label = 경험치 그룹:
pokemon-info-growth-rate = {$growth_rate ->
  [NONE] 없음
  [Slow] 느림
  [MediumSlow] 중간느림
  [MediumFast] 중간빠름 
  [Fast] 빠름
  [Fluctuating] 불규칙
  [Erratic] 엄청남
  *[other] {$growth_rate}
}
pokemon-info-status-label = 구분:
pokemon-info-status = {$status ->
  [NONE] 없음
  [Normal] 일반
  [SubLegendary] 준전설
  [Legendary] 전설
  [Mythical] 환상
  *[other] {$status}
}
pokemon-info-type-1-label = 타입1:
pokemon-info-type-1 = {$type_1 ->
  [NONE] 없음
  [Bug] 벌레
  [Dark] 악
  [Dragon] 드래곤
  [Electric] 전기
  [Fairy] 페어리
  [Fighting] 격투
  [Fire] 불꽃
  [Flying] 비행
  [Ghost] 고스트
  [Grass] 풀
  [Ground] 땅
  [Ice] 얼음
  [Normal] 노말
  [Poison] 독
  [Psychic] 에스퍼
  [Rock] 바위
  [Steel] 강철
  [Water] 물
  *[other] {$type_1}
}
pokemon-info-type-2-label = 타입2:
pokemon-info-type-2 = {$type_2 ->
  [NONE] 없음
  [Bug] 벌레
  [Dark] 악
  [Dragon] 드래곤
  [Electric] 전기
  [Fairy] 페어리
  [Fighting] 격투
  [Fire] 불꽃
  [Flying] 비행
  [Ghost] 고스트
  [Grass] 풀
  [Ground] 땅
  [Ice] 얼음
  [Normal] 노말
  [Poison] 독
  [Psychic] 에스퍼
  [Rock] 바위
  [Steel] 강철
  [Water] 물
  *[other] {$type_2}
}
pokemon-info-ability-1 = 특성1: {$ability_1 ->
  [NONE] 없음
  *[other] {$ability_1}
}
pokemon-info-ability-2 = 특성2: {$ability_2 ->
  [NONE] 없음
  *[other] {$ability_2}
}
pokemon-info-ability-hidden = 숨겨진 특성: {$ability_hidden ->
  [NONE] 없음
  *[other] {$ability_hidden}
}
pokemon-info-hp-speed = 체력 / 스피드: {$hp} / {$speed}
pokemon-info-attack = 공격 / 특수공격: {$attack} / {$sp_attack}
pokemon-info-defense = 방어 / 특수방어: {$defense} / {$sp_defense}
pokemon-info-egg-type-1-label = 알그룹1:
pokemon-info-egg-type-1 = {$egg_type_1 ->
  [NONE] 없음
  [Amorphous] 부정형
  [Bug] 벌레
  [Ditto] 메타몽
  [Dragon] 드래곤
  [Fairy] 요정
  [Field] 육상
  [Flying] 비행
  [Grass] 식물
  [Human-Like] 인간형
  [Mineral] 광물
  [Monster] 괴수
  [Undiscovered] 미발견
  [Water1] 수중1
  [Water2] 수중2
  [Water3] 수중3
  *[other] {$egg_type_1}
}
pokemon-info-egg-type-2-label = 알그룹2:
pokemon-info-egg-type-2 = {$egg_type_2 ->
  [NONE] 없음
  [Amorphous] 부정형
  [Bug] 벌레
  [Ditto] 메타몽
  [Dragon] 드래곤
  [Fairy] 요정
  [Field] 육상
  [Flying] 비행
  [Grass] 식물
  [Human-Like] 인간형
  [Mineral] 광물
  [Monster] 괴수
  [Undiscovered] 미발견
  [Water1] 수중1
  [Water2] 수중2
  [Water3] 수중3
  *[other] {$egg_type_2}
}
pokemon-info-etc-label = 기타:
pokemon-info-etc-is-galarian = 가라르
pokemon-info-etc-is-alolan = 알로라
pokemon-info-etc-is-mega = 메가
pokemon-info-etc-is-partner = 파트너
pokemon-info-etc-has-form-difference = 여러모습
pokemon-info-etc-is-forme-change = 폼체인지