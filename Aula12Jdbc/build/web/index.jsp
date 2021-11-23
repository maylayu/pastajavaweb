<%-- 
    Document   : index
    Created on : 8 de nov. de 2021, 19:33:31
    Author     : rlarg
--%>

<%@page import="db.TasksConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="web.DbListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Exception requestException = null;
    ArrayList<String> taskList = new ArrayList<>();
    try{
        if(request.getParameter("add")!=null){
            String taskName = request.getParameter("taskName");
            TasksConnector.addTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        if(request.getParameter("remove")!=null){
            String taskName = request.getParameter("taskName");
            TasksConnector.removeTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        taskList = TasksConnector.getTasks();
    }catch(Exception ex){
        requestException = ex;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JDBC - To-do list</title>
    </head>
    <body>
        <h1>JDBC - Prof. Ricardo Pupo Larguesa</h1>
        <h2>To-do list</h2>
        <%if(DbListener.exception!=null){%>
        <div style="color:red">
            Erro na criação do BD: <%= DbListener.exception.getMessage()%>
        </div>
        <%}%>
        <%if(requestException!=null){%>
        <div style="color:red">
            Erro na leitura ou gravação das tarefas: <%= requestException.getMessage()%>
        </div>
        <%}%>
        
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
    </body>
</html>
