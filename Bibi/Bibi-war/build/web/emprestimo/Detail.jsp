<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Emprestimo Detail</title>
            <link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Emprestimo Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Codigo:"/>
                <h:outputText value="#{emprestimo.emprestimo.codigo}" title="Codigo" />
                <h:outputText value="NroExemplar:"/>
                <h:outputText value="#{emprestimo.emprestimo.nroExemplar}" title="NroExemplar" />
                <h:outputText value="Isbn:"/>
                <h:outputText value="#{emprestimo.emprestimo.isbn}" title="Isbn" />
                <h:outputText value="DataEmp:"/>
                <h:outputText value="#{emprestimo.emprestimo.dataEmp}" title="DataEmp" >
                    <f:convertDateTime pattern="MM/dd/yyyy" />
                </h:outputText>
                <h:outputText value="DataDevol:"/>
                <h:outputText value="#{emprestimo.emprestimo.dataDevol}" title="DataDevol" >
                    <f:convertDateTime pattern="MM/dd/yyyy" />
                </h:outputText>
                <h:outputText value="CodigoAssoc:"/>
                <h:panelGroup>
                    <h:outputText value="#{emprestimo.emprestimo.codigoAssoc}"/>
                    <h:panelGroup rendered="#{emprestimo.emprestimo.codigoAssoc != null}">
                        <h:outputText value=" ("/>
                        <h:commandLink value="Show" action="#{associado.detailSetup}">
                            <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprestimo.emprestimo][emprestimo.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprestimo.emprestimo.codigoAssoc][associado.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="emprestimo"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.EmprestimoController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{associado.editSetup}">
                            <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprestimo.emprestimo][emprestimo.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprestimo.emprestimo.codigoAssoc][associado.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="emprestimo"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.EmprestimoController"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{associado.destroy}">
                            <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprestimo.emprestimo][emprestimo.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.currentAssociado" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprestimo.emprestimo.codigoAssoc][associado.converter].jsfcrud_invoke}"/>
                            <f:param name="jsfcrud.relatedController" value="emprestimo"/>
                            <f:param name="jsfcrud.relatedControllerType" value="view.EmprestimoController"/>
                        </h:commandLink>
                        <h:outputText value=" )"/>
                    </h:panelGroup>
                </h:panelGroup>


            </h:panelGrid>
            <br />
            <h:commandLink action="#{emprestimo.remove}" value="Destroy">
                <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprestimo.emprestimo][emprestimo.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{emprestimo.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentEmprestimo" value="#{jsfcrud_class['view.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprestimo.emprestimo][emprestimo.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{emprestimo.createSetup}" value="New Emprestimo" />
            <br />
            <h:commandLink action="#{emprestimo.listSetup}" value="Show All Emprestimo Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
