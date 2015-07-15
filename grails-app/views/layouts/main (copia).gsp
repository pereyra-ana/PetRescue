<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'huella.ico')}" type="image/x-icon">
		<link rel="gatito1" href="${assetPath(src: 'gatito.png')}">
		<link rel="gatito1" sizes="114x114" href="${assetPath(src: 'gatito.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
	
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="http://localhost:8080/Seminario"> <strong> PetRescue </strong> </a>
	    </div>

	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
            <li><a href="http://www.asociacioncanina.org.ar/index2.htm"> Razas de perro en Argentina </a></li>
            <li><a href="http://www.asociacion-felina-argentina.com/2standards.html"> Razas de gato en Argentina </a></li>
	      </ul>

	      <ul class="nav navbar-nav navbar-right">
	        <li><g:link action="iniciarSesion" controller="usuario"> Iniciar Sesión </g:link></li>
	        <li><g:link action="index" controller="usuario" > Registrarse </g:link></li>
	      </ul>
	    </div>
	  </div>
	</nav>

		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
