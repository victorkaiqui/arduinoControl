<!DOCTYPE html>
<%@ page import="arduinocontrol.Lamp" %>
<meta name="layout" content="main"/> 

<div class="row row-offcanvas row-offcanvas-right">  
    <div class="col-xs-12 col-sm-9">
        
        <div class="row">
            <g:each var="c" in="${objList}">   
                <div class="col-6 col-sm-6 col-lg-4">
                    <!--If Lamp -->
                    <g:if test="${c.instanceOf(Lamp)}">
                        
                        <h2><g:link controller="lamp" action="show" id="${c.id}">${c.name}</g:link></h2>
                        <p><a href="#" data-toggle="tooltip" title="${c.description}"><span class="glyphicon glyphicon-info-sign"></span></p>                      
                        
                        
                        
                        <g:if test="${c.status}">
                            <button type="button" class="btn btn-small btn-default" disabled="disabled">Ligada</button>
                            <g:link controller="lamp" action="status" id="${c.id}" class="btn btn-small btn-danger">Desligar</g:link>                                                           
                        </g:if>
                        <g:else>                              
                            <button type="button" class="btn btn-small btn-default" disabled="disabled">Desligada</button> 
                            <g:link controller="lamp" action="status" id="${c.id}" class="btn btn-small btn-success">Ligar</g:link>    
                        </g:else> 
                        
                    </g:if>                    
                </div>
            </g:each>
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
</div>


