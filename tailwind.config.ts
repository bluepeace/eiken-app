import type { Config } from "tailwindcss";

const config: Config = {
  darkMode: ["class"],
  content: [
    "./app/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./lib/**/*.{ts,tsx}"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          '"Noto Sans JP"',
          "Hiragino Kaku Gothic ProN",
          "Meiryo",
          "sans-serif"
        ],
        "zen-maru": ['"Zen Maru Gothic"', "sans-serif"]
      },
      colors: {
        /** Stay Colorful パレット */
        module: {
          vocabulary: "#FF991F", // Tree Poppy
          writing: "#8DC63A", // Wild Lime
          reading: "#009DC9", // Morpho Blue（キーカラー）
          listening: "#843DAD", // Trendy Violet
          speaking: "#EC3496" // Dazzling Fuchsia
        },
        /** キーカラー Morpho Blue ベース */
        brand: {
          50: "#e6f7fb",
          100: "#cceef7",
          200: "#99ddef",
          300: "#66cce7",
          400: "#33bbdf",
          500: "#009DC9",
          600: "#0087A8",
          700: "#007187",
          800: "#005b66",
          900: "#004545"
        }
      }
    }
  },
  plugins: []
};

export default config;
