/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;

/**
 *
 * @author imrya
 */
public class ConnectionProvider {

    private static Connection con;
    final static String URL = "jdbc:mysql://localhost:3306/techblog";
    final static String USERNAME = "root";
    final static String PASSWORD = "root";

    public static Connection getConnection() {

        try {

            if (con == null) {
                //driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");

                //create connection
                con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                //Create Statement
//                Statement smt = con.createStatement();
                //ResultSet rs = smt.executeQuery("select * from Student");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
