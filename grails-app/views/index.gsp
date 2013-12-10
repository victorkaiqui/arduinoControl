<!DOCTYPE html>
<%@ page import="arduinocontrol.Lamp" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Welcome to Grails</title>        
    </head>
    <body>
        
        <h2>Available Controllers:</h2>          
            
            <div class="col-xs-12 col-sm-9">
                <p class="pull-right visible-xs">
                    <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
                </p>
                <div class="jumbotron">
                    <h1>Hello, world!</h1>
                    <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>
                </div>
            </div>

            <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">                
                <div class="list-group">
                    <a href="#" class="list-group-item active">Link</a>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">                        
                        <g:link controller="${c.logicalPropertyName}" class="list-group-item">${c.name}</g:link>                        
                    </g:each> 
                </div>
            </div>            
            
    </body>
</html>
