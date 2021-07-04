<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Film Result</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/homeStyles.css" rel="stylesheet">
</head>
<body>
	<a href="home.do"><button class="btn btn-dark mt-1 fixed-top">Go
			Home</button></a>

	<div class="container vh-100 d-flex flex-column justify-content-center ">
	<div><h1 class="text-center">All Your Matching Films</h1></div>
	<div class="w-100 border p-4 form-border">
	<table class="table table-hover">
			<tbody>
				<c:choose>
					<c:when test="${not empty userFilm}">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Film ID</th>
								<th scope="col">Title</th>
								<th scope="col">Description</th>
								<th scope="col">Language</th>
								<th scope="col">Release</th>
							</tr>
						</thead>
						<c:forEach var="userFilm" items="${userFilm}">
							<tr>
								<th scope="row">${userFilm.id}</th>
								<td>${userFilm.title}</td>
								<td>
									<button class="btn btn-outline-dark" type="button"
										data-bs-toggle="offcanvas" data-bs-target="#f${userFilm.id}"
										aria-controls="${userFilm.id}">See Description</button>

									<div class="offcanvas offcanvas-top" tabindex="-1"
										id="f${userFilm.id}" aria-labelledby="offcanvasTopLabel">
										<div class="offcanvas-header">
											<h5 id="offcanvasTopLabel">${userFilm.title }</h5>
											<button type="button" class="btn-close text-reset"
												data-bs-dismiss="offcanvas" aria-label="Close"></button>
										</div>
										<div class="offcanvas-body">${userFilm.description}</div>
									</div>
								</td>
								<td>${userFilm.language_name}</td>
								<td>${userFilm.release_year}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>No film found</p>
						<c:if test="${not empty badInput}">
							<p>${badInput}</p>
						</c:if>
					</c:otherwise>
				</c:choose>
			</tbody>

		</table>
	</div>
		



			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
				crossorigin="anonymous"></script>
</body>
</html>