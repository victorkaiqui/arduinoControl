
<%@ page import="arduinocontrol.Lamp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lamp.label', default: 'Lamp')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lamp" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lamp" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lamp">
			
				<g:if test="${lampInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="lamp.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${lampInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="lamp.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${lampInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.pin}">
				<li class="fieldcontain">
					<span id="pin-label" class="property-label"><g:message code="lamp.pin.label" default="Pin" /></span>
					
						<span class="property-value" aria-labelledby="pin-label"><g:fieldValue bean="${lampInstance}" field="pin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.paramsArduino}">
				<li class="fieldcontain">
					<span id="paramsArduino-label" class="property-label"><g:message code="lamp.paramsArduino.label" default="Params Arduino" /></span>
					
						<span class="property-value" aria-labelledby="paramsArduino-label"><g:fieldValue bean="${lampInstance}" field="paramsArduino"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.typeInOrOut}">
				<li class="fieldcontain">
					<span id="typeInOrOut-label" class="property-label"><g:message code="lamp.typeInOrOut.label" default="Type In Or Out" /></span>
					
						<span class="property-value" aria-labelledby="typeInOrOut-label"><g:fieldValue bean="${lampInstance}" field="typeInOrOut"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.typeAnalogOrDigital}">
				<li class="fieldcontain">
					<span id="typeAnalogOrDigital-label" class="property-label"><g:message code="lamp.typeAnalogOrDigital.label" default="Type Analog Or Digital" /></span>
					
						<span class="property-value" aria-labelledby="typeAnalogOrDigital-label"><g:fieldValue bean="${lampInstance}" field="typeAnalogOrDigital"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.isPwm}">
				<li class="fieldcontain">
					<span id="isPwm-label" class="property-label"><g:message code="lamp.isPwm.label" default="Is Pwm" /></span>
					
						<span class="property-value" aria-labelledby="isPwm-label"><g:formatBoolean boolean="${lampInstance?.isPwm}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.valuePwm}">
				<li class="fieldcontain">
					<span id="valuePwm-label" class="property-label"><g:message code="lamp.valuePwm.label" default="Value Pwm" /></span>
					
						<span class="property-value" aria-labelledby="valuePwm-label"><g:fieldValue bean="${lampInstance}" field="valuePwm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="lamp.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${lampInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.group}">
				<li class="fieldcontain">
					<span id="group-label" class="property-label"><g:message code="lamp.group.label" default="Group" /></span>
					
						<span class="property-value" aria-labelledby="group-label"><g:link controller="group" action="show" id="${lampInstance?.group?.id}">${lampInstance?.group?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="lamp.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${lampInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lampInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="lamp.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${lampInstance?.status}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${lampInstance?.id}" />
					<g:link class="edit" action="edit" id="${lampInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
