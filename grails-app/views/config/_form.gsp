<%@ page import="arduinocontrol.Config" %>



<div class="fieldcontain ${hasErrors(bean: configInstance, field: 'pin', 'error')} required">
	<label for="pin">
		<g:message code="config.pin.label" default="Pin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pin" required="" value="${configInstance?.pin}"/>
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

