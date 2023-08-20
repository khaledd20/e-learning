package bdUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class stuDb
 */
@WebServlet("/stuDb")
public class stuDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stuname=request.getParameter("stuname[]");
		String stuno=request.getParameter("matric[]");
		String stuemail=request.getParameter("email[]");
		String stupwd=request.getParameter("pass[]");
		String faculty=request.getParameter("faculty");
		String gender=request.getParameter("gender");
		RequestDispatcher dispatcher=null;
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase","root","");
			PreparedStatement pst=con.prepareStatement("insert into students(uname,upwd,uemail,matricno,faculty,gender)value (?,?,?,?,?,?)");
			pst.setString(1,stuname);
			pst.setString(2, stupwd);
			pst.setString(3, stuemail);
			pst.setString(4, stuno);
			pst.setString(5,faculty );
			pst.setString(6, gender);
			
			
			int rowCount=pst.executeUpdate();
			dispatcher=request.getRequestDispatcher("Registration.jsp");
			if(rowCount>0) {
				request.setAttribute("status", "success");
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request,response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
