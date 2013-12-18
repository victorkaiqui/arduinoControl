<%@ page import="arduinocontrol.Lamp" %>
<g:if test="${o.status}">
    <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">Ligada</button>
    <g:remoteLink  controller="lamp" action="statusIndex" id="${o.id}" update="update" class="btn btn-small btn-danger" role="button">Desligar</g:remoteLink>                                                           
</g:if>
<g:else>                              
    <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">Desligada</button> 
    <g:remoteLink controller="lamp" action="statusIndex" id="${o.id}" update="update" class="btn btn-small btn-success" role="button">Ligar</g:remoteLink>    
</g:else> 
