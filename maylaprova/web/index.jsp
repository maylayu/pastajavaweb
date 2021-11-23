<%-- 
    Document   : index
    Created on : 22 de nov. de 2021, 20:27:53
    Author     : yukii
--%>

<%
String usuario = request.getParameter("usuario");
    if(usuario != null){
        session.setAttribute("usuario", usuario);
    }
    //Processamento do contado r de requisições
    
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
        <%@include file="WEB-INF/header.jspf" %>
        <%if(requestUsuario!=null){%>
            <div>Seja bem-vindo!</div>
            
            
            
        <%}else if(sessionUsuario !=null){%>
            <div><h2>Seja bem-vindo!</h2></div>
            <table border='2'>
                <tr>
                    <th>Usuario</th>
                    <th><%= sessionUsuario %></th>
                </tr>
            </table>
        <%}else{%>
        <h2>Inicio</h2>
        <%}%>
        
        
       
    </body>
</html>

