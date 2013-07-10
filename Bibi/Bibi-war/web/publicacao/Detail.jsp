<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Publicacao Detail</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Publicacao Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Isbn:"/>
                <h:outputText value="#{publicacao.publicacao.isbn}" title="Isbn" />
                <h:outputText value="Titulo:"/>
                <h:outputText value="#{publicacao.publicacao.titulo}" title="Titulo" />
                <h:outputText value="Autor:"/>
                <h:outputText value="#{publicacao.publicacao.autor}" title="Autor" />
                <h:outputText value="Editora:"/>
                <h:outputText value="#{publicacao.publicacao.editora}" title="Editora" />

                <h:outputText value="ExemplarCollection:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty publicacao.publicacao.exemplarCollection}" value="(No Items)"/>
                    <h:dataTable value="#{publicacao.publicacao.exemplarCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty publicacao.publicacao.exemplarCollection}">
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
                                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][exemplar.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="publicacao" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.PublicacaoController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{exemplar.editSetup}">
                                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][exemplar.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="publicacao" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.PublicacaoController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{exemplar.destroy}">
                                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentExemplar" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][exemplar.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="publicacao" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.PublicacaoController" />
                            </h:commandLink>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>
                <h:outputText value="ReservaCollection:" />
                <h:panelGroup>
                    <h:outputText rendered="#{empty publicacao.publicacao.reservaCollection}" value="(No Items)"/>
                    <h:dataTable value="#{publicacao.publicacao.reservaCollection}" var="item" 
                                 border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                 rendered="#{not empty publicacao.publicacao.reservaCollection}">
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
                                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="publicacao" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.PublicacaoController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{reserva.editSetup}">
                                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="publicacao" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.PublicacaoController" />
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{reserva.destroy}">
                                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentReserva" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reserva.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="publicacao" />
                                <f:param name="jsfcrud.relatedControllerType" value="view.PublicacaoController" />
                            </h:commandLink>
                        </h:column>
                    </h:dataTable>
                </h:panelGroup>

            </h:panelGrid>
            <br />
            <h:commandLink action="#{publicacao.remove}" value="Destroy">
                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{publicacao.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentPublicacao" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][publicacao.publicacao][publicacao.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{publicacao.createSetup}" value="New Publicacao" />
            <br />
            <h:commandLink action="#{publicacao.listSetup}" value="Show All Publicacao Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
