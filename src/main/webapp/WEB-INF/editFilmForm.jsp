<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link href="css/homeStyles.css" rel="stylesheet">
</head>
<title>Edit a Film</title>
</head>

<body>

	<a href="home.do"><button class="btn btn-dark mt-1 fixed-top">Go
			Home</button></a>
	<div class="">
		<div class="container vh-100 d-flex flex-column justify-content-center">
			<div class="border p-3 form-border border-dark">
				<h1 class="text-center">Edit ${userFilm.title}</h1>
				<form action="editedFilm.do" method="POST">
					<div class="row">
						<div class="mb-3">
							<div>
								<label for="title">Film Title: </label> <input name="title"
									class="form-control input-sm" value="${userFilm.title}">
							</div>
							<div>
								<label for="description">Film Description:</label>
								<textarea name="description" class="form-control w-100">${userFilm.description}</textarea>
							</div>
							<div class="mt-3 mb-2 d-flex justify-content-between">
								<div>
									<label for="rental_duration">Rental Duration:</label> <input
										name="rental_duration" type="number" min="1" max="30"
										placeholder="Select rental duration" value="${userFilm.rental_duration}">
								</div>
								
								<div>
									<label for="id">Film id:</label> <input readonly 
										name="id" type="number" value="${userFilm.id}">
								</div>

								<div>
									<label for="release_year">Release Year:</label> <input
										 name="release_year" type="number" value="${fn:substring(userFilm.release_year, 0, 4)}" min="1900" max="2099"
										step="1"/>
								</div>
								<div>
									<label for="rental_rate">Rental Rate:</label> <input
										name="rental_rate" placeholder="Enter rental rate" value="${userFilm.rental_rate}"
										type="number" min="0.00" max="99.99" step="0.01">
								</div>
							</div>
							<div class="d-flex justify-content-between">
								<div class="w-50">
									<label for="language_id">Language</label> ID: <select
										class="form-control w-75" name="language_id"
										class="form-control" id="language_id">
										<option value=1>1. English</option>
										<option value=2>2. Italian</option>
										<option value=3>3. Japanese</option>
										<option value=4>4. Mandarin</option>
										<option value=5>5. French</option>
										<option value=6>6. German</option>
									</select>
								</div>

								<div>
									<label for="rating">Rating:</label> <select name="rating"
										class="form-control" id="rating"
										>
										<option value=1>G</option>
										<option value=2>PG</option>
										<option value=3>PG13</option>
										<option value=4>R</option>
										<option value=5>NC17</option>
									</select>
								</div>
								<div>
									<label for="replacement_cost">Replacement cost:</label> <input
										class="form-control" name="replacement_cost" type="number"
										value="${userFilm.replacement_cost}" step="0.01" min="0" max="999.99" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<label for="special_features">Special Features:</label> <select
								name="special_features" class="form-control"
								id="special_features" multiple>
								<option value="Trailers">Trailers</option>
								<option value="Commentaries">Commentaries</option>
								<option value="Deleted Scenes">Deleted Scenes</option>
								<option value="Behind the Scenes">Behind the Scenes</option>
							</select>
						</div>
						<div class="col">
							<label for="length">Film Length:</label> <input name="length"
								class="form-control" type="number"
								placeholder="Enter film length" min="0" max="9999" value="${userFilm.length}" />
						</div>
					</div>
					<div class="text-center">
						<button class="btn btn-outline-dark w-75 mt-3" type="submit"
							value="Add Film">Submit</button>
					</div>
				</form>
			</div>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</body>

</html>
