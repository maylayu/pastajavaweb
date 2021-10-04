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
        <h1>Informações do Aluno</h1><br>
        <label>Matrícula: 1290482013059	</label><br>
        <label>Nome: Mayla Santos do Amaral</label><br>
        <label>Início: 01/2020 </label><br>
        <label>GitHub: https://github.com/maylayu</label><br>
        <table border="2">
            <tr>
                <th>Disciplinas</th>
            </tr>
            <tr>
                <th>Programação Orientada a Objeto</th>
            </tr>
            <tr>
                <th>Banco de Dados</th>
            </tr>
            <tr>
                <th>Engenharia de Software III</th>
            </tr>
            <tr>
                <th>Linguagem de Programação</th>
            </tr>
            <tr>
                <th>Segurança da Informação</th>
            </tr>
            <tr>
                <th>Sistemas Operacionais</th>
            </tr>
            <tr>
                <th>Metodologia</th>
            </tr>
        </table>
        <%}%>
        
    </body>
</html>
