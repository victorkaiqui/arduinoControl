<!DOCTYPE html>
<%@ page import="arduinocontrol.Lamp" %>
<meta name="layout" content="main"/>

<div class="row">
    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">                
        <div class="list-group">
            <a href="#" class="list-group-item active">Link</a>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">                        
                <g:link controller="${c.logicalPropertyName}" class="list-group-item">${c.name}</g:link>                        
            </g:each> 
        </div>
    </div> 
</div>

<div class="row">

    
    <div class="panel-group" id="accordion">

        <g:each var="c" in="${clusterList}">

            <div class="panel panel-info">
                <div class="panel-heading"> 
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne${c.id}">
                        <h4 class="panel-title">${c.nameCluster}</h4>
                    </a>
                </div>

                <div id="collapseOne${c.id}" class="panel-collapse collapse">
                    <div class="panel-body">  

                        <g:each var="o" in="${objList}">                      

                            <div class="col-2 col-sm-6 col-lg-4">

                                <g:if test="${c.nameCluster == o.cluster.nameCluster}">

                                    <!--If Lamp -->
                                    <g:if test="${o.instanceOf(Lamp)}">

                                        <h4>
                                            <g:link controller="lamp" action="show" id="${o.id}">${o.name}</g:link>
                                                <small>
                                                    <a href="#" data-toggle="tooltip" title="${o.description}"> 
                                                    <span class="glyphicon glyphicon-info-sign"></a></span>
                                            </small>    
                                        </h4>

                                        <div class="panel-body">
                                            <p>Pin - ${o.cluster.nameCluster}</p>

                                            <g:if test="${o.status}">
                                                <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">Ligada</button>
                                                <g:link controller="lamp" action="status" id="${o.id}" class="btn btn-small btn-danger" role="button">Desligar</g:link>                                                           
                                            </g:if>
                                            <g:else>                              
                                                <button type="button" class="btn btn-small btn-default" disabled="disabled" role="button">Desligada</button> 
                                                <g:link controller="lamp" action="status" id="${o.id}" class="btn btn-small btn-success" role="button">Ligar</g:link>    
                                            </g:else> 
                                        </div>

                                    </g:if>  
                                </g:if>

                            </div>

                        </g:each>

                    </div>   
                </div>
            </div> 

        </g:each> 

    </div>
</div>


