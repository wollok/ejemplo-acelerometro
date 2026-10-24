import wollok.game.*
import jugador.*

object controles {
  method activar() {
    keyboard.right().onPressDo({
      bolita.moverDerecha()
    })

    keyboard.left().onPressDo({
      bolita.moverIzquierda()
    })

    keyboard.up().onPressDo({
      bolita.moverArriba()
    })

    keyboard.down().onPressDo({
      bolita.moverAbajo()
    })
  }
}
