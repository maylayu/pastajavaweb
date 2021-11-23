<%-- 
    Document   : index
    Created on : 13 de set. de 2021, 19:56:07
    Author     : mayla
--%>
<%@page import="web.MaylaDbListener"%>
<%@page import="db.MaylaConnector"%>
<%@page import="java.util.ArrayList"%>
<%
String usuario = request.getParameter("usuario");
    if(usuario != null){
        session.setAttribute("usuario", usuario);
    }
    //Processamento do contado r de requisições
    Exception requestException = null;
    ArrayList<String> taskList = new ArrayList<>();
    try{
        if(request.getParameter("add")!=null){
            String taskName = request.getParameter("taskName");
            MaylaConnector.addTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        if(request.getParameter("remove")!=null){
            String taskName = request.getParameter("taskName");
            MaylaConnector.removeTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        taskList = MaylaConnector.getTasks();
    }catch(Exception ex){
        requestException = ex;
    }
    //Leitura dos atributos
    String requestUsuario = (String) request.getAttribute("usuario");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
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
                
        
        <form>
            <input type="text" name="taskName"/>
            <input type="submit" name="add" value="+"/>
        </form>
        
        <table>
            <%for(String taskName: taskList){%>
            <tr>
                <td><%= taskName %></td>
                <td>
                    <form>
                        <input type="hidden" name="taskName" value="<%= taskName %>"/>
                        <input type="submit" name="remove" value="-"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
        <%}else{%>
        <h2>Inicio</h2>
        <%}%>
        
        
       
    </body>
</html>
