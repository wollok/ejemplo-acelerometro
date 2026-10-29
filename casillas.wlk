
import wollok.game.*

class ElementoMapa {
  const property position
  
// se usa un piso azul para que se use en los metodos, pero no se usa en el juego, ya que no se agrega a la pantalla.
  method image() = "piso_azul.png"
  method esPared() = false
  method esHueco() = false
  method esMeta() = false
}

class Pared inherits ElementoMapa {
  override method image() = "pared.jpeg"
  override method esPared() = true
}

class Hueco inherits ElementoMapa {
  override method image() = "hueco.jpeg"
  override method esHueco() = true
}

class Meta inherits ElementoMapa {
  override method image() = "meta.png"
  override method esMeta() = true
}


object v {
  method nuevoEn_y_(x, y) { }
}

object m {
  method nuevoEn_y_(x, y) {
    game.addVisual(new Pared(position = game.at(x, y)))
  }
}

object h {
  method nuevoEn_y_(x, y) {
    game.addVisual(new Hueco(position = game.at(x, y)))
  }
}

object s {
  method nuevoEn_y_(x, y) {
    game.addVisual(new Meta(position = game.at(x, y)))
  }
}