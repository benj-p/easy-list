const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    fontFamily: {
      sans: ['Hind', 'sans-serif'],
      heading: ['Montserrat', 'sans-serif']
    },
    extend: {
      // fontFamily: {
      //   sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      // },
      backgroundImage: {
        'home-pattern':
          "linear-gradient(to right top, #48829e 50%, #51dacf 50%)"
      },
      colors: {
        'lemon-meringue': '#FAF0CA'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}