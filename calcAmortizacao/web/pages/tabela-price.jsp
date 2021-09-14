<%-- 
    Document   : tabela-price
    Created on : 13 de set. de 2021, 19:56:41
    Author     : mayla
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    double meses=0, val=0, ju=0, umm=0, parcel=0, juros=0, amor=0;
    String error = null;
    if(request.getParameter("meses")==null){
        error = "Precisa determinar os meses!";
    }else{
        try{
            meses = Double.parseDouble(request.getParameter("meses"));
        }catch(Exception e){
            error = "Valor ('"+ request.getParameter("meses")+"') "
                    + "não é válido!";
        }
    }
    if(request.getParameter("val")==null){
        error = "Precisa determinar o valor!";
    }else{
        try{
            val = Double.parseDouble(request.getParameter("val"));
        }catch(Exception e){
            error = "Valor ('"+ request.getParameter("val")+"') "
                    + "não é válido!";
        }
    }
    if(request.getParameter("ju")==null){
        error = "Precisa determinar os juros!";
    }else{
        try{
            ju = Double.parseDouble(request.getParameter("ju"));
        }catch(Exception e){
            error = "Valor ('"+ request.getParameter("ju")+"') "
                    + "não é válido!";
        }
    }
    ju = ju/100;
    umm = 1 + ju;
    parcel = val*(Math.pow(umm,meses)*ju / (Math.pow(umm, meses)-1));
    DecimalFormat df = new DecimalFormat("###,##0.00");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto Amortização</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <h2>Início</h2>
        <div>
            <form action="tabela-price.jsp">
                <label>Meses</label><input type="number" name="meses"/><br>
                <label>Valor</label><input type="number" name="val"/><br>
                <label>Juros</label><input type="number" name="ju"/><br>
                <input type="submit" value="Gerar Tabela"/>
            </form>
            <br>
            <table>
                <tr>
                    <th>Período</th>
                    <th>Saldo Devedor</th>
                    <th>Parcela</th>
                    <th>Juros</th>
                    <th>Amortização</th>
                </tr>
                <tr>
                    <td>0</td>
                    <td><%= df.format(val)%></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <% for(int i=1; i<=meses; i++){
                    juros = val * ju;
                    amor = parcel - (val * ju); 
                    val = val - amor; %>
                <tr>
                    <td> <%= i %> </td>
                    <td><%= df.format(val)%></td>
                    <td><%= df.format(parcel) %></td>
                    <td><%= df.format(juros) %></td>
                    <td><%= df.format(amor) %></td>
                </tr>
                <%}%>
            </table>
        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
