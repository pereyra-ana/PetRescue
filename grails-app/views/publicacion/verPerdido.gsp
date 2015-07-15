<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>

		<style>
 
		.center{
		   border: 1px solid black;
		   width: 500px;
		   margin: 0 auto;
		}
		 
		</style>

	</head>
	<body>
		<div align="center">
			<h2 align="center"> <strong> SE BUSCA MASCOTA </strong> </h2><br>

			<img src="${createLink(action: 'fotoAviso', id: aviso.id)}" class="fotoMascota"> <br><br>

			${aviso.tipoAviso} <br/>
			${aviso.mascota.nombre} se perdió el día ${aviso.fecha} en el barrio de ${aviso.ubicacion.barrio} (${aviso.ubicacion.provincia}). <br>
			Es un ${aviso.mascota.especie} ${aviso.mascota.sexo} de raza ${aviso.mascota.raza}, tamaño ${aviso.mascota.tamanio} y tiene ${aviso.mascota.edad} año(s) de edad. <br><br>
			
			<g:if test="${aviso.mascota.senias}">
				Señas particulares: ${aviso.mascota.senias}<br>
			</g:if>
			<g:if test="${aviso.comentario}">
				Comentario: ${aviso.comentario}
			</g:if>
		</div>

		<h2 align="center"> <strong> Coincidencias encontradas: </strong> </h2><br>
			<div align="center">
			<g:if test="${coincidencias.size() == 0}">
				No se han encontrado coincidencias.
			</g:if>

			<g:if test="${coincidencias.size() != 0}">
			<table>
					<tr>
						<td><div align="left"><strong> Imagen </strong></td></div>
						<td><div align="center"> <strong> Especie </strong></div>
						<td><div align="center"> <strong> Raza </strong></div>
						<td><div align="center"> <strong> Sexo </strong></div>
						<td><div align="center"> <strong> Tamaño </strong></div>
						<td><div align="center"> <strong> Provincia </strong></div>
						<td><div align="center"> <strong> Fecha </atrong></td>
					</tr>

				
				<g:each in="${coincidencias}" var="aviso">
					<tr>
						<td><img src="${createLink(action: 'fotoAviso', id: aviso.id)}" width="75"><br><br></td>
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
