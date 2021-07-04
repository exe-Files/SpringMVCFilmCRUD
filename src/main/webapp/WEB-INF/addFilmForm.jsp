<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="css/homeStyles.css" rel="stylesheet">
<title>Hello, world!</title>
<title>Add a Film</title>
</head>

<body>
	<a href="home.do"><button class="btn btn-dark mt-1 fixed-top">Go
			Home</button></a>
	<div
		class="container mx-auto d-flex flex-column vh-100 w-75 mx-auto text-center justify-content-center">
		<div class="w-75 mx-auto border p-4 form-border">
			<h1>Add a Film</h1>
			<form action="addFilm.do" method="POST">
				<label for="title">Film Title: </label><input name="title"
					class="form-control input-sm" placeholder="Enter Film Title" required><br>
				<label for="description">Film Description: <br> <textarea
						name="description" class="form-control" rows="5"
						placeholder="Enter Film Description" required></textarea></label><br> 
				<label for="release_year">Release Year: <input name="release_year"
					type="number" min="1900" max="2099" step="1" value="1950"></label><br>
				<label for="language_id">Language ID: <select
					name="language_id" class="form-control" id="language_id">
						<option value=1>1. English</option>
						<option value=2>2. Italian</option>
						<option value=3>3. Japanese</option>
						<option value=4>4. Mandarin</option>
						<option value=5>5. French</option>
						<option value=6>6. German</option>
				</select></label><br> 
				<label for="rental_duration">Rental Duration: <input
					name="rental_duration" type="number" min="3" max="7"
					placeholder="Select rental duration" value="3"></label><br> 
				<label for="rental_rate">Rental Rate: <input name="rental_rate"
					placeholder="Enter rental rate" value=".99" type="number"
					min="0.00" max="5" step="0.01"></label><br> 
				<label for="length">Film Length: <input name="length"
					type="number" placeholder="Enter film length" value="120"></label><br> 
				<label for="replacement_cost">Replacement cost: <input name="replacement_cost" placeholder="Enter replacement cost"	type="number" value="0.00" step="0.01" min="0" max="20"></label><br>
				<label for="rating">Rating: <select name="rating" class="form-control" id="rating" placeholder="Enter rating" value="G">
						<option value=1>G</option>
						<option value=2>PG</option>
						<option value=3>PG13</option>
						<option value=4>R</option>
						<option value=5>NC17</option>
				</select></label><br>
				<!-- TODO: add multi select option -->
				<label for="special_features">Special Features<br> <select
					name="special_features" class="form-control" id="special_features">
						<option value="Trailers">Trailers</option>
						<option value="Commentaries">Commentaries</option>
						<option value="Deleted Scenes">Deleted Scenes</option>
						<option value="Behind the Scenes">Behind the Scenes</option>
				</select></label><br>
				<!-- TODO: Best way to input default values? -->

				<button class="btn btn-outline-dark" type="submit" value="Add Film">Submit</button>
			</form>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</body>

</html>
