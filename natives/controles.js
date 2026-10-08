import { WebSocketServer } from "ws"

const port = 8080
let x = 0, y = 0, z = 0

const sensor = {
  *listen(_self) {
    const wss = new WebSocketServer({ port })
    
    wss.on("connection", (ws) => {
      console.log("✓ Celular conectado")

      ws.on("message", (msg) => {
        const data = JSON.parse(msg.toString())
        x = data.x
        y = data.y
        z = data.z
        // console.log(`x=${x} y=${y} z=${z}`)
      })
    })

    console.log("📱 Ya podés conectar tu celular a ws://localhost:8080")
  },


  *x(_self) {
    return yield* this.reify(x)
  },
  *y(_self) {
    return yield* this.reify(y)
  },
  *z(_self) {
    return yield* this.reify(z)
  },
}

export { sensor }