/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ACER
 */
public class DBConnection {

    private static Connection conn = null;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://RITAKA-LAPTOP\\SQLEXPRESS:1433;databaseName=FinalProject_Gr4;user=sa;password=1;encrypt=true;trustServerCertificate=true";
        conn = DriverManager.getConnection(url);
        return conn;

    }

    public static void closeConnection() throws SQLException {
        if (!conn.isClosed()) {
            conn.close();
        }
    }

}
