package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	PrintWriter pw = response.getWriter();
    	String username = request.getParameter("username");
        String password = request.getParameter("password");
        Connection con = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
            ps = con.prepareStatement("SELECT * FROM users WHERE username = ? and password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	String role = rs.getString("role");
            	if (role.equals("admin")) {
            	    response.sendRedirect("adminCourses.jsp");
            	} else if (role.equals("lecturer")) {
            	    response.sendRedirect("lecturerCourses.jsp");
            	} else if (role.equals("student")) {
            	    response.sendRedirect("studentCourses.jsp");
            	}
                ///response.sendRedirect("welcome.jsp");
            } else {
            	/*pw.println("<h1 style=\"color:red;\">Invalid username or password. Please try again...<br></h1>");
            	response.sendRedirect("login.jsp");*/
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}