<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="controllers.LoginServlet" %>
<!DOCTYPE html>
<%
  Class.forName("com.mysql.jdbc.Driver");
String username = request.getParameter("username");
String password = request.getParameter("password");
Connection con = null;
PreparedStatement ps = null;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
            ps = con.prepareStatement("SELECT * FROM users ");
           
              ResultSet rs = ps.executeQuery();%>
            
<html>
<head>
<style>
h1,p {
    text-align: center;
   
}
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
table.adminTable {
  font-family: "Arial Black", Gadget, sans-serif;
  border: 8px solid #A40808;
  background-color: #EEE7DB;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
}
table.adminTable td, table.adminTable th {
  border: 1px solid #AAAAAA;
  padding: 9px 2px;
}
table.adminTable tbody td {
  font-size: 13px;
  font-weight: bold;
}
table.adminTable tr:nth-child(even) {
  background: #F5C8BF;
}
table.adminTable thead {
  background: #A40808;
  border-bottom: 0px solid #444444;
}
table.adminTable thead th {
  font-size: 19px;
  font-weight: bold;
  color: #FFFFFF;
  text-align: center;
  border-left: 2px solid #A40808;
}
table.adminTable thead th:first-child {
  border-left: none;
}

table.adminTable tfoot td {
  font-size: 13px;
}
table.adminTable tfoot .links {
  text-align: right;
}
table.adminTable tfoot .links a{
  display: inline-block;
  background: #FFFFFF;
  color: #A40808;
  padding: 2px 8px;
  border-radius: 5px;
}

</style>
<meta charset="ISO-8859-1">
<title>Profile</title>

</head>
<body  >
%>
<table class="adminTable">
<thead>
<tr>
<th>
<h1>Profile</h1>
<img src="images/profile.png" class="center"width="100 " height="238"/>
<p>Detail</p> </th>


</tr>
<%
    
    while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("username") %></td>
        <td><%= rs.getString("role") %></td>
    </tr>
    <% } %>
</tbody>

</table>


 


</body>
</html>