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

<title>Lecturer Sda</title>
</head>
<body>
<script> 

function addchapter() {
  var table = document.getElementById("myTable");
  var tr = table.insertRow(6);
  var td = tr.insertCell();
  td.innerHTML= "NEW chapter"
}
function addassignment() {
	  var table = document.getElementById("myTable");
	  var tr = table.insertRow(11);
	  var td = tr.insertCell();
	  td.innerHTML= "NEW assignment"
	}

function addtest() {
	  var table = document.getElementById("myTable");
	  var tr = table.insertRow(16);
	  var td = tr.insertCell();
	  td.innerHTML= "NEW test"
	}



</script> 
<header>

<ul>
  <li><a href="loginPage.jsp">Logout</a></li>
  <li><a href="Profile.jsp">Profile</a></li>
  <li><a href="lecturerReport.jsp">report</a></li>
  <li><a href="lecturerCourses.jsp">Courses</a></li>
  <li><a href="lecturerFaculty.jsp">Faculty</a></li>
</ul>

</header>

<table id=myTable class="lecturerTable">
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
<td><a href="lecturerSdaAnnouncement.jsp">Announcements</a></td>
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
    <form action="adminSDA.jsp" method="post">
        Material: <input type="text" name="sda" /><br /><br />
        <input type="submit" name="action" value="add" />
        <input type="submit" name="action" value="delete" />
    </form> 
       
   
</body>
</html>