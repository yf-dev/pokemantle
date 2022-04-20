import { defineNuxtConfig } from 'nuxt3'

// https://v3.nuxtjs.org/docs/directory-structure/nuxt.config
export default defineNuxtConfig({
  modules: [
    '@nuxtjs/tailwindcss'
  ],
  typescript: {
    shim: false
  },
  runtimeConfig: {
    public: {
       apiBase: 'http://localhost:8000'
    }
  }
})