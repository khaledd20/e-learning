package bdUtil;

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


public class DatabaseFaculty {
    // JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/mydatabase";

    //  Database credentials
    static final String USER = "your_username";
    static final String PASS = "your_password";


    public void addFaculty(String facultyName) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:/mydatabase", "root", "");

            // Execute a query
            String sql = "INSERT INTO faculty (name) VALUES (?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, facultyName);
            stmt.executeUpdate();

            System.out.println("Faculty added successfully to the database");
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

    public void deleteFaculty(String facultyName) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:/mydatabase", "root", "");

            // Execute a query
            String sql = "DELETE FROM faculty WHERE name = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, facultyName);
            stmt.executeUpdate();

            System.out.println("Faculty deleted successfully from the database");
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
    
    public ResultSet getfaculty() {
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
        String sql = "SELECT * FROM faculty";
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

