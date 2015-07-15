<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Pet Rescue</title>
		<g:javascript library="jquery" plugin="jquery"/>
	</head>
	<body>
		<h1 align="center"> <strong> Publicar aviso </strong> </h1>
		
		<g:if test="${command}">
			<g:hasErrors bean="${command}">
			<div align="center">
				<div class="alert alert-error slide_down_on_show">
						<div align="center" class="alert alert-dismissible alert-danger">
							<button type="button" class="close" data-dismiss="alert">×</button>
								Complete todos los campos obligatorios(*).
						</div>
				</div>
			</div>
			</g:hasErrors>
		</g:if>

			<g:form action="publicarAviso" enctype="multipart/form-data">
				<!--Mascota-->
				<div align="left">
				<table>
					<div align="center">
					<legend>Datos de la mascota</legend></div>
					<tr>
						<div align="center">
							Especie* :
							<g:select name="especie" from="['gato', 'perro']" value="${command.especie}"
							noSelection="['':'Seleccionar especie']"
							onChange="${remoteFunction(
								controller: 'publicacion',
								action: 'getRazas',
								params: '\'especie=\' + this.value',
								update: 'razas'
								)}"/><br>

							<div id="razas">
								<g:include controller="publicacion" action="getRazas"/>	
							</div>

							Sexo* :
							<g:select name="sexo" from="['macho', 'hembra']" value="${command.sexo}" noSelection="['':'Seleccionar sexo']"/><br>
							Tamaño* :
							<g:select name="tamanio" from="['chico', 'mediano','grande']" value="${command.tamanio}" noSelection="['':'Seleccionar tamaño']"/><br>
							Nombre: <g:textField name="nombre" value="${command.nombre}"/> <br/>
							Edad: <g:textField name="edad" value="${command.edad}"/>
							<h6> Si lo conoce, ingrese un número correspondiente a la edad en años de la mascota. </h6>
							Señas particulares: <g:textField name="senias" value="${command.senias}"/> <br>
						</div>
					</tr>
				</table>

				<table>
					<div align="center">
						<legend> Imagen y comentarios </legend></div>
						<tr>
							<div align="center">
							<!--Foto-->
							Foto*: <input type="file" name="foto">
							<h6> Por favor, agregue una imagen para mejorar la búsqueda. </h6>
							<!--Comentario-->
							Comentarios:<br>
							<textarea cols="40" rows="5" name="comentario" value="${command.comentario}"></textarea>
						</div>
						</tr>
					</div>
				</table>
			</div>

				<div align="center">
				<table>
					<div align="center">
					<legend>Datos del suceso</legend></div>
					<tr>
						<td align="center">
							<!--Ubicacion-->
							Provincia* :
							<g:select name="provincia" from="['Capital Federal',
								'GBA - Zona Norte', 'GBA - Zona Sur', 'GBA - Zona Oeste', 
								'Buenos Aires', 'Catamarca', 'Chaco',
								'Chubut', 'Córdoba', 'Corrientes',
								'Entre Rios', 'Formosa', 'Jujuy',
								'La Pampa', 'La Rioja', 'Mendoza',
								'Misiones', 'Neuquén', 'Río Negro',
								'Salta', 'San Juan', 'San Luis',
								'Santa Cruz', 'Santa Fe', 'Santiago del Estero',
								'Tierra del Fuego', 'Tucumán']"
								value="${command.provincia}" noSelection="['':'Seleccionar provincia']"
								onChange="${remoteFunction(
								controller: 'publicacion',
								action: 'getBarrios',
								params: '\'provincia=\' + this.value',
								update: 'barrios'
								)}"/><br>
							
							<div id="barrios">
								<g:include controller="publicacion" action="getBarrios"/>
							</div>


							Calles: <g:textField name="calles" value="${command.calles}"/> <br/>
							<!--Fecha-->
							Fecha:
							<g:datePicker name="fecha" value="${new Date()}" precision="day" relativeYears="[-2..0]"/>

							<!--Tipo de Aviso-->
							<h3> Tipo de aviso: <br></h3>
							<input type="radio" name="tipoDeAviso" value="PERDIDO"> Perdido
							<br>
							<input type="radio" name="tipoDeAviso" value="ENCONTRADO"> Encontrado
						</td>
					</tr>
				</table>
			</div>

			<div align="center">
				<input type="submit" class="btn btn-success" value="Enviar y buscar coincidencias" /> 
			</div>

			</g:form>

			<br>
	</body>
</html>