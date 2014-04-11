package com.kimfashion.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HKA
 */
public class DBUtils {

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String host = "jdbc:mysql://localhost:3306/kimfashion?useUnicode=true&characterEncoding=utf-8";
            String userName = "root";
            String password = "";
            conn = DriverManager.getConnection(host, userName, password);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return conn;
    }

    public static void closeAll(Connection conn, PreparedStatement stm, ResultSet rs) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                System.out.println(ex.getErrorCode() + ": " + ex.getSQLState() + ": " + ex.getMessage());
            }
        }
        if (stm != null) {
            try {
                stm.close();
            } catch (SQLException ex) {
                System.out.println(ex.getErrorCode() + ": " + ex.getSQLState() + ": " + ex.getMessage());
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException ex) {
                System.out.println(ex.getErrorCode() + ": " + ex.getSQLState() + ": " + ex.getMessage());
            }
        }
    }
}
