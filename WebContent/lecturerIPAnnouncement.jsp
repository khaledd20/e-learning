<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="bdUtil.DatabaseIpAnnouncement" %>

<%
    String announcementName = request.getParameter("announcementName");
    String action = request.getParameter("action");

    DatabaseIpAnnouncement dbConnect = new DatabaseIpAnnouncement();

    if (action != null) {
        if (action.equals("add")) {
            dbConnect.addAnnouncement(announcementName);
        } else if (action.equals("delete")) {
            dbConnect.deleteAnnouncement(announcementName);
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
 
 
 
 table.lecturerTable {
  font-family: "Arial Black", Gadget, sans-serif;
  border: 8px solid #A40808;
  background-color: #EEE7DB;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
}
table.lecturerTable td, table.lecturerTable th {
  border: 1px solid #AAAAAA;
  padding: 9px 2px;
}
table.lecturerTable tbody td {
  font-size: 13px;
  font-weight: bold;
}
table.lecturerTable tr:nth-child(even) {
  background: #F5C8BF;
}
</style>
<head>

    <title>IP Announcement Management</title>
</head>
<body>
<header>

<ul>
  <li><a href="loginPage.jsp">Logout</a></li>
  <li><a href="Profile.jsp">Profile</a></li>
  <li><a href="lecturerReport.jsp">report</a></li>
  <li><a href="lecturerCourses.jsp">Courses</a></li>
  <li><a href="lecturerFaculty.jsp">Faculty</a></li>
</ul>

</header>

<table id="myTable" class="lecturerTable">
    <tr>
        <th>Internet Programming Announcements</th>
    </tr>
  
    <%
    ResultSet rs = dbConnect.getIpAnnouncement();
    while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("name") %></td>
        
    </tr>
    <% } %>
</table>

    <form action="lecturerIPAnnouncement.jsp" method="post">
        Announcement Date/Description: <input type="text" name="announcementName" /><br /><br />
        <input type="submit" name="action" value="add" />
        <input type="submit" name="action" value="delete" />
    </form>
</body>
</html>
