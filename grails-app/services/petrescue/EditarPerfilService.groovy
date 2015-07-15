package petrescue
import grails.transaction.Transactional

@Transactional
class EditarPerfilService {

    def modificarPerfil(Usuario logeado, ModificarUsuarioCommand command){
    	command.with{
            // Hoja de contacto es un value object, deberia ser inmutable.
            // Creo uno nuevo y lo agrego en lugar del anterior.
            HojaDeContacto nuevaHoja = new HojaDeContacto(nombre: nombre, apellido: apellido, telefono: telefono, email: email)
            logeado.cambiarHojaDeContacto(nuevaHoja)
        }
        return
    }
}
