package petrescue

import grails.transaction.Transactional

@Transactional
class NotificacionesService {

    def enviarNotificaciones(Aviso aviso, List coincidencias){
    	// Para cada coincidencia, envio el aviso al publicador para que cree la notificacion
    	coincidencias.each {
			Notificacion notificacion = it.publicador.agregarNotificacion(aviso)
			notificacion.save(failOnError:true)
		}
		return
    }
}
