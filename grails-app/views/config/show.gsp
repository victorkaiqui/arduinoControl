
<%@ page import="arduinocontrol.Config" %>
<!DOCTYPE html>

<meta name="layout" content="main">

<div class="row">
    <div class="col-md-5 col-md-offset-4">
        <ul class="list-unstyled">

            <g:if test="${configInstance?.pin}">
                <h4>
                    <li>                    
                        <span id="pin-label" class="property-label"><g:message code="config.pin.label" default="Pin" />:</span>
                        <small>  
                            <g:fieldValue bean="${configInstance}" field="pin"/>
                        </small>                    
                    </li>
                </h4>
            </g:if>

            <g:if test="${configInstance?.rate}">
                <h4>
                    <li>
                        <span id="rate-label" class="property-label"><g:message code="config.rate.label" default="Rate" />:</span>
                        <small>  
                            <g:fieldValue bean="${configInstance}" field="rate"/>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${configInstance?.enabled}">
                <h4>
                    <li>
                        <span id="enabled-label" class="property-label"><g:message code="config.enabled.label" default="Enabled" />:</span>
                        <small>  
                            <g:formatBoolean boolean="${configInstance?.enabled}" />
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${configInstance?.dateCreated}">
                <h4>
                    <li>
                        <span id="dateCreated-label" class="property-label"><g:message code="config.dateCreated.label" default="Date Created" />:</span>
                        <small>  
                            <g:formatDate date="${configInstance?.dateCreated}" />
                        </small>
                    </li>
                </h4>
            </g:if>           

            <g:if test="${configInstance?.lastUpdated}">
                <h4>
                    <li>
                        <span id="lastUpdated-label" class="property-label"><g:message code="config.lastUpdated.label" default="Last Updated" />:</span>
                        <small>  
                            <g:formatDate date="${configInstance?.lastUpdated}" />
                        </small>
                    </li>
                </h4>
            </g:if>

        </ul>
    </div>
</div>
<g:form>
    <fieldset class="buttons col-md-3 col-md-offset-5">
        <g:hiddenField name="id" value="${configInstance?.id}" />
        <g:link class="btn btn-warning" action="edit" id="${configInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </fieldset>
</g:form>
