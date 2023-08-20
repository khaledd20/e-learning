package controllers;

import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class IpCourse {
    // JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/mydatabase";

    //  Database credentials
    static final String USER = "your_username";
    static final String PASS = "your_password";


    public void addCourse(String courseMaterial) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:/mydatabase", "root", "");

            // Execute a query
            String sql = "INSERT INTO IpCourse (name) VALUES (?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, courseMaterial);
            stmt.executeUpdate();

            System.out.println("Course added successfully to the database");
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            // finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se) {
            } // do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            } // end finally try
        }
    }

    public void deleteCourse(String courseMaterial) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:/mydatabase", "root", "");

            // Execute a query
            String sql = "DELETE FROM IpCourse WHERE name = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, courseMaterial);
            stmt.executeUpdate();

            System.out.println("Course deleted successfully from the database");
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            // finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se) {
            } // do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            } // end finally try
        }
    }
    
    public ResultSet getIpCourse() {
    	Connection conn = null;
    	Statement stmt = null;
    	ResultSet rs = null;
    	try {
    	// Register JDBC driver
    	Class.forName("com.mysql.jdbc.Driver");
    	 // Open a connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:/mydatabase", "root", "");

        // Execute a query
        stmt = conn.createStatement();
        String sql = "SELECT * FROM IpCourse";
        rs = stmt.executeQuery(sql);
    } catch (SQLException se) {
        // Handle errors for JDBC
        se.printStackTrace();
    } catch (Exception e) {
        // Handle errors for Class.forName
        e.printStackTrace();
    } 
    return rs;
    }


    
}

