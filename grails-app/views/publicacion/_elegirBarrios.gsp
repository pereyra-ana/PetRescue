<g:setProvider library="jquery"/>
	
	<g:if test="${provincia == 'Capital Federal'}"> Barrio*: </g:if>
	<g:else> Partido*: </g:else>

	<g:if test="${listaBarrios == null}">
		<g:textField name="barrio"/>
	</g:if>
	<g:else>
		<g:select name="barrio" from="${listaBarrios}" noSelection="['':'------']"/>
	</g:else>
