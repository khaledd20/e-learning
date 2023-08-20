<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
 
 
 
 table.loginTable {
  font-family: "Arial Black", Gadget, sans-serif;
  border: 8px solid #A40808;
  background-color: #EEE7DB;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
}
table.loginTable td, table.loginTable th {
  border: 1px solid #AAAAAA;
  padding: 9px 2px;
}
table.loginTable tbody td {
  font-size: 13px;
  font-weight: bold;
}
table.loginTable tr:nth-child(even) {
  background: #F5C8BF;
}


</style>
<title>Insert title here</title>
</head>
<body>
<table class="loginTable">
<thead>
<tr>
<th>online e learning Login</th>
</tr>
</thead>
<tbody>

<form action="login" method="post">
<tr>
<td>
    <label>Username:</label>
        <input type="text" name="username">
    
</td>
</tr>
<tr>
<td>
    <label>Password:</label>
        <input type="password" name="password">
    
</tr>
<tr>
        <td>
        <input type="submit" value="Login"></td>
    
</tr>
</form>

</tbody>
</table>
</body>
</html>