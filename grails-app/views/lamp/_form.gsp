<%@ page import="arduinocontrol.Lamp" %>



<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="lamp.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${lampInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="lamp.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${lampInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'port', 'error')} required">
	<label for="port">
		<g:message code="lamp.port.label" default="Port" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="port" required="" value="${lampInstance?.port}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'typeInOrOut', 'error')} required">
	<label for="typeInOrOut">
		<g:message code="lamp.typeInOrOut.label" default="Type In Or Out" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="typeInOrOut" from="${arduinocontrol.Object$TypeInOrOut?.values()}" keys="${arduinocontrol.Object$TypeInOrOut.values()*.name()}" required="" value="${lampInstance?.typeInOrOut?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'typeAnalogOrDigital', 'error')} required">
	<label for="typeAnalogOrDigital">
		<g:message code="lamp.typeAnalogOrDigital.label" default="Type Analog Or Digital" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="typeAnalogOrDigital" from="${arduinocontrol.Object$TypeAnalogOrDigital?.values()}" keys="${arduinocontrol.Object$TypeAnalogOrDigital.values()*.name()}" required="" value="${lampInstance?.typeAnalogOrDigital?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'isPwn', 'error')} ">
	<label for="isPwn">
		<g:message code="lamp.isPwn.label" default="Is Pwn" />
		
	</label>
	<g:checkBox name="isPwn" value="${lampInstance?.isPwn}" />
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="lamp.status.label" default="Status" />
		
	</label>
	<g:checkBox name="status" value="${lampInstance?.status}" />
</div>

