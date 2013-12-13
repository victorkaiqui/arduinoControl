<%@ page import="arduinocontrol.Lamp" %>

<div class="form-group required">
    <label for="name" class="col-sm-2 control-label">
        <g:message code="lamp.name.label" default="Name" />*
    </label>
    <div class="col-xs-4">
        <g:textField class="form-control" id="name" placeholder="${message(code: 'lamp.name.label', default: 'Name')}" name="name" value="${lampInstance?.name}"  required="" />
    </div>
</div>

<div class="form-group">
    <label for="description" class="col-sm-2 control-label">
        <g:message code="lamp.description.label" default="Description" />
    </label>
    <div class="col-xs-4">
        <g:textArea class="form-control" rows="3" id="description" placeholder="${message(code: 'lamp.description.label', default: 'Description')}" name="description" value="${lampInstance?.description}"/>
    </div>
</div>

<div class="form-group required">
    <label for="pin" class="col-sm-2 control-label">
        <g:message code="lamp.pin.label" default="Pin" />*
    </label>
    <div class="col-xs-4">
        <g:field class="form-control" id="pin" placeholder="${message(code: 'lamp.pin.label', default: 'Pin')}" name="pin"  value="${lampInstance.pin}" required=""/>
    </div>
</div>

<div class="form-group required">
    <label for="typeInOrOut" class="col-sm-2 control-label">
        <g:message code="lamp.typeInOrOut.label" default="Type In Or Out" />*
    </label>
    <div class="col-xs-4">        
        <g:select  class="form-control" id="typeInOrOut" name="typeInOrOut" from="${arduinocontrol.Object$TypeInOrOut?.values()}" keys="${arduinocontrol.Object$TypeInOrOut.values()*.name()}" value="${lampInstance?.typeInOrOut?.name()}" required="" />
    </div>
</div>


<div class="form-group required">
    <label for="typeAnalogOrDigital" class="col-sm-2 control-label">
        <g:message code="lamp.typeAnalogOrDigital.label" default="Type Analog Or Digital" />*
    </label>
    <div class="col-xs-4"> 
        <g:select class="form-control" id="typeAnalogOrDigital" name="typeAnalogOrDigital" from="${arduinocontrol.Object$TypeAnalogOrDigital?.values()}" keys="${arduinocontrol.Object$TypeAnalogOrDigital.values()*.name()}" value="${lampInstance?.typeAnalogOrDigital?.name()}" required="" />
    </div>
</div>

<div class="form-group">
    <label for="isPwm" class="col-sm-2 control-label">
        <g:message code="lamp.isPwm.label" default="Is Pwm" />
    </label>
    <div class="col-xs-4"> 
        <label class="checkbox-inline"> 
            <g:checkBox type="checkbox" name="isPwm" value="${lampInstance?.isPwm}" />
        </label>
    </div>
</div>

<div class="form-group required">
    <label for="cluster" class="col-sm-2 control-label">
        <g:message code="lamp.cluster.label" default="cluster" />
    </label>
    <div class="col-xs-4"> 
        <g:select class="form-control" id="cluster" name="cluster.id" from="${arduinocontrol.Cluster.list()}" optionKey="id" optionValue="nameCluster"   value="${lampInstance?.cluster?.id}" />
    </div>
</div>
