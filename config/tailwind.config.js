const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      colors: {
        // Main UI colours:
        "Baby-Blue": "#0ABAB5",
        // buttons
        "Darker-Baby-Blue": "#009f9a",
        // Hover-state
        "Darkest-Baby-Blue": "#89CFF0",
        // Secondary / Nav Colour:
        "Main-Orange": "#EB6209",
        "Burnt-Orange": "#F84C0B",

        "custom-green": "#009f9a",
        
        "red-custom": "#990101",
        "deep-yellow": "#fab8b0",
        "deep-navy-blue": "#000080",
      },
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
