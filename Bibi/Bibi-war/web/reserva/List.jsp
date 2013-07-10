<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Reserva Items</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing Reserva Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Reserva Items Found)<br />" rendered="#{reserva.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{reserva.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{reserva.pagingInfo.firstItem + 1}..#{reserva.pagingInfo.lastItem} of #{reserva.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{reserva.prev}" value="Previous #{reserva.pagingInfo.batchSize}" rendered="#{reserva.pagingInfo.firstItem >= reserva.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{reserva.next}" value="Next #{reserva.pagingInfo.batchSize}" rendered="#{reserva.pagingInfo.lastItem + reserva.pagingInfo.batchSize <= reserva.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{reserva.next}" value="Remaining #{reserva.pagingInfo.itemCount - reserva.pagingInfo.lastItem}"
                               rendered="#{reserva.pagingInfo.lastItem < reserva.pagingInfo.itemCount && reserva.pagingInfo.lastItem + reserva.pagingInfo.batchSize > reserva.pagingInfo.itemCount}"/>
                <h:dataTable value="#{reserva.reservaItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Codigo"/>
                        </f:facet>
                        <h:outputText value="#{item.codigo}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Data"/>
                        </f:facet>
                        <h:outputText value="#{item.data}">
                            <f:convertDateTime pattern="MM/dd/yyyy" />
                        </h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Status"/>
                        </f:facet>
                        <h:outputText value="#{item.status}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="CodigoAssoc"/>
                        </f:facet>
                        <h:outputText value="#{item.codigoAssoc}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Isbn"/>
                        </f:facet>
                        <h:outputText value="#{item.isbn}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{reserva.detailSetup}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{reserva.editSetup}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{reserva.remove}">
                            <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{reserva.createSetup}" value="New Reserva"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
