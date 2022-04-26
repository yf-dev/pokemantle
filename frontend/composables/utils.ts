export const todayPuzzleNumber = () => {
  const origin = new Date("2022-04-20T00:00:00")
  const today = new Date()
  const days = Math.floor((today.getTime() - origin.getTime()) / 86400000)
  return days
}

export const getLocale = () => {
  if (typeof window !== "undefined") {
    if (window.navigator.languages && window.navigator.languages.length) {
      return window.navigator.languages[0];
    } else {
      return window.navigator.userLanguage || window.navigator.language || window.navigator.browserLanguage || 'en';
    }
  } else {
    return 'en';
  }
}

export const changeLocale = (locale: string) => {
  if (isValidFluentLocale) {
    changeFluentLocale(locale)
    apiPokemonNameMap(locale).then((data) => api_data.pokemon_name_map = data)
  }
}

export const translatePokemonName = (name: string, to_eng: boolean): string | undefined => {
  if (to_eng) {
    return api_data.pokemon_name_map.find(localname => localname.local_name === name)?.english_name;
  } else {
    return api_data.pokemon_name_map.find(localname => localname.english_name === name)?.local_name;
  }
}
