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
share-pokemon-name = 정답: {$name}

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
share-hide-answer-checkbox-label = 정답 숨기기
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
faq-generation-description = Pokémon LEGENDS 아르세우스까지 등장한 포켓몬을 모두 포함하며, 서로 다른 특징을 가지는 폼체인지 등은 별도의 포켓몬으로 취급하여 총 {$number} 가지입니다. 

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
pokemon-info-etc-is-hisuian = 히스이
pokemon-info-etc-is-galarian = 가라르
pokemon-info-etc-is-alolan = 알로라
pokemon-info-etc-is-mega = 메가
pokemon-info-etc-is-partner = 파트너
pokemon-info-etc-has-form-difference = 여러모습
pokemon-info-etc-is-forme-change = 폼체인지

ability-adaptability = 적응력
ability-aerilate = 스카이스킨
ability-aftermath = 유폭
ability-air-lock = 에어록
ability-analytic = 애널라이즈
ability-anger-point = 분노의경혈
ability-anticipation = 위험예지
ability-arena-trap = 개미지옥
ability-aroma-veil = 아로마베일
ability-as-one = 혼연일체
ability-aura-break = 오라브레이크
ability-bad-dreams = 나이트메어
ability-ball-fetch = 볼줍기
ability-battery = 배터리
ability-battle-armor = 전투무장
ability-battle-bond = 유대변화
ability-beast-boost = 비스트부스트
ability-berserk = 발끈
ability-big-pecks = 부풀린가슴
ability-blaze = 맹화
ability-bulletproof = 방탄
ability-cheek-pouch = 볼주머니
ability-chilling-neigh = 백의울음
ability-chlorophyll = 엽록소
ability-clear-body = 클리어바디
ability-cloud-nine = 날씨부정
ability-color-change = 변색
ability-comatose = 절대안깸
ability-competitive = 승기
ability-compound-eyes = 복안
ability-contrary = 심술꾸러기
ability-corrosion = 부식
ability-cotton-down = 솜털
ability-curious-medicine = 기묘한약
ability-cursed-body = 저주받은바디
ability-cute-charm = 헤롱헤롱바디
ability-damp = 습기
ability-dancer = 무희
ability-dark-aura = 다크오라
ability-dauntless-shield = 불굴의방패
ability-dazzling = 비비드바디
ability-defeatist = 무기력
ability-defiant = 오기
ability-delta-stream = 델타스트림
ability-desolate-land = 끝의대지
ability-disguise = 탈
ability-download = 다운로드
ability-dragons-maw = 용의턱
ability-drizzle = 잔비
ability-drought = 가뭄
ability-dry-skin = 건조피부
ability-early-bird = 일찍기상
ability-effect-spore = 포자
ability-electric-surge = 일렉트릭메이커
ability-emergency-exit = 위기회피
ability-fairy-aura = 페어리오라
ability-filter = 필터
ability-flame-body = 불꽃몸
ability-flare-boost = 열폭주
ability-flash-fire = 타오르는불꽃
ability-flower-gift = 플라워기프트
ability-flower-veil = 플라워베일
ability-fluffy = 복슬복슬
ability-forecast = 기분파
ability-forewarn = 예지몽
ability-friend-guard = 프렌드가드
ability-frisk = 통찰
ability-full-metal-body = 메탈프로텍트
ability-fur-coat = 퍼코트
ability-gale-wings = 질풍날개
ability-galvanize = 일렉트릭스킨
ability-gluttony = 먹보
ability-gooey = 미끈미끈
ability-gorilla-tactics = 무아지경
ability-grass-pelt = 풀모피
ability-grassy-surge = 그래스메이커
ability-grim-neigh = 흑의울음
ability-gulp-missile = 그대로꿀꺽미사일
ability-guts = 근성
ability-harvest = 수확
ability-healer = 치유의마음
ability-heatproof = 내열
ability-heavy-metal = 헤비메탈
ability-honey-gather = 꿀모으기
ability-huge-power = 천하장사
ability-hunger-switch = 꼬르륵스위치
ability-hustle = 의욕
ability-hydration = 촉촉바디
ability-hyper-cutter = 괴력집게
ability-ice-body = 아이스바디
ability-ice-face = 아이스페이스
ability-ice-scales = 얼음인분
ability-illuminate = 발광
ability-illusion = 일루전
ability-immunity = 면역
ability-imposter = 괴짜
ability-infiltrator = 틈새포착
ability-innards-out = 내용물분출
ability-inner-focus = 정신력
ability-insomnia = 불면
ability-intimidate = 위협
ability-intrepid-sword = 불요의검
ability-iron-barbs = 철가시
ability-iron-fist = 철주먹
ability-justified = 정의의마음
ability-keen-eye = 날카로운눈
ability-klutz = 서투름
ability-leaf-guard = 리프가드
ability-levitate = 부유
ability-libero = 리베로
ability-light-metal = 라이트메탈
ability-lightning-rod = 피뢰침
ability-limber = 유연
ability-liquid-ooze = 해감액
ability-liquid-voice = 촉촉보이스
ability-long-reach = 원격
ability-magic-bounce = 매직미러
ability-magic-guard = 매직가드
ability-magician = 매지션
ability-magma-armor = 마그마의무장
ability-magnet-pull = 자력
ability-marvel-scale = 이상한비늘
ability-mega-launcher = 메가런처
ability-merciless = 무도한행동
ability-mimicry = 의태
ability-minus = 마이너스
ability-mirror-armor = 미러아머
ability-misty-surge = 미스트메이커
ability-mold-breaker = 틀깨기
ability-moody = 변덕쟁이
ability-motor-drive = 전기엔진
ability-moxie = 자기과신
ability-multiscale = 멀티스케일
ability-multitype = 멀티타입
ability-mummy = 미라
ability-natural-cure = 자연회복
ability-neuroforce = 브레인포스
ability-neutralizing-gas = 화학변화가스
ability-no-guard = 노가드
ability-normalize = 노말스킨
ability-oblivious = 둔감
ability-overcoat = 방진
ability-overgrow = 심록
ability-own-tempo = 마이페이스
ability-parental-bond = 부자유친
ability-pastel-veil = 파스텔베일
ability-perish-body = 멸망의바디
ability-pickpocket = 나쁜손버릇
ability-pickup = 픽업
ability-pixilate = 페어리스킨
ability-plus = 플러스
ability-poison-heal = 포이즌힐
ability-poison-point = 독가시
ability-poison-touch = 독수
ability-power-construct = 스웜체인지
ability-power-of-alchemy = 과학의힘
ability-power-spot = 파워스폿
ability-prankster = 짓궃은마음
ability-pressure = 프레셔
ability-primordial-sea = 시작의바다
ability-prism-armor = 프리즘아머
ability-propeller-tail = 스크루지느러미
ability-protean = 변환자재
ability-psychic-surge = 사이코메이커
ability-punk-rock = 펑크록
ability-pure-power = 순수한힘
ability-queenly-majesty = 여왕의위엄
ability-quick-draw = 퀵드로
ability-quick-feet = 속보
ability-rain-dish = 젖은접시
ability-rattled = 주눅
ability-receiver = 리시버
ability-reckless = 이판사판
ability-refrigerate = 프리즈스킨
ability-regenerator = 재생력
ability-ripen = 숙성
ability-rivalry = 투쟁심
ability-rks-system = AR시스템
ability-rock-head = 돌머리
ability-rough-skin = 까칠한피부
ability-run-away = 도주
ability-sand-force = 모래의힘
ability-sand-rush = 모래헤치기
ability-sand-spit = 모래뿜기
ability-sand-stream = 모래날림
ability-sand-veil = 모래숨기
ability-sap-sipper = 초식
ability-schooling = 어군
ability-scrappy = 배짱
ability-screen-cleaner = 배리어프리
ability-serene-grace = 하늘의은총
ability-shadow-shield = 스펙터가드
ability-shadow-tag = 그림자밟기
ability-shed-skin = 탈피
ability-sheer-force = 우격다짐
ability-shell-armor = 조가비갑옷
ability-shield-dust = 인분
ability-shields-down = 리밋실드
ability-simple = 단순
ability-skill-link = 스킬링크
ability-slow-start = 슬로스타트
ability-slush-rush = 눈치우기
ability-sniper = 스나이퍼
ability-snow-cloak = 눈숨기
ability-snow-warning = 눈퍼뜨리기
ability-solar-power = 선파워
ability-solid-rock = 하드록
ability-soul-heart = 소울하트
ability-soundproof = 방음
ability-speed-boost = 가속
ability-stakeout = 잠복
ability-stall = 시간벌기
ability-stalwart = 굳건한신념
ability-stamina = 지구력
ability-stance-change = 배틀스위치
ability-static = 정전기
ability-steadfast = 불굴의마음
ability-steam-engine = 증기기관
ability-steelworker = 강철술사
ability-steely-spirit = 강철정신
ability-stench = 악취
ability-sticky-hold = 점착
ability-storm-drain = 마중물
ability-strong-jaw = 옹골찬턱
ability-sturdy = 옹골참
ability-suction-cups = 흡반
ability-super-luck = 대운
ability-surge-surfer = 서핑테일
ability-swarm = 벌레의알림
ability-sweet-veil = 스위트베일
ability-swift-swim = 쓱쓱
ability-symbiosis = 공생
ability-synchronize = 싱크로
ability-tangled-feet = 갈지자걸음
ability-tangling-hair = 컬리헤어
ability-technician = 테크니션
ability-telepathy = 텔레파시
ability-teravolt = 테라볼티지
ability-thick-fat = 두꺼운지방
ability-tinted-lens = 색안경
ability-torrent = 격류
ability-tough-claws = 단단한발톱
ability-toxic-boost = 독폭주
ability-trace = 트레이스
ability-transistor = 트랜지스터
ability-triage = 힐링시프트
ability-truant = 게으름
ability-turboblaze = 터보블레이즈
ability-unaware = 천진
ability-unburden = 곡예
ability-unnerve = 긴장감
ability-unseen-fist = 보이지않는주먹
ability-victory-star = 승리의별
ability-vital-spirit = 의기양양
ability-volt-absorb = 축전
ability-wandering-spirit = 떠도는영혼
ability-water-absorb = 저수
ability-water-bubble = 수포
ability-water-compaction = 꾸덕꾸덕굳기
ability-water-veil = 수의베일
ability-weak-armor = 깨어진갑옷
ability-white-smoke = 하얀연기
ability-wimp-out = 도망태세
ability-wonder-guard = 불가사의부적
ability-wonder-skin = 미라클스킨
ability-zen-mode = 달마모드