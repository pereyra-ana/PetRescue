<!DOCTYPE html>
 <html>
 	<head>
 		<meta name="layout" content="main"/>
 		<title>Pet Rescue</title>
 	</head>
 	<body>
 		<h1 align="center"> <strong> Cambiar contraseña </strong> </h1>

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
 		<g:form action="modificarContrasenia" id="1">
 						<!--Cambiar contraseña-->
 						Contraseña actual: <br>
 						<g:textField name="contraseniaActual" /> <br>
 						Nueva contaseña: <br>
						<g:passwordField name="nuevaContrasenia" /> <br>
 						Confirmar contraseña: <br>
						<g:passwordField name="nuevaContrasenia2" /> <br>

 				<input type="submit" class="btn btn-success" value="Enviar" />
 		</g:form>
 	</div>
 	</body>
 </html>
