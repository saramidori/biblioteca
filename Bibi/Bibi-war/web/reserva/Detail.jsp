<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Reserva Detail</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Reserva Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Codigo:"/>
                <h:outputText value="#{reserva.reserva.codigo}" title="Codigo" />
                <h:outputText value="Data:"/>
                <h:outputText value="#{reserva.reserva.data}" title="Data" >
                    <f:convertDateTime pattern="MM/dd/yyyy" />
                </h:outputText>
                <h:outputText value="Status:"/>
                <h:outputText value="#{reserva.reserva.status}" title="Status" />
                <h:outputText value="CodigoAssoc:"/>
                <h:panelGroup>
                    <h:outputText value="#{reserva.reserva.codigoAssoc}"/>
                    <h:panelGroup rendered="#{reserva.reserva.codigoAssoc != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Show" action="#{associado.detailSetup}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva][reserva.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva.codigoAssoc][associado.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="reserva"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ReservaController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{associado.editSetup}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva][reserva.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva.codigoAssoc][associado.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="reserva"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ReservaController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{associado.destroy}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva][reserva.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva.codigoAssoc][associado.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="reserva"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ReservaController"/>
                        </h:commandLink>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>
                <h:outputText value="Isbn:"/>
                <h:panelGroup>
                    <h:outputText value="#{reserva.reserva.isbn}"/>
                    <h:panelGroup rendered="#{reserva.reserva.isbn != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Show" action="#{publicacao.detailSetup}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva][reserva.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva.isbn][publicacao.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="reserva"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ReservaController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{publicacao.editSetup}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva][reserva.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva.isbn][publicacao.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="reserva"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ReservaController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{publicacao.destroy}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva][reserva.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva.isbn][publicacao.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="reserva"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.ReservaController"/>
                        </h:commandLink>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
            <h:commandLink action="#{reserva.remove}" value="Destroy">
                <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva][reserva.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{reserva.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reserva.reserva][reserva.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{reserva.createSetup}" value="New Reserva" />
            <br />
            <h:commandLink action="#{reserva.listSetup}" value="Show All Reserva Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
