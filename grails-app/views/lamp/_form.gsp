<%@ page import="arduinocontrol.Lamp" %>


<div class="form-group required">
    <label for="name" class="col-sm-2 control-label">
        <g:message code="lamp.name.label" default="Name" />*
    </label>
    <div class="col-sm-10">
        <g:textField class="form-control" id="name" placeholder="Nome" name="${message(code: 'lamp.name.label', default: 'Name')}" required="" value="${lampInstance?.name}"/>
    </div>
</div>

<div class="form-group">
    <label for="description" class="col-sm-2 control-label">
        <g:message code="lamp.description.label" default="Description" />
    </label>
    <div class="col-sm-10">
        <g:textArea class="form-control" rows="3" id="description" placeholder="${message(code: 'lamp.description.label', default: 'Description')}" name="description" value="${lampInstance?.description}"/>
    </div>
</div>

<div class="form-group required">
    <label for="pin" class="col-sm-2 control-label">
        <g:message code="lamp.pin.label" default="Pin" />*
    </label>
    <div class="col-sm-10">
        <g:field class="form-control" id="pin" placeholder="${message(code: 'lamp.pin.label', default: 'Pin')}" name="pin" type="number" value="${lampInstance.pin}" required=""/>
    </div>
</div>

<div class="form-group required">
    <label for="typeInOrOut" class="col-sm-2 control-label">
        <g:message code="lamp.typeInOrOut.label" default="Type In Or Out" />*
    </label>
    <div class="col-sm-10">        
        <g:select  class="form-control" id="typeInOrOut" name="typeInOrOut" from="${arduinocontrol.Object$TypeInOrOut?.values()}" keys="${arduinocontrol.Object$TypeInOrOut.values()*.name()}" required="" value="${lampInstance?.typeInOrOut?.name()}"/>
    </div>
</div>


<div class="form-group required">
    <label for="typeAnalogOrDigital" class="col-sm-2 control-label">
        <g:message code="lamp.typeAnalogOrDigital.label" default="Type Analog Or Digital" />*
    </label>
    <div class="col-sm-10"> 
        <g:select class="form-control" id="typeAnalogOrDigital" name="typeAnalogOrDigital" from="${arduinocontrol.Object$TypeAnalogOrDigital?.values()}" keys="${arduinocontrol.Object$TypeAnalogOrDigital.values()*.name()}" required="" value="${lampInstance?.typeAnalogOrDigital?.name()}"/>
    </div>
</div>

<div class="form-group required">
    <label for="isPwm" class="col-sm-2 control-label">
        <g:message code="lamp.isPwm.label" default="Is Pwm" />
    </label>
    <div class="col-sm-10"> 
        <label class="checkbox-inline"> 
            <g:checkBox type="checkbox" name="isPwm" value="${lampInstance?.isPwm}" />
        </label>
    </div>
</div>

<div class="form-group required">
    <label for="group" class="col-sm-2 control-label">
        <g:message code="lamp.group.label" default="Group" />
    </label>
    <div class="col-sm-10"> 
        <g:select class="form-control" id="group" name="group.id" from="${arduinocontrol.Group.list()}" optionKey="id" optionValue="nameGroup"   value="${lampInstance?.group?.id}" />
    </div>
</div>
