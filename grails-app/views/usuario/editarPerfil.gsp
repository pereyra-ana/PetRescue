<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
	</head>
	<body>
		<h1 align="center"> <strong> Editar Perfil </strong> </h1>
	
		<g:if test="${command}">
			<g:hasErrors bean="${command}">
			<div align="center">
				<div class="alert alert-error slide_down_on_show">
					<g:eachError bean="${command}" var="error">
						<div align="center" class="alert alert-dismissible alert-danger">
							<button type="button" class="close" data-dismiss="alert">×</button>
								<g:message error="${error}" />
						</div>
					</g:eachError>
				</div>
			</div>
			</g:hasErrors>
		</g:if>

		<div align="center">
		<g:form action="modificarPerfil" id="1">
						Nombre:
						<g:textField name="nombre" value="${logeado.hojaDeContacto.nombre}"/> <br>
						Apellido:
						<g:textField name="apellido" value="${logeado.hojaDeContacto.apellido}"/> <br>
						Teléfono:
						<g:textField name="telefono" value="${logeado.hojaDeContacto.telefono}"/> <br>
						Email:
						<g:textField name="email" value="${logeado.hojaDeContacto.email}"/><br>
						
				<input type="submit" class="btn btn-success" value="Enviar" />
		</g:form>
	</div>	
	</body>

