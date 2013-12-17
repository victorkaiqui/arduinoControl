
<%@ page import="arduinocontrol.Lamp" %>
<!DOCTYPE html>

<meta name="layout" content="main">



<div id="list-lamp" class="content scaffold-list" role="main">
    <h1>${message(code: 'lamp.lampList.label')}</h1>

    <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>

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
                            <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">Ligada</button>
                            <g:link controller="lamp" action="status" id="${lampInstance.id}" class="btn btn-small btn-danger" role="button">Desligar</g:link>                                                           
                        </g:if>
                        <g:else>                              
                            <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">Desligada</button> 
                            <g:link controller="lamp" action="status" id="${lampInstance.id}" class="btn btn-small btn-success" role="button">Ligar</g:link>    
                        </g:else> 
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${lampInstanceTotal}" />
    </div>


