package petrescue
import grails.transaction.Transactional

class UsuarioCommand {
    String apodo, contrasenia
    String nombre, apellido, telefono, email

    static constraints = {
        apodo nullable: false, blank: false, unique: true
        contrasenia nullable: false, blank: false
        nombre nullable: false, blank: false
        apellido nullable: false, blank: false
        telefono nullable: true, blank: true
        email nullable: false, blank: false, email: true
    }
}

class ModificarUsuarioCommand {
    String nombre, apellido, telefono, email

    static constraints = {
        nombre nullable: false, blank: false
        apellido nullable: false, blank: false
        telefono nullable: true, blank: true
        email nullable: false, blank: false, email: true
    }
}

class ModificarContraseniaCommand {
    String contraseniaActual, nuevaContrasenia, nuevaContrasenia2

    static constraints = {
        contraseniaActual nullable:false, blank: false
        nuevaContrasenia nullable: false, blank: false
        nuevaContrasenia2 nullable: false, blank: false, validator: { value, command ->
            if (value != command.nuevaContrasenia) {
                return "contraseniasNoCoinciden"
          } 
        }
    }
}

class ContraseniaIncorrectaException extends Exception{}


class UsuarioController {
    def editarPerfilService
    def editarContraseniaService

    def index() {
        [command: new UsuarioCommand()]
    }

    def crearUsuario(UsuarioCommand command){
        if (command.hasErrors()) {
            render view: "index", model: [command: command]
            return
        }
        
        def apodo = command.apodo
        def contrasenia = command.contrasenia

        def nombre = command.nombre
        def apellido = command.apellido
        def telefono = command.telefono
        def email = command.email

        HojaDeContacto hojaDeContacto = new HojaDeContacto(nombre: nombre, apellido: apellido, telefono: telefono, email: email)
        Usuario nuevoUsuario = new Usuario(apodo, contrasenia, hojaDeContacto)
        nuevoUsuario.save(failOnError: true)

        redirect action: 'miPerfil', id: nuevoUsuario.id
    }

    def miPerfil(Long id, Long cambio){
        // Le paso un numero que corresponde a un cambio para poder mostrar en la vista si hubo modificaciones.
        Usuario logeado = Usuario.get(id)
        if (!logeado){
            // :p
            render "Error 404: usuario  not found"
        }
        Map modelo = ['logeado': logeado, 'cambio': cambio]
    }

    def verAvisos(Long id){
        Usuario logeado = Usuario.get(id)
        Map modelo = ['logeado': logeado, 'avisos': logeado.avisos.sort{ it.id }]
        // Muestra avisos en el orden en que fueron publicados, primero el primero.
    }

    def notificaciones(Long id){
        Usuario logeado = Usuario.get(id)
        // Me gustaria que ordene por  no leidos primero y por fecha.
        // Actualmente ordena por fecha, el mas reciente primero.
        List notificaciones1 = logeado.notificaciones.sort{ it.aviso.fecha }
        Map modelo = ['logeado': logeado, 'notificaciones': notificaciones1.reverse()]
    }

    def editarPerfil(Long id){
        Usuario logeado = Usuario.get(id)
        Map modelo = ['logeado': logeado]
    }

    @Transactional
    def modificarPerfil(Long id, ModificarUsuarioCommand command){
        Usuario logeado = Usuario.get(id)

        if (command.hasErrors()){
            render view: 'editarPerfil', model: [logeado: logeado, command: command]
            return
        }

        // Servicio para aplicar cambios a perfil
        editarPerfilService.modificarPerfil(logeado, command)

        redirect action: 'miPerfil', params:['id': id, 'cambio': 1]
    }

    def editarContrasenia(Long id){
        Usuario logeado = Usuario.get(id)
        Map modelo = ['logeado': logeado]
    }

    @Transactional
    def modificarContrasenia(Long id, ModificarContraseniaCommand command){
        Usuario logeado = Usuario.get(id)

        if (command.hasErrors()){
            render view: 'editarContrasenia', model: [logeado: logeado, command: command]
            return
        }

        try {
            // Servicio
            editarContraseniaService.cambiarContrasenia(logeado, command)
            redirect action: 'miPerfil', params:['id': id, 'cambio': 2]
        }
        catch (ContraseniaIncorrectaException e) {
            // Error de contraseña incorrecta
            command.errors.reject("doesnotmatch", "Contraseña incorrecta") // command.errors.reject("nombreDelError", "mensajeQueMuestro")
            render view: 'editarContrasenia', model: [logeado: logeado, command: command]
            return
        }
    }

    @Transactional
    def modificarEstadoAviso(Aviso aviso, Long id){
        aviso.modificarEstado()
        render view:'verAvisos', model: [avisos: aviso.publicador.avisos.sort{it.fecha}, id:aviso.publicador.id]
    }

    @Transactional
    def marcarComoLeido(Long id, Notificacion notificacion){
        notificacion.marcarComoLeido()

        render view:'notificaciones',
        model: [id: notificacion.receptor.id, notificaciones: notificacion.receptor.notificaciones.sort{ it.id}]
    }

    def recomendaciones(){}

    def quienesSomos() {}
}