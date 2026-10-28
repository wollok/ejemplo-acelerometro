import wollok.game.*
import mapa.*


object ganaste {
  var property position = game.at(1, 1)

  method image() = "ganaste.png"
}

object perdiste {
  var property position = game.at(1, 1)

  method image() = "perdiste.png"
}


object bolita {

  var property position = game.at(38, 1)
  var property activa = true

  method image() = "bolita.png"


  method moverA(nuevaPosicion) {
    if (activa && mapa.estaDentroDelMapa(nuevaPosicion) && not(mapa.hayParedEn(nuevaPosicion))) {
      position = nuevaPosicion
      self.resolverCasillaActual()
    }
  }

  method resolverCasillaActual() {
    if (mapa.hayHuecoEn(position)) {
      self.caerEnHueco()
    } else if (mapa.hayMetaEn(position)) {
      self.llegarALaMeta()
    }
  }

  method caerEnHueco() {
    activa = false
    game.removeVisual(self)

    perdiste.position(game.at(1, 1))
    game.addVisual(perdiste)
  }

  method llegarALaMeta() {
    activa = false
    game.removeVisual(self)

    ganaste.position(game.at(1, 1))
    game.addVisual(ganaste)
  }

  method moverDerecha() {
    self.moverA(position.right(1))
  }

  method moverIzquierda() {
    self.moverA(position.left(1))
  }

  method moverArriba() {
    self.moverA(position.up(1))
  }

  method moverAbajo() {
    self.moverA(position.down(1))
  }

  method esPared() = false
  method esHueco() = false
  method esMeta() = false
}