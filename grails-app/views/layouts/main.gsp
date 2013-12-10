<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en"><!--<![endif]-->
	<head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="">
            <meta name="author" content="">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <title><g:layoutTitle default="Hey"/></title>

            <script src="${resource(dir: 'js', file: 'jQuery.js')}"></script>
            <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>

            <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.css')}" type="text/css">

            <g:layoutHead/>
            <r:layoutResources />

	</head>
	<body style="">
		
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="${request.contextPath}"><g:message code="main.showMain.mainTitle.label"/></a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="#home"><g:message code="main.showMain.mainHome.label"/></a></li>
                            <li><a href="#about"><g:message code="main.showMain.mainAbout.label"/></a></li>                            
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message code="main.showMain.dropdownTitle.label"/><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-header"><g:message code="main.showMain.dropdownAction.label"/></li>
                                    <li><g:link action="initSerial" controller="config"><g:message code="main.showMain.dropdownInit.label"/></g:link></li>
                                    <li><g:link action="restartSerial" controller="config"><g:message code="main.showMain.dropdownRestart.label"/></g:link></li>
                                    <li><g:link action="closeSerial" controller="config"><g:message code="main.showMain.dropdownClose.label"/></g:link></li>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><g:message code="main.showMain.dropdownConfig.label"/></li>
                                    <li><a href="#"><g:message code="main.showMain.dropdownPort.label"/></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>                   
                </div>
            </div>
            
            <div class="container">
                <div class="row row-offcanvas row-offcanvas-right">                    
                        <g:layoutBody/>
                        <r:layoutResources />                   
                </div>
            </div> 
            
           
	</body>
</html>
