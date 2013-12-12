<%@ page import="arduinocontrol.Lamp" %>
<!DOCTYPE html>
<meta name="layout" content="main">
			  
    <g:hasErrors bean="${lampInstance}">
        <ul>
            <g:eachError bean="${lampInstance}" var="error">
                <li  <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                <div class="alert alert-warning alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <g:message error="${error}"/>
                    </div>
                </li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form action="save" class="form-horizontal" role="form" >
            <fieldset>
                    <g:render template="form"/>
            </fieldset>
            <fieldset>
                    <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
    </g:form>
