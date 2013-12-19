<!DOCTYPE html>
<%@ page import="arduinocontrol.Lamp" %>
<meta name="layout" content="main"/>

<div class="row">

    <div class="panel-group" id="accordion">

        <!-- Each CLUSTER -->
        <g:each var="c" in="${clusterList}">

            <div class="panel panel-info">

                <div class="panel-heading"> 
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne${c.id}">
                        <h4 class="panel-title">${c.nameCluster}</h4>
                    </a>
                </div>

                <div id="collapseOne${c.id}" class="panel-collapse collapse">
                    <div class="panel-body">  

                        <!-- Each Lamp -->
                        <g:each var="o" in="${objList}">                      



                            <g:if test="${c.nameCluster == o.cluster.nameCluster}">
                                <div class="col-2 col-sm-6 col-lg-4">
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
                                            <p>${message(code: 'lamp.pin.label')} - ${o.pin}</p>
                                            <p>${o.typeAnalogOrDigital}</p>
                                            <p>${o.typeInOrOut}</p>

                                            <div id="update${o.id}">
                                                <g:render template="fragmentStatus" model="['o' : o]"/>
                                            </div>

                                        </div>

                                    </g:if> 

                                </div>                                

                            </g:if>
                        </g:each>

                    </div>   
                </div>
            </div> 

        </g:each> 

    </div>
</div>


