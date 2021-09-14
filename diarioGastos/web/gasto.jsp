<%-- 
    Document   : gasto
    Created on : 31 de ago. de 2021, 20:50:18
    Author     : yukii
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int val=5;
    String error=null, prod = null, nec=null;
    if(request.getParameter("prod")==null){
        error = "Não foi informado o parâmetro necessário 'Produto'!";
    }else{
        try{
            prod = request.getParameter("prod"));
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("val")==null){
        error = "Não foi informado o parâmetro necessário 'Valor'!";
    }else{
        try{
            val = Integer.parseInt(request.getParameter("val"));
        }catch(Exception e){
            error = e.getMessage();
        }
    }
    if(request.getParameter("nec")==null){
        error = "Não foi informado o parâmetro 'Foi necessário?'!";
    }else{
        try{
            nec = Integer.parseInt(request.getParameter("nec"));
        }catch(Exception e){
            error = e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mais um gasto!</h1>
        <h3>Feito!</h3>
        <h4><a href="index.html">Voltar</a></h4>
        <hr>
        <%if(error != null){%>
        <div style="color: red"><%=error %></div>
        <%}else{%>
        <table>
            <% for(int i=1; i<=10; i++){%>
            <tr>
                <th>Produto</th>
                <th>Valor</th>
                <th>Necessário</th>
            </tr>
            <tr>
                <td> <%= prod %> </td>
                <td> <%= val %> </td>
                <td> <%= nec %> </td>
            </tr>
            <%}%>

            
        </table>
        <hr/>
        <%}%>
    </body>
</html>
