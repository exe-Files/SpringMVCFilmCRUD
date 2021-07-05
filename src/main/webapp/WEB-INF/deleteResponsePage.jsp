<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link href="css/homeStyles.css" rel="stylesheet">
<title>Film Deletion</title>
</head>
<body>
	<a href="home.do"><button class="btn btn-dark mt-1 fixed-top">Go
			Home</button></a>
	<div class="container vh-100 d-flex flex-column justify-content-center">
		<div class="border form-border p-4 d-flex flex-column">
			<c:choose>
				<c:when test="${not deletedFilm}">
					<h1 class="text-center">Film not deleted please choose user
						created films</h1>
				</c:when>
				<c:otherwise>
					<h1 class="text-center">Film successfully deleted.</h1>
				</c:otherwise>
			</c:choose>
			<a class="btn btn-dark mt-1 w-50 mx-auto"
				href="result.do?${typeOfSearch}=${userSearch}">Return to search</a>
		</div>
	</div>

</body>
</html>