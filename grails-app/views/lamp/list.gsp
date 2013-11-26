
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
					
						<g:sortableColumn property="port" title="${message(code: 'lamp.port.label', default: 'Port')}" />
					
						<g:sortableColumn property="typeInOrOut" title="${message(code: 'lamp.typeInOrOut.label', default: 'Type In Or Out')}" />
					
						<g:sortableColumn property="typeAnalogOrDigital" title="${message(code: 'lamp.typeAnalogOrDigital.label', default: 'Type Analog Or Digital')}" />
					
						<g:sortableColumn property="isPwn" title="${message(code: 'lamp.isPwn.label', default: 'Is Pwn')}" />
                                                
                                                <g:sortableColumn property="status" title="${message(code: 'lamp.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lampInstanceList}" status="i" var="lampInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>
                                                    <g:link action="show" id="${lampInstance.id}">${fieldValue(bean: lampInstance, field: "name")}</g:link>
                                                </td>
					
						<td>
                                                    ${fieldValue(bean: lampInstance, field: "description")}
                                                </td>
					
						<td>
                                                    ${fieldValue(bean: lampInstance, field: "port")}
                                                </td>
					
						<td>
                                                    ${fieldValue(bean: lampInstance, field: "typeInOrOut")}
                                                </td>
					
						<td>
                                                    ${fieldValue(bean: lampInstance, field: "typeAnalogOrDigital")}
                                                </td>
					
						<td>
                                                    <g:formatBoolean boolean="${lampInstance.isPwn}" />
                                                </td>
					
                                                <td>
                                                    <g:if test="${lampInstance.status}">
                                                        <button type="button" class="btn btn-small btn-default" disabled="disabled">Ligada</button>
                                                        <g:link action="status" id="${lampInstance.id}" class="btn btn-small btn-danger">Desligar</g:link>                                                           
                                                    </g:if>
                                                    <g:else>                              
                                                        <button type="button" class="btn btn-small btn-default" disabled="disabled">Desligada</button> 
                                                        <g:link action="status" id="${lampInstance.id}" class="btn btn-small btn-success">Ligar</g:link>    
                                                    </g:else>  
                                                </td>
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
