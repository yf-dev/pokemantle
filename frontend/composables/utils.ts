import parser from "accept-language-parser"
import { Buffer } from "buffer"

export const todayPuzzleNumber = () => {
  const origin = new Date("2022-04-28T00:00:00")
  const today = new Date()
  const days = Math.floor((today.getTime() - origin.getTime()) / 86400000)
  return days
}

export const getLocale = (): string => {
  let lang: string
  if (process.client) {
    if (window.navigator.languages && window.navigator.languages.length) {
      lang = window.navigator.languages[0].split("-")[0]
    } else {
      lang =
        window.navigator.userLanguage ||
        window.navigator.language ||
        window.navigator.browserLanguage ||
        "en"
    }
  } else {
    const accept_language: string | undefined = useRequestHeaders([
      "accept-language",
    ])["accept-language"]
    if (accept_language !== undefined) {
      lang = parser.pick(Object.keys(fluentBundles), accept_language, {
        loose: true,
      })
    } else {
      lang = "en"
    }
  }
  return lang.split("-")[0]
}

export const utf8ToB64 = (str: string): string => {
  return Buffer.from(str, "utf8").toString("base64")
}

export const b64ToUtf8 = (str: string): string => {
  return Buffer.from(str, "base64").toString("utf8")
}

export const apiBase = (): string => {
  return process.client ? api_client_base.value : api_server_base.value
}
