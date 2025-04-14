import js from "@eslint/js";
import pluginReact from "eslint-plugin-react";
import globals from "globals";
import { defineConfig } from 'eslint/config';
import babelParser from '@babel/eslint-parser';

export default defineConfig([
  {
    files: ["**/*.{js,mjs,cjs,jsx}"],
    parser: babelParser,
    parserOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
      ecmaFeatures: {
        jsx: true, // Enable JSX parsing
      },
    },
    plugins: {
      js,
      react: pluginReact,
    },
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
    settings: {
      react: {
        version: "detect", // Automatically detect the version of React
      },
    },
    rules: {
      "no-console": "warn",
      "react/prop-types": "off",
      "react/react-in-jsx-scope": "off", // Disable for React 17 and newer
    },
  },
]);
