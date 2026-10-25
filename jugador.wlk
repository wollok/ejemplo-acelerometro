import wollok.game.*
import mapa.*

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
    // lógica que debe ocurrir después de caer en un hueco.
  }

  method llegarALaMeta() {
    activa = false
    game.removeVisual(self)
    // la lógica que debe ocurrir después de llegar a la meta
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