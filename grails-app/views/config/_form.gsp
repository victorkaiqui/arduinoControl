<%@ page import="arduinocontrol.Config" %>



<div class="fieldcontain ${hasErrors(bean: configInstance, field: 'port', 'error')} required">
	<label for="port">
		<g:message code="config.port.label" default="Port" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="port" required="" value="${configInstance?.port}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: configInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="config.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="rate" from="${arduinocontrol.Config$DataRate?.values()}" keys="${arduinocontrol.Config$DataRate.values()*.name()}" required="" value="${configInstance?.rate?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: configInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="config.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${configInstance?.enabled}" />
</div>

