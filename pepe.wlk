object pepe {
// variables
	var categoria = cadete
    var faltas = 0
    var bonoPresentismo = normal 
    var bonoResultados = fijo
// getters
    method categoria() = categoria
    method faltas() = faltas
    method neto() = categoria.neto()
    method bonoResultado() = bonoResultados
    method bonoPresentismo() = bonoPresentismo
// setters
    method categoria(_categoria) {
        categoria = _categoria
    }
    method faltas(_faltas) {
        faltas = _faltas
    }

    method bonoPresentismo(_bonoPresentismo) {
        bonoPresentismo = _bonoPresentismo
    }
    method bonoResultado(_bonoResultado) {
        bonoResultados = _bonoResultado
    }
// metodos funcionales
    method sueldo(faltasONetoResultados, faltasONetoPresentismo) {
        return self.neto() + bonoResultados.bono(faltasONetoResultados) + bonoPresentismo.bono(faltasONetoPresentismo)
    }
}

object sofia {
// variables
    var categoria = cadete
    var bonoResultado = fijo
    var faltas = 0
// getters
    method categoria() = categoria
    method bonoResultado() = bonoResultado
    method faltas() = faltas
    method neto() = self.categoria().neto() * 1.3

// setters
    method categoria(_categoria) {
        categoria = _categoria
    }
    method bonoResultado(_bonoResultado) {
        bonoResultado = _bonoResultado
    }
    method faltas(_faltas) {
        faltas = _faltas
    }
// metodos funcionales
    method sueldo(faltasONetoResultados) {
        return self.neto() + bonoResultado.bono(faltasONetoResultados)
    }
}




//Categorias
object cadete {
    method neto() = 20000
}

object gerente {
    method neto() = 15000
}

object vendedor {
    var bonusAumentoDeVentas = 0
    method activarAumentoDeVentas() {
        bonusAumentoDeVentas = 1
    }
    method desactivarAumentoDeVentas() {
        bonusAumentoDeVentas = 0
    }
    method neto() = 16000 * (1.25 * bonusAumentoDeVentas)
}


//Bonos por resultados

object porcentaje {
    method bono(neto) = neto * 0.1
}

object fijo {
    method bono(neto) = 800 + neto * 0
}


//Nulo es tanto bono por presentismo como por resultados
object nulo {
    method bono(netoOFaltas) = netoOFaltas * 0
}


//Bonos por presentismo

object normal {
    method bono(faltas) {
        if (faltas <= 1) {
            return 2000 - (1000 * faltas)
        }
        else {
            return 0
        }
    }
}

object ajuste {
    method bono(faltas) {
        if (faltas == 0) {
            return 100
        }
        else {
            return 0
        }
    }
}

object demagogico {
    method bono(neto) {
        if (neto < 18000){
            return 500
        }
        else {
            return 300
        }
    }
}