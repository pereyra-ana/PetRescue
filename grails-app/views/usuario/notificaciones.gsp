<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
	</head>
	<body>
		<div align="center">
		<h2 align="center"> <strong> Notificaciones </strong> </h2><br>

		<div class="well"> Si publicaste una mascota perdida, aquí aparecerán los avisos publicados de mascotas encontradas que coinciden. </div><br>

		<g:if test="${notificaciones.size() == 0}">
			No se han encontrado coincidencias hasta el momento.
		</g:if>
		<g:if test="${notificaciones.size() != 0}">

			<table>
					<tr>
						<td><div align="center"><strong> Visto </strong></td><div>
						<td><div align="center"><strong> Imagen </strong></td></div>
						<td><div align="center"> <strong> Especie </strong></div>
						<td><div align="center"> <strong> Raza </strong></div>
						<td><div align="center"> <strong> Sexo </strong></div>
						<td><div align="center"> <strong> Tamaño </strong></div>
						<td><div align="center"> <strong> Provincia </strong></div>
						<td><div align="center"> <strong> Fecha </atrong></td>
					</tr>

				<g:each in="${notificaciones}" var="notificacion">
					<tr>
						<td><div align="center">
							<g:if test="${"${notificacion.estado}" == 'NOLEIDO'}">
								<a href="${createLink(controller:'usuario', action:'marcarComoLeido', params:[id:notificacion.id, notificacion:'notificacion'])}"> <img src="${assetPath(src: 'openenv.png')}" alt="Marcar como visto"/> </a>
							</g:if>
							<g:if test="${"${notificacion.estado}" == 'LEIDO'}">
								<img src="${assetPath(src: 'openenv2.png')}" alt="Visto">
							</g:if>
								 </td><div>
						<td><div align="center"><img src="${createLink(action:'fotoAviso', controller:'publicacion', id:notificacion.aviso.id)}" class="fotoMascotaSmall"> <br><br></td></div>
						<td><div align="center">${notificacion.aviso.mascota.especie} </td></div>
						<td><div align="center">${notificacion.aviso.mascota.raza} </td></div>
						<td><div align="center">${notificacion.aviso.mascota.sexo} </td></div>
						<td><div align="center">${notificacion.aviso.mascota.tamanio} </td></div>
						<td><div align="center">${notificacion.aviso.ubicacion.provincia} </td></div>
						<td><div align="center">${notificacion.aviso.fecha} </td>
						<td><div align="center">${notificacion.aviso.tipoAviso} </td>
						<td><a href="${createLink(action:'verAvisoEncontrado', id:notificacion.aviso.id, controller:'publicacion')}" class="btn btn-primary btn-xs"> Ver más </a></td>
					</tr>
				</g:each>
			</table>
		</g:if>

		</div>

	</body>
</html>

