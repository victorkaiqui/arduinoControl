
<%@ page import="arduinocontrol.Lamp" %>
<!DOCTYPE html>

<meta name="layout" content="main">

<div class="row">
    <div class="col-md-5 col-md-offset-4">

        <ul class="list-unstyled">

            <g:if test="${lampInstance?.name}">
                <h4>
                    <li>
                        <span id="name-label" ><g:message code="lamp.name.label" default="Name" />:</span>
                        <small>
                            <g:fieldValue bean="${lampInstance}" field="name"/>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.description}">
                <h4>
                    <li>
                        <span id="description-label"><g:message code="lamp.description.label" default="Description" />:</span>
                        <small>
                            <g:fieldValue bean="${lampInstance}" field="description"/>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.pin}">
                <h4>
                    <li>
                        <span id="pin-label" ><g:message code="lamp.pin.label" default="Pin" />:</span>
                        <small>
                            <g:fieldValue bean="${lampInstance}" field="pin"/>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.paramsArduino}">
                <h4>
                    <li>
                        <span id="paramsArduino-label" ><g:message code="lamp.paramsArduino.label" default="Params Arduino" />:</span>
                        <small>
                            <g:fieldValue bean="${lampInstance}" field="paramsArduino"/>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.typeInOrOut}">
                <h4>
                    <li>
                        <span id="typeInOrOut-label" ><g:message code="lamp.typeInOrOut.label" default="Type In Or Out" />:</span>
                        <small>
                            <g:fieldValue bean="${lampInstance}" field="typeInOrOut"/>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.typeAnalogOrDigital}">
                <h4>
                    <li>
                        <span id="typeAnalogOrDigital-label" ><g:message code="lamp.typeAnalogOrDigital.label" default="Type Analog Or Digital" />:</span>
                        <small>
                            <g:fieldValue bean="${lampInstance}" field="typeAnalogOrDigital"/>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.isPwm}">
                <h4>
                    <li>
                        <span id="isPwm-label" ><g:message code="lamp.isPwm.label" default="Is Pwm" />:</span>
                        <small>
                            <g:formatBoolean boolean="${lampInstance?.isPwm}" />
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.valuePwm}">
                <h4>
                    <li>
                        <span id="valuePwm-label" ><g:message code="lamp.valuePwm.label" default="Value Pwm" />:</span>
                        <small>
                            <g:fieldValue bean="${lampInstance}" field="valuePwm"/>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.dateCreated}">
                <h4>
                    <li>
                        <span id="dateCreated-label" ><g:message code="lamp.dateCreated.label" default="Date Created" />:</span>
                        <small>
                            <g:formatDate date="${lampInstance?.dateCreated}" />:</span>
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.cluster}">
                <h4>
                    <li>
                        <span id="cluster-label" ><g:message code="lamp.cluster.label" default="cluster" />:</span>
                        <small>
                            <span class=""><g:link controller="cluster" action="show" id="${lampInstance?.cluster?.id}">${lampInstance?.cluster?.nameCluster}</g:link>
                            </small>
                        </li>
                    </h4>
            </g:if>

            <g:if test="${lampInstance?.lastUpdated}">
                <h4>
                    <li>
                        <span id="lastUpdated-label"><g:message code="lamp.lastUpdated.label" default="Last Updated" />:</span>
                        <small>
                            <g:formatDate date="${lampInstance?.lastUpdated}" />
                        </small>
                    </li>
                </h4>
            </g:if>

            <g:if test="${lampInstance?.status}">
                <h4>
                    <li>
                        <span id="status-label" ><g:message code="lamp.status.label" default="Status" />:</span>
                        <small>
                            <span class=""><g:formatBoolean boolean="${lampInstance?.status}" />
                        </small>
                    </li>
                </h4>
            </g:if>

        </ul>
    </div>
</div>

<g:form>
    <fieldset class="buttons col-md-3 col-md-offset-5">
        <g:hiddenField name="id" value="${lampInstance?.id}" />
        <g:link class="btn btn-warning" action="edit"  id="${lampInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="btn btn-danger" action="delete"  value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </fieldset>
</g:form>

