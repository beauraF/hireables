const purgecss = require('@fullhuman/postcss-purgecss')({
  content: ['./app/views/**/*.html.erb'],
  defaultExtractor: (content) => content.match(/[\w-/:]+(?<!:)/g) || [],
})

module.exports = {
  plugins: [
    require('tailwindcss'),
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009',
      },
      stage: 3,
    }),
    ...(process.env.NODE_ENV === 'production' ? [purgecss] : []),
  ],
}
