const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './assets/**/*.css',
    './components/*.{vue,js}',
    './components/**/*.{vue,js}',
    './pages/*.vue',
    './layouts/*.vue',
    './pages/**/*.vue',
    './plugins/**/*.{js,ts}',
    // './*.{vue,js,ts}',
    // './nuxt.config.{js,ts}',
  ],
  theme: {
    screens: {
      'zs': '320px',
      'xs': '475px',
      ...defaultTheme.screens,
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
};