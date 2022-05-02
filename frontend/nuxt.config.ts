import { defineNuxtConfig } from 'nuxt'
import fluentPlugin from 'rollup-plugin-fluent-vue'

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
  modules: [
    '@nuxtjs/tailwindcss',
    '@nuxtjs/color-mode'
  ],
  typescript: {
    shim: false
  },
  runtimeConfig: {
    public: {
      frontendBase: 'http://localhost:3000',
      apiBase: 'http://localhost:8000',
      gtagId: 'GA_MEASUREMENT_ID',
    }
  },
  colorMode: {
    classSuffix: ''
  },
  vite: {
    plugins: [fluentPlugin()],
    server: {
      hmr: {
        protocol: 'ws', // TODO: parse from env var
        port: 50443,
        clientPort: 50443,
      },
    },
  }
})