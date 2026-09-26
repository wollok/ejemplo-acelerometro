object sensor {
  method x() native
  
  method y() native
  
  method z() native
}

object celular {
  const sensibilidad = 2
  
  method simularTeclas() {
    game.tick(100, { self.registraMovimiento() }, true).start()
  }
  
  method registraMovimiento() {
    if (sensor.x() > sensibilidad) self.presionar("ArrowLeft")
    if (sensor.x() < (-sensibilidad)) self.presionar("ArrowRight")
    if (sensor.y() > sensibilidad) self.presionar("ArrowDown")
    if (sensor.y() < (-sensibilidad)) self.presionar("ArrowUp")
  }
  
  method presionar(tecla) {
    io.queueEvent("keypress", tecla)
  }
}