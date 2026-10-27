object sensor {
  const events = new Dictionary()

  method listen() native
  method x() native  
  method y() native
  method z() native
  method flushEvents() native

  method register(key, block) {
    const actions = events.getOrElse(key, { [] })
    actions.add(block)
    events.put(key, actions)
  }

  method buttonPressed(key) {
    const actions = events.getOrElse(key, { [] })
    actions.forEach({ block => block.apply() })
  }
}

object celular {
  const sensibilidad = 2
  
  method simularTeclas() {
    sensor.listen()
    game.tick(100, { 
      sensor.flushEvents() 
      self.registraMovimiento() 
    }, true).start()
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