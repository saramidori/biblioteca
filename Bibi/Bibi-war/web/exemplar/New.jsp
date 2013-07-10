<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Exemplar</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>New Exemplar</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{exemplar.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="Numero:"/>
                <h:inputText id="numero" value="#{exemplar.exemplar.exemplarPK.numero}" title="Numero" required="true" requiredMessage="The numero field is required." />
                <h:outputText value="Preco:"/>
                <h:inputText id="preco" value="#{exemplar.exemplar.preco}" title="Preco" />
                <h:outputText value="Publicacao:"/>
                <h:selectOneMenu id="publicacao" value="#{exemplar.exemplar.publicacao}" title="Publicacao" required="true" requiredMessage="The publicacao field is required." >
                    <f:selectItems value="#{publicacao.publicacaoItemsAvailableSelectOne}"/>
                </h:selectOneMenu>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{exemplar.create}" value="Create"/>
            <br />
            <br />
            <h:commandLink action="#{exemplar.listSetup}" value="Show All Exemplar Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
