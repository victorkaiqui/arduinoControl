<!DOCTYPE html>
<%@ page import="service.MethodsService" %>
<%def myService = grailsApplication.classLoader.loadClass('service.MethodsService').newInstance()%>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Welcome to Grails</title>
        <style type="text/css" media="screen">
            #status {
            background-color: #eee;
            border: .2em solid #fff;
            margin: 2em 2em 1em;
            padding: 1em;
            width: 12em;
            float: left;
            -moz-box-shadow: 0px 0px 1.25em #ccc;
            -webkit-box-shadow: 0px 0px 1.25em #ccc;
            box-shadow: 0px 0px 1.25em #ccc;
            -moz-border-radius: 0.6em;
            -webkit-border-radius: 0.6em;
            border-radius: 0.6em;
            }        

            #status h1 {
            text-transform: uppercase;
            font-size: 1.1em;
            margin: 0 0 0.3em;
            }

            #page-body {
            margin: 2em 1em 1.25em 18em;
            }

            h2 {
            margin-top: 1em;
            margin-bottom: 0.3em;
            font-size: 1em;
            }

            p {
            line-height: 1.5;
            margin: 0.25em 0;
            }

            #controller-list ul {
            list-style-position: inside;
            }

            #controller-list li {
            line-height: 1.3;
            list-style-position: inside;
            margin: 0.25em 0;
            }

            @media screen and (max-width: 480px) {
            #status {
            display: none;
            }

            #page-body {
            margin: 0 1em 1em;
            }

            #page-body h1 {
            margin-top: 0;
            }
            }
        </style>
    </head>
    <body>

        <div id="page-body" role="main">
            <div id="controller-list" role="navigation">
                <h2>Available Controllers:</h2>
                
                <g:link action="initSerial" controller="config">initSerial</g:link>          
                <g:link action="closeSerial" controller="config">close</g:link>           

                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller">
                            <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                            </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
