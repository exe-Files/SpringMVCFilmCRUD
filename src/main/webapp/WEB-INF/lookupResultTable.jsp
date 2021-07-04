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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link href="css/homeStyles.css" rel="stylesheet">
</head>
<body>
	<a href="home.do"><button class="btn btn-dark mt-1 fixed-top">Go
			Home</button></a>
	<div
		class="container vh-100 d-flex flex-column justify-content-center ">
		<div>
			<h1 class="text-center">All Your Matching Films</h1>
		</div>
		<div class="w-100 border p-4 form-border">
			<table class="table table-hover">
				<tbody>
					<c:choose>
						<c:when test="${not empty userFilm}">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Film ID</th>
									<th scope="col">Title</th>
									<th scope="col">Details</th>
									<th scope="col">Language</th>
									<th scope="col">Release</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<c:forEach var="userFilm" items="${userFilm}">
								<tr data-toggle="collapse" data-target="#demo1" class="accordion-toggle"></tr>
									<th scope="row">${userFilm.id}</th>
									<td>
									${userFilm.title}
									</td>
									<td>
										<button class="btn btn-outline-dark bi bi-info-circle"
											type="button" data-bs-toggle="offcanvas"
											data-bs-target="#f${userFilm.id}"
											aria-controls="${userFilm.id}">See Details</button>

										<div class="offcanvas offcanvas-top" tabindex="-1"
											id="f${userFilm.id}" aria-labelledby="offcanvasTopLabel">
											<div class="offcanvas-header">

												<h5 id="offcanvasTopLabel">
													Edit:
													<!-- NEED CONTROLLER INFO / VIEW FOR HREF  -->
													<a aria-label="Edit" href="editFilm.do?editFilmId=${userFilm.id}" class="button bi bi-journal"></a>
													<h2>${userFilm.title}</h2>
												</h5>


												<button type="button" class="btn-close text-reset"
													data-bs-dismiss="offcanvas" aria-label="Close"></button>
											</div>
											<div class="offcanvas-body">
												<div class="row">
													<div class="col">
														<h3>Description:</h3>
														<p>${userFilm.description}</p>
														<div class="d-flex w-50 justify-content-between">
															<h5>Rating:</h5>
															<p>${userFilm.rating}</p>
														</div>
														<div class="d-flex w-50 justify-content-between">
															<h5>Length:</h5>
															<p>${userFilm.length}</p>
														</div>
														<div class="d-flex w-50 justify-content-between">
															<h5>Rental Cost:</h5>
															<p>${userFilm.rental_rate}</p>
														</div>
														<div class="d-flex w-50 justify-content-between">
															<h5>Replacement Cost:</h5>
															<p>${userFilm.replacement_cost}</p>
														</div>
														<div class="d-flex w-50 justify-content-between">
															<h5>Special Features:</h5>
															<p>${userFilm.special_features}</p>
														</div>
														<div class="d-flex w-50 justify-content-between">
															<h5>Category:</h5>
															<p>${userFilm.film_category}</p>
														</div>

													</div>
													<div
														class="col border border-dark border-width-4 rounded-2 form-border m-1 h-100">
														<h3>Actors:</h3>
														<ul>
															<c:forEach var="actor" items="${userFilm.actors}">
																<li>Id: ${actor.id}, Name: ${actor.firstName}
																	${actor.lastName}</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</td>
									<td>${userFilm.language_name}</td>
									<td>${userFilm.release_year}</td>
									<td>
										<button type="button" class="btn bi bi-trash"
											data-bs-toggle="modal" data-bs-target="#m${userFilm.id}">
										</button> <!-- Modal -->
										<div class="modal fade" id="m${userFilm.id}" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Do you
															wish to continue?</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														Are you sure you want to delete <strong>${userFilm.title}</strong>
													</div>
													<div class="modal-footer d-flex justify-content-between">

														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<a
															href="deleteFilm.do?deleteFilmId=${userFilm.id}&Keyword=${Keyword}&typeOfSearch=${typeOfSearch}"
															class="btn btn-danger">Delete Film</a>
													</div>
												</div>
											</div>
										</div>
									</td>

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
</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>
</body>
</html>