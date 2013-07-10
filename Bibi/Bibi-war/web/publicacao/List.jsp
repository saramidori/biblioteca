<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Publicacao Items</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing Publicacao Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Publicacao Items Found)<br />" rendered="#{publicacao.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{publicacao.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{publicacao.pagingInfo.firstItem + 1}..#{publicacao.pagingInfo.lastItem} of #{publicacao.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{publicacao.prev}" value="Previous #{publicacao.pagingInfo.batchSize}" rendered="#{publicacao.pagingInfo.firstItem >= publicacao.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{publicacao.next}" value="Next #{publicacao.pagingInfo.batchSize}" rendered="#{publicacao.pagingInfo.lastItem + publicacao.pagingInfo.batchSize <= publicacao.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{publicacao.next}" value="Remaining #{publicacao.pagingInfo.itemCount - publicacao.pagingInfo.lastItem}"
                               rendered="#{publicacao.pagingInfo.lastItem < publicacao.pagingInfo.itemCount && publicacao.pagingInfo.lastItem + publicacao.pagingInfo.batchSize > publicacao.pagingInfo.itemCount}"/>
                <h:dataTable value="#{publicacao.publicacaoItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Isbn"/>
                        </f:facet>
                        <h:outputText value="#{item.isbn}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Titulo"/>
                        </f:facet>
                        <h:outputText value="#{item.titulo}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Autor"/>
                        </f:facet>
                        <h:outputText value="#{item.autor}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Editora"/>
                        </f:facet>
                        <h:outputText value="#{item.editora}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{publicacao.detailSetup}">
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][publicacao.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{publicacao.editSetup}">
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][publicacao.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{publicacao.remove}">
                            <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][publicacao.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{publicacao.createSetup}" value="New Publicacao"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
