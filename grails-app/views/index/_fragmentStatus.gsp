<%@ page import="arduinocontrol.Lamp" %>
<g:if test="${o.status}">
    <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">${message(code: 'lamp.lampStatusTrue.label')}</button>
    <g:remoteLink  controller="lamp" action="statusIndex" id="${o.id}" update="update${o.id}" class="btn btn-small btn-danger" role="button">${message(code: 'lamp.lampStatusFalse2.label')}</g:remoteLink>                                                           
</g:if>
<g:else>                              
    <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">${message(code: 'lamp.lampStatusFalse.label')}</button> 
    <g:remoteLink controller="lamp" action="statusIndex" id="${o.id}" update="update${o.id}" class="btn btn-small btn-success" role="button">${message(code: 'lamp.lampStatusTrue2.label')}</g:remoteLink>    
</g:else> 
