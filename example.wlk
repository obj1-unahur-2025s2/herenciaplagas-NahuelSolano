class Hogar {
  var nivelMugre;
  const confort;
  
  method esBueno() {
    return nivelMugre <= confort/2;
  }
  method recibirAtaque(plaga) {
    nivelMugre = nivelMugre + plaga.nivelDaño()
  }
}

class Huerta {
  var capacidadProduccion;
  method esBueno() {
    return capacidadProduccion >= nivel.nivelRequerido();
  }
  method recibirAtaque(plaga) {
    capacidadProduccion = capacidadProduccion - plaga.nivelDaño() * 0.1;
    if (plaga.tramitirEnfermedades()) {capacidadProduccion = capacidadProduccion-10}
  }
}

object nivel{
  var property nivelRequerido = 0;
}


class Mascota {
  var salud;

  method esBueno() {
    return salud >= 250;
  }
  method recibirAtaque(plaga) {
    if (plaga.tramitirEnfermedades()) {salud = salud - plaga.nivelDaño()}
  }

}

class Barrio{
  const elementos = [];

  method agregarElemento(nuevoElemento) {
    elementos.add(nuevoElemento)
  }

  method elBarrioEsCopado() {
    return self.hayMasElementosBuenos();
  }

  method hayMasElementosBuenos(){
    var cantidadElementosBuenos = elementos.count({e => e.esBueno()})
    return cantidadElementosBuenos >= elementos.size()/2
  }
}

class Plaga{
  var poblacion
  method tramitirEnfermedades() {
    return poblacion >= 10
  }
  method atacar(elemento) {
    elemento.recibirAtaque(self)
    self.efectos()
  }
  method efectos() {
    poblacion = poblacion * 1.1;
  }
}

class Cucaracha inherits Plaga {
  var pesoPromedio 
  method nivelDaño() {
    return poblacion/2
  }
  override method tramitirEnfermedades() {
    return super() && pesoPromedio >=10
  }
  override method efectos() {
    super() 
    pesoPromedio = pesoPromedio + 2
  }
}

class Pulgas inherits Plaga {
  method nivelDaño() {
    return poblacion * 2;
  }
  override method tramitirEnfermedades() {
  return super() null
  }

  override method efectos() {
    super()
    null
  }
}

class Garrapatas inherits Plaga{
  method nivelDaño() {
    return poblacion * 2;
  }
  override method tramitirEnfermedades() {
    return super() null
  }

  override method efectos() {
    poblacion = poblacion * 1.2
  }
}

class Mosquitos inherits Plaga {
  method nivelDaño() {
    return poblacion
  }
  override method tramitirEnfermedades() {
    return super() && poblacion % 3 == 0
  }
}
