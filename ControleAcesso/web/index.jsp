<%-- 
    Document   : index
    Created on : 13 de set. de 2021, 19:56:07
    Author     : mayla
--%>
<%
String usuario = request.getParameter("usuario");
    if(usuario != null){
        session.setAttribute("usuario", usuario);
        session.setAttribute("counter", 1);
    }
    //Processamento do contador de requisições
    
    //Leitura dos atributos
    String requestUsuario = (String) request.getAttribute("usuario");
   
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto Controle de Acesso</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/MaylaApp.jspf" %>
        <%if(requestUsuario!=null){%>
            <div>Acesse já seus números premiados!</div>
            
        <%}else if(sessionUsuario!=null){%>
            <h2>Acesse já seus números premiados!</h2>
        <%}else{%>
        <h2>Inicio</h2>
        <%}%>
        
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
