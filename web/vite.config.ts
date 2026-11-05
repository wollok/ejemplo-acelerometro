import { defineConfig } from "vite"
import basicSsl from "@vitejs/plugin-basic-ssl"

export default defineConfig({
  plugins: [basicSsl()],
  server: {
    host: true,
    https: true,
    proxy: {
      "/socket": {
        target: "ws://127.0.0.1:8080",
        ws: true,
      },
    },
  },
})