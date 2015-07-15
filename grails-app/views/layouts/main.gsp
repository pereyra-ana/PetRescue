<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'blackpaw.png')}" type="image/x-icon">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>

		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

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
	      <a class="navbar-brand"> <strong> PetRescue </strong> </a>
	    </div>

	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<li><a href="http://localhost:8080/PetRescue"> Home </a></li>
	      	<li class="dropdown">
	          	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> Ayuda <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="http://www.asociacioncanina.org.ar/index2.htm" target="_blank"> Razas de perro </a></li>
	            <li><a href="http://www.asociacion-felina-argentina.com/2standards.html" target="_blank"> Razas de gato </a></li>
	            <li class="divider"></li>
	            <li><g:link action="recomendaciones" controller="usuario"> Recomendaciones </g:link></li>
	            <li><g:link action="quienesSomos" controller="usuario"> Contacto </g:link></li>
	          </ul>
        	</li>
	      </ul>

	      <ul class="nav navbar-nav navbar-right">
	      	<li class="dropdown">
          	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> Mi usuario <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(controller:'usuario', action:'miPerfil', params:[id:1, cambio:0])}"> Mi Perfil </a></li>
            <li><g:link action="verAvisos" controller="usuario" id="1"> Mis Avisos </g:link></li>
           	<li class="divider"></li>
	       	<li><g:link action="notificaciones" controller="usuario" id="1"> Notificaciones </g:link></li>
          </ul>
        </li>
	      </ul>
	    </div>
	  </div>  
	</nav>

		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
