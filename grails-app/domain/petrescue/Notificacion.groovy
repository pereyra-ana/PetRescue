package petrescue
import petrescue.*

enum EstadoNotificacion {
	LEIDO, NOLEIDO
}

class Notificacion{
	Aviso aviso
	EstadoNotificacion estado
	Usuario receptor

    Notificacion(Usuario receptor, Aviso aviso){
    	this.receptor = receptor
    	this.aviso = aviso
    	this.estado = EstadoNotificacion.NOLEIDO
    }

    def marcarComoLeido(){
    	if (this.estado == EstadoNotificacion.NOLEIDO){
    		this.estado = EstadoNotificacion.LEIDO
    	}
    }
}
