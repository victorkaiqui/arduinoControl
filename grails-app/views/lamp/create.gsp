<%@ page import="arduinocontrol.Lamp" %>
<!DOCTYPE html>
<meta name="layout" content="main">

<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <g:hasErrors bean="${lampInstance}">
            <ul class="list-unstyled>
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
    </div>
</div>

<div class="row">
    <div class="col-md-10 col-md-offset-3">
        <g:form action="save" class="form-horizontal" role="form" >
            <fieldset>
                <g:render template="form"/>
            </fieldset>
            <fieldset>
                <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
</div>
