package petrescue
import org.joda.time.*
import seminario.*

class HojaDeContacto {
	String nombre, apellido, telefono, email

	static constraints = {
		nombre nullable: false, blank: false
		apellido nullable: false, blank: false
		telefono nullable: true, blank: true
		email nullable: false, blank: false, email: true
	}
}

class Usuario {

	String apodo
	String contrasenia
	HojaDeContacto hojaDeContacto
	Set<Aviso> avisos = []
	Set<Notificacion> notificaciones = []

	static hasMany = [avisos: Aviso, notificaciones: Notificacion]
	
	static embedded = ['hojaDeContacto']

	static constraints = {
		apodo nullable: false, blank: false, unique: true
		contrasenia nullable: false, blank: false
		hojaDeContacto nullable: false
	}

	Usuario(String apodo, String contrasenia, HojaDeContacto hojaDeContacto) {
		if (apodo == null || apodo.trim() == '') {
			throw new IllegalArgumentException("Nombre de usuario incorrecto")
		}

		this.apodo = apodo
		this.contrasenia = contrasenia
		this.hojaDeContacto = hojaDeContacto
	}

	def publicarAviso(Mascota mascota, LocalDate fecha, Ubicacion ubicacion, TipoAviso tipoAviso, String comentario, byte[] foto) {
		Aviso aviso = new Aviso(this, mascota, fecha, ubicacion, tipoAviso, comentario, foto)
		this.avisos << aviso
		aviso
	}

	def agregarNotificacion(Aviso aviso){
		Notificacion notificacion = new Notificacion(this, aviso)
		this.notificaciones << notificacion
		notificacion
	}

	def cambiarContrasenia(String contraseniaActual, String nuevaContrasenia){
		if (contraseniaActual != this.contrasenia) {
			throw new ContraseniaIncorrectaException()
		}
		else {
			this.contrasenia = nuevaContrasenia
		}
	}

	def cambiarHojaDeContacto(HojaDeContacto nuevaHojaDeContacto){
		this.hojaDeContacto = nuevaHojaDeContacto
	}
}
