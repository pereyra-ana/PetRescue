package petrescue

import grails.transaction.Transactional

@Transactional
class EditarContraseniaService {

    def cambiarContrasenia(Usuario logeado, ModificarContraseniaCommand command) {
    	logeado.cambiarContrasenia(command.contraseniaActual, command.nuevaContrasenia)
    }
}
