import wollok.game.*
import casillas.*

object mapa {
  const property ancho = 40
  const property alto = 20

  method iniciar(filasNivel) {
    var y = 0

    filasNivel.forEach({ fila =>
      var x = 0

      fila.forEach({ casilla =>
        casilla.nuevoEn_y_(x, y)
        x += 1
      })

      y += 1
    })
  }

  method estaDentroDelMapa(posicion) =
    posicion.x().between(0, self.ancho() - 1) &&
    posicion.y().between(0, self.alto() - 1)

  method hayParedEn(posicion) =
    game.getObjectsIn(posicion).any({ objeto =>
      objeto.esPared()
    })

  method hayHuecoEn(posicion) =
    game.getObjectsIn(posicion).any({ objeto =>
      objeto.esHueco()
    })

  method hayMetaEn(posicion) =
    game.getObjectsIn(posicion).any({ objeto =>
      objeto.esMeta()
    })
}
