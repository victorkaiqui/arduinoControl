
<%@ page import="arduinocontrol.Lamp" %>
<!DOCTYPE html>
<meta name="layout" content="main">

<table class="table table-hover">
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
            <tr>

                <td><g:link action="show" id="${lampInstance.id}">${fieldValue(bean: lampInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: lampInstance, field: "description")}</td>

                <td>${fieldValue(bean: lampInstance, field: "pin")}</td>

                <td>${fieldValue(bean: lampInstance, field: "paramsArduino")}</td>

                <td>${fieldValue(bean: lampInstance, field: "typeInOrOut")}</td>

                <td>${fieldValue(bean: lampInstance, field: "typeAnalogOrDigital")}</td>

                <td> 
                    <g:if test="${lampInstance.status}">
                        <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">${message(code: 'lamp.lampStatusTrue.label')}</button>
                        <g:link  controller="lamp" action="status" id="${lampInstance.id}"  class="btn btn-small btn-danger" role="button">${message(code: 'lamp.lampStatusFalse2.label')}</g:link>                                                           
                    </g:if>
                    <g:else>                              
                        <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">${message(code: 'lamp.lampStatusFalse.label')}</button> 
                        <g:link controller="lamp" action="status" id="${lampInstance.id}" class="btn btn-small btn-success" role="button">${message(code: 'lamp.lampStatusTrue2.label')}</g:link>    
                    </g:else> 
                </td>
            </tr>
        </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${lampInstanceTotal}" />
</div>


