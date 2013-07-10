<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Funcionario Items</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing Funcionario Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Funcionario Items Found)<br />" rendered="#{funcionario.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{funcionario.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{funcionario.pagingInfo.firstItem + 1}..#{funcionario.pagingInfo.lastItem} of #{funcionario.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{funcionario.prev}" value="Previous #{funcionario.pagingInfo.batchSize}" rendered="#{funcionario.pagingInfo.firstItem >= funcionario.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{funcionario.next}" value="Next #{funcionario.pagingInfo.batchSize}" rendered="#{funcionario.pagingInfo.lastItem + funcionario.pagingInfo.batchSize <= funcionario.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{funcionario.next}" value="Remaining #{funcionario.pagingInfo.itemCount - funcionario.pagingInfo.lastItem}"
                               rendered="#{funcionario.pagingInfo.lastItem < funcionario.pagingInfo.itemCount && funcionario.pagingInfo.lastItem + funcionario.pagingInfo.batchSize > funcionario.pagingInfo.itemCount}"/>
                <h:dataTable value="#{funcionario.funcionarioItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                            <h:outputText value="Funcao"/>
                        </f:facet>
                        <h:outputText value="#{item.funcao}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Email"/>
                        </f:facet>
                        <h:outputText value="#{item.email}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{funcionario.detailSetup}">
                            <f:param name="jsfcrud.currentFuncionario" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][funcionario.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{funcionario.editSetup}">
                            <f:param name="jsfcrud.currentFuncionario" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][funcionario.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{funcionario.remove}">
                            <f:param name="jsfcrud.currentFuncionario" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][funcionario.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{funcionario.createSetup}" value="New Funcionario"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
