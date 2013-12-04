
<%@ page import="arduinocontrol.Lamp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lamp.label', default: 'Lamp')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lamp" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lamp" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'lamp.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'lamp.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="pin" title="${message(code: 'lamp.pin.label', default: 'Pin')}" />
					
						<g:sortableColumn property="paramsArduino" title="${message(code: 'lamp.paramsArduino.label', default: 'Params Arduino')}" />
					
						<g:sortableColumn property="typeInOrOut" title="${message(code: 'lamp.typeInOrOut.label', default: 'Type In Or Out')}" />
					
						<g:sortableColumn property="typeAnalogOrDigital" title="${message(code: 'lamp.typeAnalogOrDigital.label', default: 'Type Analog Or Digital')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lampInstanceList}" status="i" var="lampInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lampInstance.id}">${fieldValue(bean: lampInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: lampInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: lampInstance, field: "pin")}</td>
					
						<td>${fieldValue(bean: lampInstance, field: "paramsArduino")}</td>
					
						<td>${fieldValue(bean: lampInstance, field: "typeInOrOut")}</td>
					
						<td>${fieldValue(bean: lampInstance, field: "typeAnalogOrDigital")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lampInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
