<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Exemplar</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editing Exemplar</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Numero:"/>
                <h:outputText value="#{exemplar.exemplar.exemplarPK.numero}" title="Numero" />
                <h:outputText value="Preco:"/>
                <h:inputText id="preco" value="#{exemplar.exemplar.preco}" title="Preco" />
                <h:outputText value="Publicacao:"/>
                <h:outputText value=" #{exemplar.exemplar.publicacao}" title="Publicacao" />

            </h:panelGrid>
            <br />
            <h:commandLink action="#{exemplar.edit}" value="Save">
                <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar][exemplar.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{exemplar.detailSetup}" value="Show" immediate="true">
                <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar][exemplar.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{exemplar.listSetup}" value="Show All Exemplar Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
