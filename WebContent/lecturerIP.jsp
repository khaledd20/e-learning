<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="bdUtil.materialDB" %>



<%
    String lecture = request.getParameter("lecture");
    String action = request.getParameter("action");

    materialDB dbConnect = new materialDB();

    if (action != null) {
        if (action.equals("add")) {
            dbConnect.addLecture(lecture);
        } else if (action.equals("delete")) {
            dbConnect.deleteLecture(lecture);
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
 
 
 
 table.lectureTable {
  font-family: "Arial Black", Gadget, sans-serif;
  border: 8px solid #A40808;
  background-color: #EEE7DB;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
}
table.lectureTable td, table.lectureTable th {
  border: 1px solid #AAAAAA;
  padding: 9px 2px;
}
table.lectureTable tbody td {
  font-size: 13px;
  font-weight: bold;
}
table.lectureTable tr:nth-child(even) {
  background: #F5C8BF;
}


</style>

<title>Insert title here</title>
</head>
<body>
<script> 
function deleteRow(r) {
	  var i = r.parentNode.parentNode.rowIndex;
	  document.getElementById("myTable").deleteRow(i);
	}

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

<table id=myTable class="lectureTable">
<thead>
<tr>
<th>Internet programming Course</th>
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
<td><a href="lecturerIPAnnouncement.jsp">Announcements</a></td>
</tr>
<tr><td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">course Outline</a></td></tr>
<tr>
<td><h3>Material</h3></td>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">chapter 1</a></td>


</tr>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">chapter 2</a></td>

</tr>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">chapter 3</a></td>

</tr>
<tr>

<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Assignment 1</a></td>


</tr>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Assignment 2</a></td>

</tr>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Assignment 3</a></td>

</tr>
<tr>

<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Test 1</a></td>


</tr>
<tr>
<td><a href="https://drive.google.com/file/d/1mg-F08CPVd4UuHA2Cx0GILHiE0biIs-G/view?usp=sharing">Midterm test</a></td>

</tr>
<%
    ResultSet rs = dbConnect.getLecture();
    while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("topic") %></td>
        
    </tr>
    <% } %>

</tbody>
</table>
        <form action="adminIP.jsp" method="post">
        Material: <input type="text" name="lecture" /><br /><br />
        <input type="submit" name="action" value="add" />
        <input type="submit" name="action" value="delete" />
    </form> 
   
</body>
</html>