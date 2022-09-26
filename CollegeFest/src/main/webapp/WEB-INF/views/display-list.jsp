<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DisplayList</title>
    <style>
        table {
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 5px;
        }
    </style>
</head>
<body>

	<h3>List of Registered Students</h3>
	<hr />
	<br>
	<table>
		<thead>
			<tr>
				<th>Student Id</th>
				<th>Name</th>
				<th>Department</th>
				<th>Country</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${StudentsList}" var="tempStudent">
					<tr>
						<td><c:out value="${tempStudent.id}" /></td>
						<td><c:out value="${tempStudent.name}" /></td>                       <!-- Here (name) is the property of Student class -->
						<td><c:out value="${tempStudent.department}" /></td>					<!-- this is case sensitive -->
						<td><c:out value="${tempStudent.country}" /></td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<br>
	<a href="/CollegeFest">Go to Home Page</a>
</body>
</html>