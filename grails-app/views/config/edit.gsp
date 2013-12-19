<%@ page import="arduinocontrol.Config" %>
<!DOCTYPE html>
<meta name="layout" content="main">

<div class="row">
    <div class="col-md-6 col-md-offset-3">

        <g:hasErrors bean="${configInstance}">
            <ul class="list-unstyled" >
                <g:eachError bean="${configInstance}" var="error">

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
    <div class="col-md-10 col-md-offset-3"  >
        <g:form method="post" class="form-horizontal" role="form">
            <g:hiddenField name="id" value="${configInstance?.id}" />
            <g:hiddenField name="version" value="${configInstance?.version}" />

            <fieldset>
                <g:render template="form"/>
            </fieldset>
            <fieldset class="buttons col-md-3 col-md-offset-3">
                <g:actionSubmit class="btn btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</div>