import Marcas.*

class Carpa{
	const property limiteDeGente
	var property tieneBanda
	var property marcaQueVende
	const personasDentro = [ ] 
	
	method estaDentro(persona) = personasDentro.contains(persona) 
	method cantPersonasDentro() = personasDentro.size()
	method agregarPersona(persona){
		personasDentro.add(persona)
	}
	method vendeCerveza() = true
	method puedeEntrar(persona) =  not persona.estaEbrio() and self.cantPersonasDentro() + 1 <= limiteDeGente
	method servirJarraDe_A(litro, persona){
		if(self.estaDentro(persona))
			persona.comprarJarra({new Jarra(marca = marcaQueVende, litros = litro)})
	}
	method ebriosEmperdernidos() = personasDentro.count({p => p.todasTuJarrasSonDe1LitroOMas()})
}