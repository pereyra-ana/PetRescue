<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
	</head>
	<body>
		<div align="center">
		<h2 align="center"> <strong> Mascotas perdidas </strong> </h2><br>
		
		<g:if test="${perdidas.size() == 0}">
			Aún no se han reportado mascotas perdidas.
		</g:if>

		<g:if test="${perdidas.size() != 0}">
			<table>
					<tr>
						<td><div align="left"><strong> Imagen </strong></td></div>
						<td><div align="center"> <strong> Especie </strong> <a href="${createLink(action:'mascotasPerdidas', params:[perdidas: perdidas, valor: 1])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Raza </strong> <a href="${createLink(action:'mascotasPerdidas', params:[perdidas: perdidas, valor: 2])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Sexo </strong> <a href="${createLink(action:'mascotasPerdidas', params:[perdidas: perdidas, valor: 3])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Tamaño </strong> <a href="${createLink(action:'mascotasPerdidas', params:[perdidas: perdidas, valor: 4])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Nombre </strong> <a href="${createLink(action:'mascotasPerdidas', params:[perdidas: perdidas, valor: 5])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Edad </strong> <a href="${createLink(action:'mascotasPerdidas', params:[perdidas: perdidas, valor: 6])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Provincia </strong> <a href="${createLink(action:'mascotasPerdidas', params:[perdidas: perdidas, valor: 7])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Fecha </strong> <a href="${createLink(action:'mascotasPerdidas', params:[perdidas: perdidas, valor: 8])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></td>
					</tr>

				
				<g:each in="${perdidas}" var="aviso">
					<tr>
						<td><img src="${createLink(action: 'fotoAviso', id: aviso.id)}" class="fotoMascotaSmall"> <br><br></td>
						<td><div align="center">${aviso.mascota.especie} </td></div>
						<td><div align="center">${aviso.mascota.raza} </td></div>
						<td><div align="center">${aviso.mascota.sexo} </td></div>
						<td><div align="center">${aviso.mascota.tamanio} </td></div>
						<td><div align="center">${aviso.mascota.nombre} </td></div>
						<td><div align="center">${aviso.mascota.edad} </td></div>
						<td><div align="center">${aviso.ubicacion.provincia} </td></div>
						<td><div align="center">${aviso.fecha} </td>
						<td><a href="${createLink(action:'verAvisoPerdido', id:aviso.id, controller:publicacion)}" class="btn btn-primary btn-xs"> Ver más </a></td>
					</tr>
				</g:each>
			</table>
		</g:if>
		</div>
	</body>
</html>