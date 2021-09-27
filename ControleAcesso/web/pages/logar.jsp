<%-- 
    Document   : index
    Created on : 13 de set. de 2021, 19:56:07
    Author     : mayla
--%>
<%
    String usuario = request.getParameter("usuario");
    String senha = request.getParameter("senha");
    if(usuario != null && senha!=null){
        session.setAttribute("usuario", usuario);
        session.setAttribute("senha", senha);
        session.setAttribute("counter", 1);
    }
    //Processamento do contador de requisições
    
    //Leitura dos atributos
    String requestUsuario = (String) request.getAttribute("usuario");
    String sessionUsuario = (String) session.getAttribute("usuario");
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto Controle de Acesso</title>
    </head>
    
        <%@include file="../WEB-INF/jspf/MaylaApp.jspf"%>
        <%if(sessionName==null){%>
            <div style="color:red">Você não tem permissão para acessar essa página</div>
        <%}else{%>
            <h2>Seus números</h2>
        <div>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Número</th>
            </tr>
            <% for(int i=1; i<=6; i++){%>
            <tr>
                <td> <%= i %> </td>
                <td><%= ((int)(Math.random()*100))%></td>
            </tr>
            <%}%>
        </table>
        <%}%>
       
        <%if(requestUsuario!=null){%>
            <hr/>
            <div>Bem-vindo: <%= requestUsuario %></div>
        <%}else if(sessionUsuario!=null){%>
            <hr/>
            <h2>Sessão</h2>
            <h3>Bem-vindo <%= sessionUsuario %></h3>
        <%}else{}%>
        <h4><a href="../index.jsp">Voltar</a></h4>
        <hr/>
        </div>
        
        <%@include file="../WEB-INF/jspf/footer.jspf" %>
    
