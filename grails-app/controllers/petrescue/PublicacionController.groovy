package petrescue
import org.joda.time.*
import java.text.*;

class PublicarAvisoCommand {
	String especie, raza, sexo, tamanio, nombre, senias, comentario, edad
	String provincia, barrio, calles
	LocalDate fecha
	TipoAviso tipoDeAviso
	
	static constraints = {
		especie inList: ['perro', 'gato'], blank: false, nullable: false
		sexo inList: ['macho', 'hembra'], blank: false, nullable: false
		raza blank: false, nullable: false
		tamanio inList: ['chico', 'mediano', 'grande'], blank: false, nullable: false
		edad blank: true, nullable: true
		nombre blank: true, nullable: true
		senias blank: true, nullable: true
		comentario blank: true, nullable: true

		provincia blank:false, nullable: false
		barrio blank: false, nullable: false
		calles blank: true, nullable: true
	}
}


class PublicacionController {
	def coincidenciasService
	def notificacionesService

	def index() {
		[command: new PublicarAvisoCommand()]
	}

	def publicarAviso(PublicarAvisoCommand command) {
		if (command.hasErrors()) {
			render view: "index", model: [command: command]
			return
		}

		// Mascota
		def especie = command.especie
		def raza = command.raza
		def sexo = command.sexo
		def tamanio = command.tamanio
		def edad = command.edad
		def nombre = command.nombre
		def senias = command.senias
		Mascota mascota = new Mascota(especie: especie, raza: raza, sexo: sexo, tamanio: tamanio, edad: edad, nombre: nombre, senias: senias)

		// Foto
		def foto = request.getFile('foto')

		// Comentario
		def comentario = command.comentario

		// Ubicacion
		def provincia = command.provincia
		def barrio = command.barrio
		def calles = command.calles
		Ubicacion ubicacion = new Ubicacion(provincia: provincia, barrio: barrio, calles: calles)

		// Fecha
		LocalDate fecha = command.fecha

		// Tipo de aviso
		TipoAviso tipoAviso = command.tipoDeAviso

		Usuario logeado = Usuario.get(1)

		EstadoAviso estado = EstadoAviso.PENDIENTE

		Aviso aviso = logeado.publicarAviso(mascota, fecha, ubicacion, tipoAviso, comentario, foto.bytes)
		aviso.save(failOnError: true)

		switch (tipoAviso){
			case TipoAviso.ENCONTRADO:
				redirect action: 'verEncontrado', id: aviso.id
				break

			case TipoAviso.PERDIDO:
				redirect action: 'verPerdido', id: aviso.id
				break
		}
	}

	def noExisteAviso(){
		// :p
		render "Error 404: aviso not found"
	}

	def verPerdido(Long id){
		def aviso = Aviso.get(id)

		if (!aviso || aviso.tipoAviso == TipoAviso.ENCONTRADO){
			redirect action: 'noExisteAviso'
		}
		else{
			List coincidencias1 = coincidenciasService.buscarCoincidencias(aviso)
			List coincidencias = coincidencias1.sort{it.fecha}
			Map modelo = ['aviso': aviso, 'coincidencias': coincidencias.reverse()]
		}
	}

	def verEncontrado(Long id){
		def aviso = Aviso.get(id)

		if (!aviso || aviso.tipoAviso == TipoAviso.PERDIDO){
			redirect action: 'noExisteAviso'
		}
		else{
			// Servicio buscar coincidencias
			List coincidencias1 = coincidenciasService.buscarCoincidencias(aviso)

			// Servicio enviar notificaciones
			notificacionesService.enviarNotificaciones(aviso, coincidencias1)

			List coincidencias = coincidencias1.sort{ it.fecha }
			Map modelo = ['aviso': aviso, 'coincidencias': coincidencias.reverse()]
		}
	}

	// Recibo un valor para determinar el orden de aparicion de los avisos segun requiere el usuario
	def mascotasPerdidas(Long valor) {
		List perdidas = Aviso.findAllByTipoAviso(TipoAviso.PERDIDO)
		if (valor == 1){ Map modelo = ['perdidas': perdidas.sort{ it.mascota.especie }] }
		else if (valor == 2){ Map modelo = ['perdidas': perdidas.sort{ it.mascota.raza }] }
		else if (valor == 3){ Map modelo = ['perdidas': perdidas.sort{ it.mascota.sexo }] }
		else if (valor == 4){ Map modelo = ['perdidas': perdidas.sort{ it.mascota.tamanio }] }
		else if (valor == 5){ Map modelo = ['perdidas': perdidas.sort{ it.mascota.nombre }] }
		else if (valor == 6){ Map modelo = ['perdidas': perdidas.sort{ it.mascota.edad }] }
		else if (valor == 7){ Map modelo = ['perdidas': perdidas.sort{ it.ubicacion.provincia }] }
		else if (valor == 8){ Map modelo = ['perdidas': perdidas.sort{ it.fecha }] } // aparece primero la fecha mas antigua
		else {
			// Por defecto muestro los avisos ordenados por fecha de evento, primero el mas reciente
			perdidas = perdidas.sort{ it.fecha }
			List perdidas_reversa = perdidas.reverse()
			Map modelo = ['perdidas': perdidas_reversa]
		}
	}

	// Recibo un valor para determinar el orden de aparicion de los avisos segun requiere el usuario
	def mascotasEncontradas(Long valor) {
		List encontradas = Aviso.findAllByTipoAviso(TipoAviso.ENCONTRADO)
		if (valor == 1){ Map modelo = ['encontradas': encontradas.sort{ it.mascota.especie }] }
		else if (valor == 2){ Map modelo = ['encontradas': encontradas.sort{ it.mascota.raza }] }
		else if (valor == 3){ Map modelo = ['encontradas': encontradas.sort{ it.mascota.sexo }] }
		else if (valor == 4){ Map modelo = ['encontradas': encontradas.sort{ it.mascota.tamanio }] }
		else if (valor == 5){ Map modelo = ['encontradas': encontradas.sort{ it.ubicacion.provincia }] }
		else if (valor == 6){ Map modelo = ['encontradas': encontradas.sort{ it.fecha }] } // aparece primero la fecha mas antigua
		else {
			// Por defecto muestro los avisos ordenados por fecha de evento, primero el mas reciente
			encontradas = encontradas.sort{ it.fecha }
			List encontradas_reversa = encontradas.reverse()
			Map modelo = ['encontradas': encontradas_reversa]
		}
	}

	def fotoAviso(Long id) {
		Aviso aviso = Aviso.get(id)
		response.outputStream << aviso.foto
	}

	def verAvisoEncontrado(Long id){
		Aviso aviso = Aviso.get(id)
		Map modelo = ['aviso': aviso]
	}

	def verAvisoPerdido(Long id){
		Aviso aviso = Aviso.get(id)
		Map modelo = ['aviso': aviso]
	}

    def getRazas(){
    	def mascota = new Mascota()
    	def listaRazas = mascota.razas(params.especie)
    	if (listaRazas != null){
			render (template: "elegirRazas", model: [listaRazas: listaRazas])    		
    	}
    }

    def getBarrios(){
    	def ubicacion = new Ubicacion()
    	def listaBarrios = ubicacion.barrios(params.provincia)
		render (template: "elegirBarrios", model: [listaBarrios: listaBarrios, provincia: params.provincia])    		
    }
}
