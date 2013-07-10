<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Exemplar Detail</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Exemplar Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Numero:"/>
                <h:outputText value="#{exemplar.exemplar.exemplarPK.numero}" title="Numero" />
                <h:outputText value="Preco:"/>
                <h:outputText value="#{exemplar.exemplar.preco}" title="Preco" />
                <h:outputText value="Publicacao:"/>
                <h:panelGroup>
                    <h:outputText value="#{exemplar.exemplar.publicacao}"/>
                    <h:panelGroup rendered="#{exemplar.exemplar.publicacao != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Show" action="#{publicacao.detailSetup}">
                            <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar][exemplar.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="exemplar"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ExemplarController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{publicacao.editSetup}">
                            <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar][exemplar.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="exemplar"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ExemplarController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{publicacao.destroy}">
                            <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar][exemplar.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="exemplar"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ExemplarController"/>
                        </h:commandLink>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
            <h:commandLink action="#{exemplar.remove}" value="Destroy">
                <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar][exemplar.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{exemplar.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][exemplar.exemplar][exemplar.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{exemplar.createSetup}" value="New Exemplar" />
            <br />
            <h:commandLink action="#{exemplar.listSetup}" value="Show All Exemplar Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
