object belga{
	method lesGusta(unaMarca) = unaMarca.lupulo() > 4
}

object checo{
	method lesGusta(unaMarca) = unaMarca.graduacion() > 8 
}

object aleman{
	method lesGusta(unaMarca) = true
}

class Persona{
	var peso
	const property jarrasCompradas = [ ] 
	var leGustaMusicaTradicional
	const property nacionalidad
	const aguante 
	
	method todasTuJarrasSonDe1LitroOMas() = jarrasCompradas.all({j => j.litros() >= 1})
	method comprarJarra(unaJarra){
		jarrasCompradas.add(unaJarra)
	}
	method totalAlcoholConsumido() = jarrasCompradas.sum({a => a.contenidoDeAlcohol()}) 
	method estaEbrio() = self.totalAlcoholConsumido() * peso > aguante
	method leGusta(unaMarca) = nacionalidad.lesGusta(unaMarca)
	method esTuNacionalidad(unaNacionalidad) = self.nacionalidad() == unaNacionalidad
	method quiereEntrarA(unaCarpa) = if(self.esTuNacionalidad(aleman)){
			self.leGusta(unaCarpa.marcaQueVende()) 
			and leGustaMusicaTradicional 
			and unaCarpa.tieneBanda()
			and unaCarpa.cantPersonasDentro().even()
		}
		else{
			self.leGusta(unaCarpa.marcaQueVende()) 
			and leGustaMusicaTradicional 
			and unaCarpa.tieneBanda()
		} 								
	method podesEntrarEn(carpa) = self.quiereEntrarA(carpa) and carpa.puedeEntrar(self)
	method ingresarA(carpa){
		if(self.podesEntrarEn(carpa)){
			carpa.agregarPersona(self)
		}
	}
	method marcaMasComprada() = jarrasCompradas.max({j => j.marca()})
	method esPatriota() = jarrasCompradas.all({j => j.marca().paisOrigen() == nacionalidad})
	method esCompatibleCon(persona) = self.marcaMasComprada() == persona.marcaMasComprada() 								
}