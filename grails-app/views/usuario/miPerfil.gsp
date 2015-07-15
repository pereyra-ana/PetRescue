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
		<h2 align="center"> <strong> Mi Perfil </strong> </h2>
		<div align="center">

		<g:if test="${"${params.cambio}" == '1'}">
				<div align="center" class="alert alert-dismissible alert-success">
				<button type="button" class="close" data-dismiss="alert">×</button>
					Perfil modificado con éxito.
			</div>
		</g:if>

		<g:if test="${"${params.cambio}" == '2' }">
				<div align="center" class="alert alert-dismissible alert-success">
				<button type="button" class="close" data-dismiss="alert">×</button>
					Contraseña modificada con éxito.
			</div>
		</g:if>
		
		<div id="status">
					<!--Usuario-->
					Usuario: ${logeado.apodo} <br>

					<!--HojaDeContacto-->
					Nombre: ${logeado.hojaDeContacto.nombre} <br>
					Apellido: ${logeado.hojaDeContacto.apellido} <br>
					Teléfono: ${logeado.hojaDeContacto.telefono} <br>
					Email: ${logeado.hojaDeContacto.email} <br>
					<br>
					Cantidad de avisos: ${logeado.avisos.size()}<br>

		</div><br>

		<div align="center">
			<a href="${createLink(controller:'usuario', action:'editarPerfil', params:[id:1, cambio:1])}" class="btn btn-info"> Modificar Perfil </a>
			<a href="${createLink(controller:'usuario', action:'editarContrasenia', params:[id:1, cambio:2])}" class="btn btn-info"> Modificar Contraseña </a>
			</div>
		</div>
	</body>
</html>
