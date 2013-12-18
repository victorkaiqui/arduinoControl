
<%@ page import="arduinocontrol.Config" %>
<!DOCTYPE html>

<div class="col-xs-4">
    <g:link action="create" controller="config" class="btn btn-primary btn-lg btn-block">${message(code: 'config.configNew.label')}</g:link>
    </div>

<meta name="layout" content="main">

<table class="table table-hover">
    <thead>
        <tr>

            <g:sortableColumn property="pin" title="${message(code: 'config.pin.label', default: 'Pin')}" />

            <g:sortableColumn property="rate" title="${message(code: 'config.rate.label', default: 'Rate')}" />

            <g:sortableColumn property="enabled" title="${message(code: 'config.enabled.label', default: 'Enabled')}" />

        </tr>
    </thead>
    <tbody>
        <g:each in="${configInstanceList}" status="i" var="configInstance">
            <tr>

                <td><g:link action="show" id="${configInstance.id}">${fieldValue(bean: configInstance, field: "pin")}</g:link></td>

                <td>${fieldValue(bean: configInstance, field: "rate")}</td>

                <td>
                    <g:remoteLink controller="lamp" action="statusIndex" id="${configInstance.id}" update="update" class="btn btn-small btn-success" role="button"><g:checkBox name="checkbox" value="${configInstance.enabled}" />
                    </g:remoteLink>
                    <g:if test="${configInstance.enabled}">                        
                        <g:link  controller="config" action="choosePin" id="${configInstance.id}" class="btn btn-small btn-danger" role="button">Desligar</g:link>                                                           
                    </g:if>
                    <g:else>
                        <g:link controller="config" action="choosePin" id="${configInstance.id}" class="btn btn-small btn-success" role="button">Ligar</g:link>    
                    </g:else> 
                </td>

            </tr>
        </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${configInstanceTotal}" />
</div>
