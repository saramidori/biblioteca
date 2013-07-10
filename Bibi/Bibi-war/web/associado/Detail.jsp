<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Associado Detail</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Associado Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Codigo:"/>
                <h:outputText value="#{associado.associado.codigo}" title="Codigo" />
                <h:outputText value="Nome:"/>
                <h:outputText value="#{associado.associado.nome}" title="Nome" />
                <h:outputText value="Endereco:"/>
                <h:outputText value="#{associado.associado.endereco}" title="Endereco" />
                <h:outputText value="Email:"/>
                <h:outputText value="#{associado.associado.email}" title="Email" />
                <h:outputText value="Status:"/>
                <h:outputText value="#{associado.associado.status}" title="Status" />

                <h:outputText value="EmprestimoCollection:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty associado.associado.emprestimoCollection}" value="(No Items)"/>
                    <h:dataTable value="#{associado.associado.emprestimoCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty associado.associado.emprestimoCollection}">
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
                                <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][associado.associado][associado.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprestimo.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="associado" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.AssociadoController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{emprestimo.editSetup}">
                                <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][associado.associado][associado.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprestimo.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="associado" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.AssociadoController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{emprestimo.destroy}">
                                <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][associado.associado][associado.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprestimo.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="associado" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.AssociadoController" />
                            </h:commandLink>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="ReservaCollection:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty associado.associado.reservaCollection}" value="(No Items)"/>
                    <h:dataTable value="#{associado.associado.reservaCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty associado.associado.reservaCollection}">
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
                                <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][associado.associado][associado.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="associado" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.AssociadoController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{reserva.editSetup}">
                                <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][associado.associado][associado.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="associado" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.AssociadoController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{reserva.destroy}">
                                <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][associado.associado][associado.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="associado" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.AssociadoController" />
                            </h:commandLink>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{associado.remove}" value="Destroy">
                <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][associado.associado][associado.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{associado.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][associado.associado][associado.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{associado.createSetup}" value="New Associado" />
            <br />
            <h:commandLink action="#{associado.listSetup}" value="Show All Associado Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
