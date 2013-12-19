<%@ page import="arduinocontrol.Config" %>

<div class="form-group required">
    <label for="pin" class="col-sm-2 control-label">
        <g:message code="config.pin.label" default="Pin" />*
    </label>
    <div class="col-xs-4">
        <g:textField class="form-control" id="pin" placeholder="${message(code: 'config.pin.label', default: 'pin')}" name="pin" value="${configInstance?.pin}"  required="" />
    </div>
</div>

<div class="form-group required">
    <label for="rate" class="col-sm-2 control-label">
        <g:message code="config.rate.label" default="Rate" />*
    </label>
    <div class="col-xs-4">        
        <g:select name="rate" from="${arduinocontrol.Config$DataRate?.values()}" keys="${arduinocontrol.Config$DataRate.values()*.name()}" required="" value="${configInstance?.rate?.name()}"/>
    </div>
</div>


