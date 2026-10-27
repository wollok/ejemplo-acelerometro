import { WebSocketServer } from "ws"

const port = 8080
let x = 0, y = 0, z = 0

const sensor = {
  *listen(_self) {
    const wss = new WebSocketServer({ port })

    wss.on("connection", (ws) => {
      console.log("✓ Celular conectado")

      ws.on("message", (msg) => {
        const { acceleration, buttonPressed } = JSON.parse(msg.toString())
        if (acceleration) {
          x = acceleration.x
          y = acceleration.y
          z = acceleration.z
          // console.log(`Acceleration: x=${x} y=${y} z=${z}`)
        }
        if (buttonPressed) console.log({ buttonPressed })
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