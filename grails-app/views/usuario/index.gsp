<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
	</head>
	<body>
		<h1 align="center"> <strong> Registro de usuario </strong> </h1> <br>
	
		<g:if test="${command}">
			<g:hasErrors bean="${command}">
				<div class="alert alert-error slide_down_on_show">
					<strong>Han ocurrido los siguientes errores:</strong>
					<ul>
						<g:eachError bean="${command}" var="error">
							<li><g:message error="${error}" /></li>
						</g:eachError>
					</ul>
				</div>
			</g:hasErrors>
		</g:if>

		<g:form action="crearUsuario">

			<table>
				<tr>
					<td>
						<strong>Datos de registro</strong>
						<!--Usuario-->
						<br>
						Apodo: <br>
						<g:textField name="apodo" value="${command.apodo}"/> <br>
						Contraseña: <br>
						<g:passwordField name="contrasenia" /> <br>
						<br>
						<strong>Hoja de contacto</strong> <br>
						<!--HojaDeContacto-->
						Nombre: <br>
						<g:textField name="nombre" value="${command.nombre}"/> <br>
						Apellido: <br>
						<g:textField name="apellido" value="${command.apellido}"/> <br>
						Teléfono: <br>
						<g:textField name="telefono" value="${command.telefono}"/> <br>
						Email: <br>
						<g:textField name="email" value="${command.email}"/> <br/>
					</td>
				</tr>
			</table>
			<div align="center"> <br>
				<input type="submit" value="Registrarse" />
			</div>
		</g:form>
	</body>
</html>
