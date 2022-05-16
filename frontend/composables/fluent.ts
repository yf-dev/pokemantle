import { FluentBundle, FluentResource } from '@fluent/bundle'
import { createFluentVue } from 'fluent-vue'

// @ts-ignore
import enMessages from '~/i18n/en.ftl?raw'
// @ts-ignore
import koMessages from '~/i18n/ko.ftl?raw'

const enBundle = new FluentBundle('en')
enBundle.addResource(new FluentResource(enMessages))

const koBundle = new FluentBundle('ko')
koBundle.addResource(new FluentResource(koMessages))

export const fluentBundles = {
  'en': enBundle,
  'ko': koBundle,
}

export const fluent = createFluentVue({
  bundles: [enBundle]
})

export const isValidFluentLocale = (locale: string) => locale in fluentBundles
export const changeFluentLocale = (locale: string) => {
  if (isValidFluentLocale) {
    fluent.bundles = [fluentBundles[locale], enBundle]
  } else {
    fluent.bundles = [enBundle]
  }
}