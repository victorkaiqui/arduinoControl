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

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'pin', 'error')} required">
    <label for="pin">
        <g:message code="lamp.pin.label" default="Pin" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="pin" type="number" value="${lampInstance.pin}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'paramsArduino', 'error')} ">
    <label for="paramsArduino">
        <g:message code="lamp.paramsArduino.label" default="Params Arduino" />

    </label>
    <g:textField name="paramsArduino" value="${lampInstance?.paramsArduino}"/>
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

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'isPwm', 'error')} ">
    <label for="isPwm">
        <g:message code="lamp.isPwm.label" default="Is Pwm" />

    </label>
    <g:checkBox name="isPwm" value="${lampInstance?.isPwm}" />
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'valuePwm', 'error')}">
    <label for="valuePwm">
        <g:message code="lamp.valuePwm.label" default="Value Pwm" />
    </label>
    <g:field name="valuePwm" type="number" value="${lampInstance.valuePwm}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lampInstance, field: 'status', 'error')} ">
    <label for="status">
        <g:message code="lamp.status.label" default="Status" />

    </label>
    <g:checkBox name="status" value="${lampInstance?.status}" />
</div>

