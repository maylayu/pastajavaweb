<%-- 
    Document   : cale
    Created on : 3 de set. de 2021, 17:31:05
    Author     : yukii
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int dia=0, mes=0;
    String error = null;
    if(request.getParameter("dia")==null){
        error = "Não foi informado o parâmetro necessário 'dia'!";
    }else{
        try{
            dia = Integer.parseInt(request.getParameter("dia"));
        }catch(Exception e){
            error = "O valor informado como parâmetro Dia ('"+ request.getParameter("dia")+"') "
                    + "não é um número inteiro válido!";
        }
    }
    if(request.getParameter("mes")==null){
        error = "Não foi informado o parâmetro necessário 'mes'!";
    }else{
        try{
            mes = Integer.parseInt(request.getParameter("mes"));
        }catch(Exception e){
            error = "O valor informado como parâmetro Mês ('"+ request.getParameter("mes")+"') "
                    + "não é um número inteiro válido!";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendário</title>
    </head>
    <body>
        <h1></h1>
        <h4><a href="index.html">Voltar</a></h4>
        <hr>
        <%
            Calendar cal = Calendar.getInstance ();
            cal.add(dia, mes);
        %>
        <%if(error != null){%>
            <div style="color: red"><%=error %></div>
            <%}else{%>
            <table>
                <% for(int i=1; i<=10; i++){%>
                <tr>
                    <td> <%= dia %> </td>
                    <td>x</td>
                    <td> <%= i %> </td>
                    <td> = </td>
                    <td> <%= mes*i %> </td>
                </tr>
                <%}%>


            </table>
            <hr/>
        <%}%>
    </body>
</html>
