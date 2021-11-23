/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author yukii
 */
public class MaylaDbListener implements ServletContextListener {
public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:to-do.db";
    
    public static Exception exception = null;

    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Class.forName(CLASS_NAME);
            try (Connection con = getConnection(); Statement stmt = con.createStatement()) {
                stmt.execute("create table if not exists mayla_tasks("
                        + "id int not null"
                        + "title varchar"
                        + "user"
                        + ")");
            } catch (Exception ex) {
                Logger.getLogger(MaylaDbListener.class.getName()).log(Level.SEVERE, null, ex);
            }
        }catch(ClassNotFoundException ex){
            exception = ex;
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
