
<%@ page import="arduinocontrol.Cluster" %>
<!DOCTYPE html>
<meta name="layout" content="main">

<table class="table table-hover">
    <thead>
        <tr>

            <g:sortableColumn property="nameCluster" title="${message(code: 'cluster.nameCluster.label', default: 'Name Cluster')}" />

            <g:sortableColumn property="descriptionCluster" title="${message(code: 'cluster.descriptionCluster.label', default: 'Description Cluster')}" />
           
            <g:sortableColumn property="isPwm" title="${message(code: 'cluster.isPwm.label', default: 'Is Pwm')}" />
           
        </tr>
    </thead>
    <tbody>
        <g:each in="${clusterInstanceList}" status="i" var="clusterInstance">
            <tr>

                <td><g:link action="show" id="${clusterInstance.id}">${fieldValue(bean: clusterInstance, field: "nameCluster")}</g:link></td>

                <td>${fieldValue(bean: clusterInstance, field: "descriptionCluster")}</td>
                
                <td><g:formatBoolean boolean="${clusterInstance.isPwm}" /></td>
               
            </tr>
        </g:each>
    </tbody>
</table>
<div class="pagination">
    <g:paginate total="${clusterInstanceTotal}" />
</div>
