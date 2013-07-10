<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Exemplar Items</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing Exemplar Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Exemplar Items Found)<br />" rendered="#{exemplar.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{exemplar.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{exemplar.pagingInfo.firstItem + 1}..#{exemplar.pagingInfo.lastItem} of #{exemplar.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{exemplar.prev}" value="Previous #{exemplar.pagingInfo.batchSize}" rendered="#{exemplar.pagingInfo.firstItem >= exemplar.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{exemplar.next}" value="Next #{exemplar.pagingInfo.batchSize}" rendered="#{exemplar.pagingInfo.lastItem + exemplar.pagingInfo.batchSize <= exemplar.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{exemplar.next}" value="Remaining #{exemplar.pagingInfo.itemCount - exemplar.pagingInfo.lastItem}"
                               rendered="#{exemplar.pagingInfo.lastItem < exemplar.pagingInfo.itemCount && exemplar.pagingInfo.lastItem + exemplar.pagingInfo.batchSize > exemplar.pagingInfo.itemCount}"/>
                <h:dataTable value="#{exemplar.exemplarItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Numero"/>
                        </f:facet>
                        <h:outputText value="#{item.exemplarPK.numero}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Preco"/>
                        </f:facet>
                        <h:outputText value="#{item.preco}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Publicacao"/>
                        </f:facet>
                        <h:outputText value="#{item.publicacao}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{exemplar.detailSetup}">
                            <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][exemplar.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{exemplar.editSetup}">
                            <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][exemplar.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{exemplar.remove}">
                            <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][exemplar.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{exemplar.createSetup}" value="New Exemplar"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
