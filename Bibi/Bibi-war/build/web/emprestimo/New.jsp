<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Emprestimo</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>New Emprestimo</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{emprestimo.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="NroExemplar:"/>
                <h:inputText id="nroExemplar" value="#{emprestimo.emprestimo.nroExemplar}" title="NroExemplar" required="true" requiredMessage="The nroExemplar field is required." />
                <h:outputText value="Isbn:"/>
                <h:inputText id="isbn" value="#{emprestimo.emprestimo.isbn}" title="Isbn" required="true" requiredMessage="The isbn field is required." />
                <h:outputText value="DataEmp (MM/dd/yyyy):"/>
                <h:inputText id="dataEmp" value="#{emprestimo.emprestimo.dataEmp}" title="DataEmp" required="true" requiredMessage="The dataEmp field is required." >
                    <f:convertDateTime pattern="MM/dd/yyyy" />
                </h:inputText>
                <h:outputText value="DataDevol (MM/dd/yyyy):"/>
                <h:inputText id="dataDevol" value="#{emprestimo.emprestimo.dataDevol}" title="DataDevol" >
                    <f:convertDateTime pattern="MM/dd/yyyy" />
                </h:inputText>
                <h:outputText value="CodigoAssoc:"/>
                <h:selectOneMenu id="codigoAssoc" value="#{emprestimo.emprestimo.codigoAssoc}" title="CodigoAssoc" required="true" requiredMessage="The codigoAssoc field is required." >
                    <f:selectItems value="#{associado.associadoItemsAvailableSelectOne}"/>
                </h:selectOneMenu>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{emprestimo.create}" value="Create"/>
            <br />
            <br />
            <h:commandLink action="#{emprestimo.listSetup}" value="Show All Emprestimo Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
