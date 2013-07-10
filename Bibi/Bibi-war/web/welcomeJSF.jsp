<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
<link rel="stylesheet" type="text/css" href="/Bibi-war/faces/jsfcrud.css" />
        </head>
        <body>
            <h1><h:outputText value="JavaServer Faces"/></h1>
                <h:form>
                    <h:commandLink action="#{reserva.listSetup}" value="Show All Reserva Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{publicacao.listSetup}" value="Show All Publicacao Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{funcionario.listSetup}" value="Show All Funcionario Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{exemplar.listSetup}" value="Show All Exemplar Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{emprestimo.listSetup}" value="Show All Emprestimo Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{associado.listSetup}" value="Show All Associado Items"/>
                </h:form>

        </body>
    </html>
</f:view>
