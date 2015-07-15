<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 20em;
				/*-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;*/
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<h2 align="center"> <strong> Aviso </strong> </h2>

		<div align="center">
			<g:if test="${"${aviso.estadoAviso}" == 'FINALIZADO'}">
				<div class="well" style="color:#E74C3C"> <strong> Publicación finalizada </strong> </div>
			</g:if>

		<table>
			<tr><td>
				<img src="${createLink(action: 'fotoAviso', id: aviso.id)}" class="fotoMascotaMedium"> <br><br>
			</td>
			<td>
			<div align="left">
				Especie: ${aviso.mascota.especie} <br>
				Raza: ${aviso.mascota.raza}<br>	</td>

			<td>
			<div align="left">
				Sexo: ${aviso.mascota.sexo}<br>
				Tamaño: ${aviso.mascota.tamanio}
			</div>
			</td>
		
			<td>
			<div align="left">
				Provincia: ${aviso.ubicacion.provincia}<br>
				Barrio: ${aviso.ubicacion.barrio}<br>
				Fecha: ${aviso.fecha}
			</div>
			</td></tr>
		</table>

		<g:if test="${aviso.mascota.senias}">
				Señas particulares: ${aviso.mascota.senias}<br>
		</g:if>
		<g:if test="${aviso.comentario}">
				Comentario: ${aviso.comentario}
		</g:if>

			<div id="status" align="center">
		<strong>Aviso publicado por:</strong><br>
		Nombre: ${aviso.publicador.hojaDeContacto.nombre}<br>
		Apellido: ${aviso.publicador.hojaDeContacto.apellido}<br>
		e-mail: ${aviso.publicador.hojaDeContacto.email}<br>
		Telefono: ${aviso.publicador.hojaDeContacto.telefono}
			</div>
		</div>

	</div>
	</body>
</html>