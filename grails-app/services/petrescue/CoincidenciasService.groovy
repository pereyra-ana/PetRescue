package petrescue

import grails.transaction.Transactional

@Transactional
class CoincidenciasService {

	def buscarCoincidencias(Aviso aviso){
		List coincidencias

		if (aviso.mascota.raza == 'indeterminada'){
			// Cualquier raza
			coincidencias = Aviso.withCriteria {
				eq('tipoAviso', aviso.tipoAvisoOpuesto())
				eq('especie', aviso.mascota.especie)
				eq('sexo', aviso.mascota.sexo)
				eq('provincia', aviso.ubicacion.provincia)
				// Solo muestra publicaciones pendientes
				eq('estadoAviso', aviso.estadoAviso.PENDIENTE)

				// Si tipoAviso es encontrado -> la fecha del perdido tiene que ser menor o igual a la del encontrado
				if (aviso.tipoAviso == aviso.tipoAviso.ENCONTRADO){
					le('fecha', aviso.fecha)
				}

				// Si tipoAviso es perdido -> la fecha del encontrado tiene que ser meyor o igual que la del perdido
				if (aviso.tipoAviso == aviso.tipoAviso.PERDIDO){
					ge('fecha', aviso.fecha)
				}
			}
		}

		else {
			// Su raza o indeterminada
			coincidencias = Aviso.withCriteria {
				eq('tipoAviso', aviso.tipoAvisoOpuesto())
				eq('especie', aviso.mascota.especie)
				or{
					eq('raza', aviso.mascota.raza)
					eq('raza', 'indeterminada')
				}
				eq('sexo', aviso.mascota.sexo)
				eq('provincia', aviso.ubicacion.provincia)
				// Solo muestra publicaciones pendientes
				eq('estadoAviso', aviso.estadoAviso.PENDIENTE)

				// Si tipoAviso es encontrado -> la fecha del perdido tiene que ser menor o igual a la del encontrado
				if (aviso.tipoAviso == aviso.tipoAviso.ENCONTRADO){
					le('fecha', aviso.fecha)
				}

				// Si tipoAviso es perdido -> la fecha del encontrado tiene que ser meyor o igual que la del perdido
				if (aviso.tipoAviso == aviso.tipoAviso.PERDIDO){
					ge('fecha', aviso.fecha)
				}
			}
		}
		return coincidencias
	}
}
