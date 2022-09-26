<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link 
	rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
<title>Students Directory</title>
</head>

<body>
	
	<div class="container">
		<h3>Debate Competition : Students Directory</h3>
		<hr>
		
		<!-- Add form -->
		<h5>To register click below</h5>
		<form action="/CollegeFest/student/search" class="form-inline">
			<!-- Add a button -->
			<a href="/CollegeFest/student/fillForm" class="btn btn-primary btn-sm mb-3"> Fill Form </a> 
			
			<!-- 
		    <input type="search" name="name" placeholder="Name" class="form-control-sm ml-5 mr-2 mb-3" /> 
			<input type="search" name="department" placeholder="Department" class="form-control-sm mr-2 mb-3" />
			<input type="search" name="country" placeholder="country" class="form-control-sm mr-2 mb-3" />
			<button type="submit" class="btn btn-success btn-sm mb-3">Search</button> 
			-->
		</form>

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Name</th>
					<th>Department</th>
					<th>Country</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${ListOfStudents}" var="tempStudent">
					<tr>
						<td><c:out value="${tempStudent.name}" /></td>                       <!-- Here (name) is the property of Student class -->
						<td><c:out value="${tempStudent.department}" /></td>					<!-- this is case sensitive -->
						<td><c:out value="${tempStudent.country}" /></td>
						<td>
							<!-- Add "update" button/link --> 
							<a href="/CollegeFest/student/update?studentId=${tempStudent.id}"           
							 class="btn btn-info btn-sm"> Update </a>                                 <!-- make sure the variable studentId is same in Controller class /update mapping-->
							 
							<!-- Add "delete" button/link -->
							<a href="/CollegeFest/student/delete?studentId=${tempStudent.id}"
							 class="btn btn-danger btn-sm"
							 onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">
							 Delete </a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		<a href="/CollegeFest/student/display" class="btn btn-info btn-sm">Display List of Registerd Students</a>
		<br>
		<br>
		<a href="/CollegeFest">Go to Home Page</a>
	</div>
	
</body>
</html>




