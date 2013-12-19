
<%@ page import="arduinocontrol.Cluster" %>
<!DOCTYPE html>
<meta name="layout" content="main">

<div class="row">
    <div class="col-md-5 col-md-offset-4">

        <ul class="list-unstyled">

            <g:if test="${clusterInstance?.nameCluster}">
                <h4>
                    <li class="fieldcontain">
                        <span id="nameCluster-label" class="property-label"><g:message code="cluster.nameCluster.label" default="Name Cluster" /></span>
                        <small>
                            <g:fieldValue bean="${clusterInstance}" field="nameCluster"/>
                        </small>
                    </li>  
                </h4>
            </g:if>

            <g:if test="${clusterInstance?.descriptionCluster}">
                <h4>
                    <li class="fieldcontain">
                        <span id="descriptionCluster-label" class="property-label"><g:message code="cluster.descriptionCluster.label" default="Description Cluster" /></span>
                        <small>
                            <g:fieldValue bean="${clusterInstance}" field="descriptionCluster"/>
                        </small>                
                    </li>
                </h4>
            </g:if>

            <g:if test="${clusterInstance?.dateCreated}">
                <h4>
                    <li class="fieldcontain">
                        <span id="dateCreated-label" class="property-label"><g:message code="cluster.dateCreated.label" default="Date Created" /></span>
                        <small>
                            <g:formatDate date="${clusterInstance?.dateCreated}" />
                        </small>
                    </li>
                </g:if>


            </h4>
            <g:if test="${clusterInstance?.isPwm}">
                <h4>
                    <li class="fieldcontain">
                        <span id="isPwm-label" class="property-label"><g:message code="cluster.isPwm.label" default="Is Pwm" /></span>
                        <small>
                            <g:formatBoolean boolean="${clusterInstance?.isPwm}" />
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${clusterInstance?.lastUpdated}">
                <h4>
                    <li class="fieldcontain">
                        <span id="lastUpdated-label" class="property-label"><g:message code="cluster.lastUpdated.label" default="Last Updated" /></span>
                        <small>
                            <g:formatDate date="${clusterInstance?.lastUpdated}" />
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${clusterInstance?.objects}">
                <h4>
                    <li class="fieldcontain">
                        <span id="objects-label" class="property-label"><g:message code="cluster.objects.label" default="Objects" /></span>

                        <g:each in="${clusterInstance.objects}" var="o">
                            <small>
                                <g:link controller="object" action="show" id="${o.id}">${o?.name}</g:link>,
                                </small>
                        </g:each>

                    </li>
                </h4>

            </g:if>

        </ul>
    </div>
</div>

<g:form>
    <fieldset class="buttons col-md-3 col-md-offset-5">
        <g:hiddenField name="id" value="${clusterInstance?.id}" />
        <g:link class="btn btn-warning" action="edit" id="${clusterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </fieldset>
</g:form>
