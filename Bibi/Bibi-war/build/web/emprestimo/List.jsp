<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Emprestimo Items</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing Emprestimo Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Emprestimo Items Found)<br />" rendered="#{emprestimo.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{emprestimo.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{emprestimo.pagingInfo.firstItem + 1}..#{emprestimo.pagingInfo.lastItem} of #{emprestimo.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{emprestimo.prev}" value="Previous #{emprestimo.pagingInfo.batchSize}" rendered="#{emprestimo.pagingInfo.firstItem >= emprestimo.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{emprestimo.next}" value="Next #{emprestimo.pagingInfo.batchSize}" rendered="#{emprestimo.pagingInfo.lastItem + emprestimo.pagingInfo.batchSize <= emprestimo.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{emprestimo.next}" value="Remaining #{emprestimo.pagingInfo.itemCount - emprestimo.pagingInfo.lastItem}"
                               rendered="#{emprestimo.pagingInfo.lastItem < emprestimo.pagingInfo.itemCount && emprestimo.pagingInfo.lastItem + emprestimo.pagingInfo.batchSize > emprestimo.pagingInfo.itemCount}"/>
                <h:dataTable value="#{emprestimo.emprestimoItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Codigo"/>
                        </f:facet>
                        <h:outputText value="#{item.codigo}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="NroExemplar"/>
                        </f:facet>
                        <h:outputText value="#{item.nroExemplar}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Isbn"/>
                        </f:facet>
                        <h:outputText value="#{item.isbn}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="DataEmp"/>
                        </f:facet>
                        <h:outputText value="#{item.dataEmp}">
                            <f:convertDateTime pattern="MM/dd/yyyy" />
                        </h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="DataDevol"/>
                        </f:facet>
                        <h:outputText value="#{item.dataDevol}">
                            <f:convertDateTime pattern="MM/dd/yyyy" />
                        </h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="CodigoAssoc"/>
                        </f:facet>
                        <h:outputText value="#{item.codigoAssoc}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{emprestimo.detailSetup}">
                            <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprestimo.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{emprestimo.editSetup}">
                            <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprestimo.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{emprestimo.remove}">
                            <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprestimo.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{emprestimo.createSetup}" value="New Emprestimo"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
