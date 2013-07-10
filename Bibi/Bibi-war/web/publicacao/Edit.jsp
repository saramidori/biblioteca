<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Publicacao</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editing Publicacao</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Isbn:"/>
                <h:outputText value="#{publicacao.publicacao.isbn}" title="Isbn" />
                <h:outputText value="Titulo:"/>
                <h:inputText id="titulo" value="#{publicacao.publicacao.titulo}" title="Titulo" required="true" requiredMessage="The titulo field is required." />
                <h:outputText value="Autor:"/>
                <h:inputText id="autor" value="#{publicacao.publicacao.autor}" title="Autor" required="true" requiredMessage="The autor field is required." />
                <h:outputText value="Editora:"/>
                <h:inputText id="editora" value="#{publicacao.publicacao.editora}" title="Editora" required="true" requiredMessage="The editora field is required." />
                <h:outputText value="ExemplarCollection:"/>
                <h:outputText escape="false" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getCollectionAsString'][publicacao.publicacao.exemplarCollection == null ? jsfcrud_null : publicacao.publicacao.exemplarCollection].jsfcrud_invoke}" title="ExemplarCollection" />
                <h:outputText value="ReservaCollection:"/>
                <h:selectManyListbox id="reservaCollection" value="#{publicacao.publicacao.jsfcrud_transform[jsfcrud_class['view.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['view.util.JsfUtil'].jsfcrud_method.arrayToList].reservaCollection}" title="ReservaCollection" size="6" converter="#{reserva.converter}" >
                    <f:selectItems value="#{reserva.reservaItemsAvailableSelectMany}"/>
                </h:selectManyListbox>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{publicacao.edit}" value="Save">
                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{publicacao.detailSetup}" value="Show" immediate="true">
                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{publicacao.listSetup}" value="Show All Publicacao Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
