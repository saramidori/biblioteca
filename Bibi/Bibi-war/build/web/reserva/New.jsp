<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Reserva</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>New Reserva</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{reserva.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="Data (MM/dd/yyyy):"/>
                <h:inputText id="data" value="#{reserva.reserva.data}" title="Data" required="true" requiredMessage="The data field is required." >
                    <f:convertDateTime pattern="MM/dd/yyyy" />
                </h:inputText>
                <h:outputText value="Status:"/>
                <h:inputText id="status" value="#{reserva.reserva.status}" title="Status" required="true" requiredMessage="The status field is required." />
                <h:outputText value="CodigoAssoc:"/>
                <h:selectOneMenu id="codigoAssoc" value="#{reserva.reserva.codigoAssoc}" title="CodigoAssoc" required="true" requiredMessage="The codigoAssoc field is required." >
                    <f:selectItems value="#{associado.associadoItemsAvailableSelectOne}"/>
                </h:selectOneMenu>
                <h:outputText value="Isbn:"/>
                <h:selectOneMenu id="isbn" value="#{reserva.reserva.isbn}" title="Isbn" required="true" requiredMessage="The isbn field is required." >
                    <f:selectItems value="#{publicacao.publicacaoItemsAvailableSelectOne}"/>
                </h:selectOneMenu>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{reserva.create}" value="Create"/>
            <br />
            <br />
            <h:commandLink action="#{reserva.listSetup}" value="Show All Reserva Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
