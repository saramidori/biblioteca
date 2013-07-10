<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Associado</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>New Associado</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{associado.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="Nome:"/>
                <h:inputText id="nome" value="#{associado.associado.nome}" title="Nome" required="true" requiredMessage="The nome field is required." />
                <h:outputText value="Endereco:"/>
                <h:inputText id="endereco" value="#{associado.associado.endereco}" title="Endereco" required="true" requiredMessage="The endereco field is required." />
                <h:outputText value="Email:"/>
                <h:inputText id="email" value="#{associado.associado.email}" title="Email" required="true" requiredMessage="The email field is required." />
                <h:outputText value="Status:"/>
                <h:inputText id="status" value="#{associado.associado.status}" title="Status" required="true" requiredMessage="The status field is required." />
                <h:outputText value="EmprestimoCollection:"/>
                <h:selectManyListbox id="emprestimoCollection" value="#{associado.associado.jsfcrud_transform[jsfcrud_class['view.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['view.util.JsfUtil'].jsfcrud_method.arrayToList].emprestimoCollection}" title="EmprestimoCollection" size="6" converter="#{emprestimo.converter}" >
                    <f:selectItems value="#{emprestimo.emprestimoItemsAvailableSelectMany}"/>
                </h:selectManyListbox>
                <h:outputText value="ReservaCollection:"/>
                <h:selectManyListbox id="reservaCollection" value="#{associado.associado.jsfcrud_transform[jsfcrud_class['view.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['view.util.JsfUtil'].jsfcrud_method.arrayToList].reservaCollection}" title="ReservaCollection" size="6" converter="#{reserva.converter}" >
                    <f:selectItems value="#{reserva.reservaItemsAvailableSelectMany}"/>
                </h:selectManyListbox>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{associado.create}" value="Create"/>
            <br />
            <br />
            <h:commandLink action="#{associado.listSetup}" value="Show All Associado Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
