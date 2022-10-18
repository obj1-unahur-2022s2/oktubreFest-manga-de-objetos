class Jarra{
	var property litros
	var property marca
	
	method contenidoDeAlcohol() = litros * marca.graduacion() / 100
}

class Cerveza{
	var property litro
	var property lupulo 
	const property paisOrigen
}

class Rubia inherits Cerveza{
	
	var property graduacion  
	
	
}

class Negra inherits Cerveza{
	
	var graduacionReglamentaria
	var property graduacion = graduacionReglamentaria.min(lupulo * 2) 
}

class Roja inherits Cerveza{
	var graduacionReglamentaria
	var property graduacion = graduacionReglamentaria.min(lupulo * 2) * 1.25
}