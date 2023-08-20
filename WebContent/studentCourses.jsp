<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="bdUtil.DatabaseCourse" %>

<%
    String courseName = request.getParameter("courseName");
    String action = request.getParameter("action");

    DatabaseCourse dbConnect = new DatabaseCourse();

    if (action != null) {
        if (action.equals("add")) {
            dbConnect.addCourse(courseName);
        } else if (action.equals("delete")) {
            dbConnect.deleteCourse(courseName);
        }
    }
%>



<html>
<style>
  
 header ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #A40808;
}

header li {
  float: right;
}
header .active {
  background-color: #04AA6D;
}

header li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

header li a:hover {
  background-color: #111;
}
 
 
 
 table.studentTable {
  font-family: "Arial Black", Gadget, sans-serif;
  border: 8px solid #A40808;
  background-color: #EEE7DB;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
}
table.studentTable td, table.studentTable th {
  border: 1px solid #AAAAAA;
  padding: 9px 2px;
}
table.studentTable tbody td {
  font-size: 13px;
  font-weight: bold;
}
table.studentTable tr:nth-child(even) {
  background: #F5C8BF;
}
</style>
<head>

    <title>Course Management</title>
</head>
<body>
<header>

<ul>
  <li><a href="loginPage.jsp">Logout</a></li>
  <li><a href="Profile.jsp">Profile</a></li>
  <li><a href="studentReport.jsp">report</a></li>
  <li><a href="studentCourses.jsp">Courses</a></li>
  <li><a href="studentFaculty.jsp">Faculty</a></li>
</ul>

</header>

<table id="myTable" class="studentTable">
    <tr>
        <th>Course Name</th>
    </tr>
    <tr>
    <td><a id="row1" href="studentIP.jsp">Internet programming</a></td>
    </tr>
    <tr>
	<td><a href="studentSDA.jsp">Software design and architecture</a></td>
    </tr>
    <%
    ResultSet rs = dbConnect.getCourses();
    while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("name") %></td>
        
    </tr>
    <% } %>
</table>

   
</body>
</html>
