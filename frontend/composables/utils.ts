import parser from 'accept-language-parser'

export const todayPuzzleNumber = () => {
  const origin = new Date("2022-04-28T00:00:00")
  const today = new Date()
  const days = Math.floor((today.getTime() - origin.getTime()) / 86400000)
  return days
}

export const getLocale = (): string => {
  let lang: string;
  if (typeof window !== "undefined") {
    if (window.navigator.languages && window.navigator.languages.length) {
      lang = window.navigator.languages[0].split('-')[0]
    } else {
      lang = window.navigator.userLanguage || window.navigator.language || window.navigator.browserLanguage || 'en'
    }
  } else {
    const accept_language: string | undefined = useRequestHeaders(['accept-language'])['accept-language']
    if (accept_language !== undefined) {
      lang = parser.pick(Object.keys(fluentBundles), accept_language, { loose: true });
    } else {
      lang = 'en'
    }
  }
  return lang.split('-')[0]
}
