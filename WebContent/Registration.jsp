<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<title>Add Student</title>
</head>
<body>
<script type="text/javascript">
function addRows(){ 
	var table = document.getElementById('emptbl');
	var rowCount = table.rows.length;
	var cellCount = table.rows[0].cells.length; 
	var row = table.insertRow(rowCount);
	for(var i =0; i <= cellCount; i++){
		var cell = 'cell'+i;
		cell = row.insertCell(i);
		var copycel = document.getElementById('col'+i).innerHTML;
		cell.innerHTML=copycel;
		if(i == 4){ 
			var radioinput = document.getElementById('col4').getElementsByTagName('input'); 
			for(var j = 0; j <= radioinput.length; j++) { 
				if(radioinput[j].type == 'radio') { 
					var rownum = rowCount;
					radioinput[j].name = 'gender['+rownum+']';
				}
			}
		}
	}
}
function deleteRows(){
	var table = document.getElementById('emptbl');
	var rowCount = table.rows.length;
	if(rowCount > '2'){
		var row = table.deleteRow(rowCount-1);
		rowCount--;
	}
	else{
		alert('There should be atleast one row');
	}
}
</script>

<form action="stuDb" method="post">    
	<table id="emptbl" class="adminTable">
		<tr>
			<th>Student Name</th>
			<th>Matric number</th>
			<th>Email</th> 
			<th>password</th>
			<th>Gender</th> 
		</tr> 
		<tr> 
			<td id="col0"><input type="text" name="stuname[]" value="" /></td> 
			<td id="col1"><input type="text" name="matric[]" value="" /></td> 
			<td id="col2"><input type="text" name="email[]" value="" /></td> 
			<td id="col3"><input type="text" name="pass[]" value="" /></td> 
			<select name="faculty" id="dept"> 
			<option >Select Faculty</option> 
			<option value="SE">SE</option>
			<option value="PREMAC">PREMAC</option>
			<option value="Engineering">Engineering</option>
			</select> 
		        </td> 
		        <td id="col4" > 
			<input type="radio" name="gender" value="male" />Male 
			<input type="radio" name="gender" value="female" />Female 
		        </td> 
		</tr>  
	</table> 
	<table> 
		<tr> 
			<td><input type="button" value="Add Row" onclick="addRows()" /></td> 
			<td><input type="button" value="Delete Row" onclick="deleteRows()" /></td> 
			<td><input type="submit" value="Add" /></td> 
		</tr>  
	</table> 
 </form> 

</body>
</html>