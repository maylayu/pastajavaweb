/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import web.MaylaDbListener;

/**
 *
 * @author yukii
 */
public class MaylaConnector {

    public static ArrayList<String> getTasks() throws Exception{
        ArrayList<String> list = new ArrayList<>();
        try (Connection con = MaylaDbListener.getConnection(); Statement stmt = con.createStatement(); 
                ResultSet rs = stmt.executeQuery("select * from mayla_tasks")) {
            while(rs.next()){
                list.add(rs.getString("title"));
            }
        }
        return list;
    }
    public static void addTask(String taskName) throws Exception{
        String usuario = request.getParameter("usuario");
        try (Connection con = MaylaDbListener.getConnection(); Statement stmt = con.createStatement()) {
            stmt.execute("insert into mayla_tasks values('null, "+taskName+", "+usuario+"')");
        }
    }
    public static void removeTask(String taskName) throws Exception{
        try (Connection con = MaylaDbListener.getConnection(); Statement stmt = con.createStatement()) {
            stmt.execute("delete from mayla_tasks where title = '"+taskName+"'");
        }
    }
}

