<%@ page import="arduinocontrol.Cluster" %>

<div class="form-group required">
    <label for="nameCluster" class="col-sm-2 control-label">
        <g:message code="cluster.nameCluster.label" default="Name Cluster" />*
    </label>
    <div class="col-xs-4">
        <g:textField class="form-control" name="nameCluster" required="" value="${clusterInstance?.nameCluster}"/>        
    </div>
</div>

<div class="form-group required">
    <label for="descriptionCluster" class="col-sm-2 control-label">
        <g:message code="cluster.descriptionCluster.label" default="Description Cluster" />
    </label>
    <div class="col-xs-4">        
        <g:textArea class="form-control" rows="3" name="descriptionCluster" value="${clusterInstance?.descriptionCluster}"/>
    </div>
</div>

<div class="form-group required">
    <label for="isPwm" class="col-sm-2 control-label">
        <g:message code="cluster.isPwm.label" default="Is Pwm" />
    </label>
    <div class="col-xs-4">
        <g:checkBox class="form-control" name="isPwm" value="${clusterInstance?.isPwm}" />                 
    </div>
</div>

