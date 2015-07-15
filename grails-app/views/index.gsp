<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
		<style>
			body {
			background-image: url("${assetPath(src: 'pawsbw45.jpg')}");
		}
		</style>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				/*border: .2em solid #eee;
  				border-color: #E0E0E0;*/
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
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

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
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


			<div id="status" role="complementary">
			<ul>
				<div align="center">
				<li> Si encontraste una mascota que pensás que tiene dueño o perdiste tu mascota, publicá tu aviso.<br>
					¡Llena el formulario y busca coincidencias!
				</li>
				</div>                 
			</ul>
		</div>

			<div id="page-body" role="main" align="center">
		<div class="jumbotron" align="center">
		  <h1> ¡Devolvé la alegría a una mascota! </h1>
		  <p>PetRescue te ayuda a reunirte con tu mascota o reunirla con su dueño en unos pocos pasos.
		  	<br>¡Hazlo ahora!</p>
		  <p><g:link action="index" class="btn btn-danger" controller="publicacion"> Publicar Aviso </g:link></p>
		</div>

		<div align="center">
			<table>
				<tr>
					<td>
						<div align="left">
							<g:link action="mascotasPerdidas" controller="publicacion" class="btn btn-primary btn-lg" valor="0"> Ver mascotas perdidas</g:link><br>
						</div>
					</td>
					<td>
						<div align="right">
							<g:link action="mascotasEncontradas" controller="publicacion" class="btn btn-primary btn-lg" valor="0"> Ver mascotas encontradas </g:link><br>
						</div>
					</td>
				</tr>
			</table>
	</body>
</html>
