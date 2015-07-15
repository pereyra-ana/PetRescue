<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
	</head>
	<body>
		<div align="center">
		<h2 align="center"> <strong> Avisos publicados </strong> </h2><br>

		<div class="well"> No olvides marcar como finalizada una publicación luego de concretar la búsqueda. </div><br>

		<g:if test="${avisos.size() == 0}">
			Aún no se han publicado avisos.
		</g:if>
		<g:if test="${avisos.size() != 0}">

			<table>
					<tr>
						<td><div align="left"><strong> Imagen </strong></td></div>
						<td><div align="center"> <strong> Especie </strong></div>
						<td><div align="center"> <strong> Raza </strong></div>
						<td><div align="center"> <strong> Sexo </strong></div>
						<td><div align="center"> <strong> Tamaño </strong></div>
						<td><div align="center"> <strong> Nombre </strong></div>
						<td><div align="center"> <strong> Edad </strong></div>
						<td><div align="center"> <strong> Provincia </strong></div>
						<td><div align="center"> <strong> Fecha </atrong></td>
						<td><div align="center"> <strong> Tipo de aviso </strong></td>
						<td><div align="center"> <strong> Estado </strong></td>
					</tr>

				<g:each in="${avisos}" var="aviso">
					<tr>
						<td><img src="${createLink(action: 'fotoAviso', controller:'publicacion', id: aviso.id)}" class="fotoMascotaSmall"> <br><br></td>
						<td><div align="center">${aviso.mascota.especie} </td></div>
						<td><div align="center">${aviso.mascota.raza} </td></div>
						<td><div align="center">${aviso.mascota.sexo} </td></div>

						<td><div align="center">${aviso.mascota.tamanio} </td></div>

						<td><div align="center">
							<g:if test="${"${aviso.tipoAviso}" == 'ENCONTRADO'}">  -  </g:if>
							<g:if test="${"${aviso.tipoAviso}" == 'PERDIDO'}">  ${aviso.mascota.nombre} </g:if>
						</td></div>

						<td><div align="center">
							<g:if test="${"${aviso.tipoAviso}" == 'ENCONTRADO'}">  -  </g:if>
							<g:if test="${"${aviso.tipoAviso}" == 'PERDIDO'}">  ${aviso.mascota.edad} </g:if>
						</td></div>

						<td><div align="center">${aviso.ubicacion.provincia} </td></div>
						<td><div align="center">${aviso.fecha} </td>
						<td><div align="center">${aviso.tipoAviso} </td>

						<td><div align="center"> 
							<g:if test="${"${aviso.estadoAviso}" == 'PENDIENTE'}">
								<div style="color:orange"><strong> ${aviso.estadoAviso} </strong></div>						
							</g:if>
							<g:if test="${"${aviso.estadoAviso}" == 'FINALIZADO'}">
								<div style="color:#0F9C77"><strong> ${aviso.estadoAviso} </strong> </div>
							</g:if>

						<td> <a href="${createLink(controller:'usuario', action:'modificarEstadoAviso', params:[aviso:aviso, id:aviso.id])}" class="btn btn-primary btn-xs"> Modificar <br> estado </a> </td>
					</tr>
				</g:each>
			</table>
		</g:if>

		</div>

	</body>
</html>

