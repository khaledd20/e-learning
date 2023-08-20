<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="bdUtil.sdamaterial" %>



<%
    String sda = request.getParameter("sda");
    String action = request.getParameter("action");

   sdamaterial dbConnect = new sdamaterial();

    if (action != null) {
        if (action.equals("add")) {
            dbConnect.addSda(sda);
        } else if (action.equals("sda")) {
            dbConnect.deleteSda(sda);
        }
    }
%>
<html>
<head>
<meta charset="ISO-8859-1">
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

<title>StudentSda</title>
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

<table id=myTable class="studentTable">
<thead>
<tr>
<th>Software design and architecture Course</th>
</tr>
</thead>
<tbody>
<tr>
<td><h3>Time table</h3></td>
</tr>
<tr>

<td><img src="images/timetable1.jpg" width="880 " height="238"/></td>

</tr>
<tr>
<td><a href="studentSdaAnnouncement.jsp">Announcements</a></td>
</tr>
<tr><td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">course Outline</a></td></tr>
<tr>
<td><h3>Lecture Notes</h3></td>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">chapter 1</a></td>
</tr>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">chapter 2</a></td>

</tr>

<tr>
<td><h3>Assignments</h3></td>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Assignment 1</a></td>

</tr>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Assignment 2</a></td>

</tr>

<tr>
<td><h3>Tests</h3></td>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Test 1</a></td>

</tr>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Quiz 2</a></td>

</tr>
<%
    ResultSet rs = dbConnect.getSda();
    while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("topic") %></td>
        
    </tr>
    <% } %>
</tbody>
</table>
       
   
</body>
</html>