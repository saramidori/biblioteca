<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Funcionario Detail</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Funcionario Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Codigo:"/>
                <h:outputText value="#{funcionario.funcionario.codigo}" title="Codigo" />
                <h:outputText value="Nome:"/>
                <h:outputText value="#{funcionario.funcionario.nome}" title="Nome" />
                <h:outputText value="Funcao:"/>
                <h:outputText value="#{funcionario.funcionario.funcao}" title="Funcao" />
                <h:outputText value="Email:"/>
                <h:outputText value="#{funcionario.funcionario.email}" title="Email" />


            </h:panelGrid>
            <br />
            <h:commandLink action="#{funcionario.remove}" value="Destroy">
                <f:param name="jsfcrud.currentFuncionario" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][funcionario.funcionario][funcionario.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{funcionario.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentFuncionario" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][funcionario.funcionario][funcionario.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{funcionario.createSetup}" value="New Funcionario" />
            <br />
            <h:commandLink action="#{funcionario.listSetup}" value="Show All Funcionario Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
