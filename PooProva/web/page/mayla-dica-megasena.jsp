<%-- 
    Document   : mayla
    Created on : 4 de out. de 2021, 17:30:49
    Author     : mayla

1.	Quando houver uma sessão identificada, seu número de matrícula, 
seu nome completo, o semestre em que ingressou na Fatec, o link de seu perfil 
no GitHub e uma tabela com as disciplinas que você está cursando neste semestre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <%if (sessionUsuario==null) {%>
        <div style="color: red">Essa página é restrita a usuários!</div>
        <%}else{%>
        <h2>Números Premiados!!</h2>
        <table border="2">
            <tr>
                <th>Números</th>
                <%for(int i=0; i<6; i++) {%>
                <th><%= ((int)(Math.random()*100)) %></th>
                <%}%>
            </tr>
            
        </table>
        <%}%>
        
    </body>
</html>
