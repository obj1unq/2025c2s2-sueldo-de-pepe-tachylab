object pepe {
// variables
	var categoria = cadete
    var faltas = 0
    var bonoPresentActual = normal 
    var bonoResultActual = fijo
// getters
    method categoria() {
        return categoria
    }
    method faltas() {
        return faltas
    }
    method neto() {
        return categoria.neto()
    }
    method bonoResultado() {
        return bonoResultActual
    }
    method bonoPresentismo() {
        return bonoPresentActual
    }
// setters
    method categoria(_categoria) {
        categoria = _categoria
    }
    method faltas(_faltas) {
        faltas = _faltas
    }

    method bonoPresentismo(_bonoPresentActual) {
        bonoPresentActual = _bonoPresentActual
    }
    method bonoResultado(_bonoResultActual) {
        bonoResultActual = _bonoResultActual
    }
// metodos funcionales
    method sueldo() {
        return categoria.neto() + bonoPresentActual.bono(self) + bonoResultActual.bono(self)
    }
}

object sofia {
// variables
    var categoria = cadete
    var bonoResultActual = fijo
    var faltas = 0
// getters
    method categoria() {
        return categoria
    }
    method bonoResultado() {
        return bonoResultActual
    }
    method faltas() {
        return faltas
    }
    method neto() {
        return categoria.neto() * 1.3
    }
// setters
    method categoria(_categoria) {
        categoria = _categoria
    }
    method bonoResultado(_bonoResultActual) {
        bonoResultActual = _bonoResultActual
    }
    method faltas(_faltas) {
        faltas = _faltas
    }
// metodos funcionales
    method sueldo() {
        return self.neto() + bonoResultActual.bono(self)
    }
}

object roque {
// variables
    var neto = 28000
    var bonoResultActual = nulo
    var faltas = 0
// getters
    method neto() {
        return neto
    }
    method bonoResultado() {
        return bonoResultActual
    }
    method faltas() {
        return faltas
    }
// setters
    method neto(_neto) {
        neto = _neto
    }
    method bonoResultado(_bonoResultActual) {
        bonoResultActual = _bonoResultActual
    }
    method faltas(_faltas) {
        faltas = _faltas
    }
// metodos funcionales
    method sueldo() {
        return neto + bonoResultActual.bono(self) + 9000
    }
}

object ernesto {
// variables
    var compañero = pepe
    var bonoPresentActual = nulo
    var faltas = 0
// getters
    method compañero() {
        return compañero
    }
    method bonoPresentismo() {
        return compañero.bonoPresentismo()
    }
    method neto() {
        return compañero.neto()
    }
    method faltas() {
        return faltas
    }
// setters
    method compañero(_compañero) {
        compañero = _compañero
    }
    method bonoPresentismo(_bonoPresentActual) {
        bonoPresentActual = _bonoPresentActual
    }
    method faltas(_faltas) {
        faltas = _faltas
    }
// metodos funcionales
    method sueldo() {
        return compañero.neto() + bonoPresentActual.bono(self)
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
    method neto() {
        return 16000 + 16000 * (0.25 * bonusAumentoDeVentas)
    }
}

object medioTiempo {
    var categoriaBase = cadete
    method categoriaBase(_categoriaBase) {
        categoriaBase = _categoriaBase
    }
    method neto() {
        return categoriaBase.neto() * 0.5
    }
}


//Bonos por resultados

object porcentaje {
    method bono(empleado) = empleado.neto() * 0.1
}

object fijo {
    method bono(empleado) = 800
}


//Nulo es tanto bono por presentismo como por resultados
object nulo {
    method bono(empleado) = 0
}


//Bonos por presentismo

object normal {
    method bono(empleado) {
        if (empleado.faltas() <= 1) {
            return 2000 - (1000 * empleado.faltas())
        }
        else {
            return 0
        }
    }
}

object ajuste {
    method bono(empleado) {
        if (empleado.faltas() == 0) {
            return 100
        }
        else {
            return 0
        }
    }
}

object demagogico {
    method bono(empleado) {
        if (empleado.neto() < 18000){
            return 500
        }
        else {
            return 300
        }
    }
}