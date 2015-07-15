<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
	</head>
	<body>
		<div align="center">
		<h2 align="center"> <strong> Mascotas encontradas </strong> </h2><br>

		<g:if test="${encontradas.size() == 0}">
			Aún no se han reportado mascotas encontradas.
		</g:if>

		<g:if test="${encontradas.size() != 0}">
			<table>
					<tr>
						<td><div align="left"><strong> Imagen </strong></td></div>
						<td><div align="center"> <strong> Especie </strong> <a href="${createLink(action:'mascotasEncontradas', params:[encontradas: encontradas, valor: 1])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Raza </strong> <a href="${createLink(action:'mascotasEncontradas', params:[encontradas: encontradas, valor: 2])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Sexo </strong> <a href="${createLink(action:'mascotasEncontradas', params:[encontradas: encontradas, valor: 3])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Tamaño </strong> <a href="${createLink(action:'mascotasEncontradas', params:[encontradas: encontradas, valor: 4])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Provincia </strong> <a href="${createLink(action:'mascotasEncontradas', params:[encontradas: encontradas, valor: 5])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></div>
						<td><div align="center"> <strong> Fecha </strong> <a href="${createLink(action:'mascotasEncontradas', params:[encontradas: encontradas, valor: 6])}"> <img src="${assetPath(src: 'sort.png')}"/> </a></td>
					</tr>
				
				<g:each in="${encontradas}" var="aviso">
					<tr>
						<td><img src="${createLink(action: 'fotoAviso', id: aviso.id)}" class="fotoMascotaSmall"> <br><br></td>
						<td><div align="center">${aviso.mascota.especie} </td></div>
						<td><div align="center">${aviso.mascota.raza} </td></div>
						<td><div align="center">${aviso.mascota.sexo} </td></div>
						<td><div align="center">${aviso.mascota.tamanio} </td></div>
						<td><div align="center">${aviso.ubicacion.provincia} </td></div>
						<td><div align="center">${aviso.fecha} </td>
						<td><a href="${createLink(action:'verAvisoEncontrado', id:aviso.id, controller:publicacion)}" class="btn btn-primary btn-xs"> Ver más </a></td>
					</tr>
				</g:each>
			</table>
		</g:if>
		</div>
	</body>
</html>