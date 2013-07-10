<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Associado Items</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing Associado Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Associado Items Found)<br />" rendered="#{associado.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{associado.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{associado.pagingInfo.firstItem + 1}..#{associado.pagingInfo.lastItem} of #{associado.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{associado.prev}" value="Previous #{associado.pagingInfo.batchSize}" rendered="#{associado.pagingInfo.firstItem >= associado.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{associado.next}" value="Next #{associado.pagingInfo.batchSize}" rendered="#{associado.pagingInfo.lastItem + associado.pagingInfo.batchSize <= associado.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{associado.next}" value="Remaining #{associado.pagingInfo.itemCount - associado.pagingInfo.lastItem}"
                               rendered="#{associado.pagingInfo.lastItem < associado.pagingInfo.itemCount && associado.pagingInfo.lastItem + associado.pagingInfo.batchSize > associado.pagingInfo.itemCount}"/>
                <h:dataTable value="#{associado.associadoItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Codigo"/>
                        </f:facet>
                        <h:outputText value="#{item.codigo}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Nome"/>
                        </f:facet>
                        <h:outputText value="#{item.nome}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Endereco"/>
                        </f:facet>
                        <h:outputText value="#{item.endereco}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Email"/>
                        </f:facet>
                        <h:outputText value="#{item.email}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Status"/>
                        </f:facet>
                        <h:outputText value="#{item.status}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{associado.detailSetup}">
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][associado.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{associado.editSetup}">
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][associado.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{associado.remove}">
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][associado.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{associado.createSetup}" value="New Associado"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
