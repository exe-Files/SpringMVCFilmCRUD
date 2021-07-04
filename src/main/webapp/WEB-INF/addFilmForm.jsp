<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a Film</title>
</head>

<body>
<h1>Add a Film</h1>
<form action="addFilm.do" method="POST" >
	<label for="title">Film Title: <input name="title" placeholder="Enter Film Title"></label><br>
	<label for="description">Film Description: <br> 
		<textarea name="description" rows="4" cols="50" placeholder="Enter Film Description"></textarea></label><br> 
	<!-- <label for="release_year">Release Year: <input name="release_year" placeholder="Enter Film Release Year"></label><br> -->
	<label for="language_id">Language ID: <input name="language_id" placeholder="Enter language ID"></label><br>
	<!-- <label for="rental_duration">Rental Duration: <input name="rental_duration" placeholder="Enter rental duration"></label><br>
	<label for="rental_rate">Rental Rate: <input name="rental_rate" placeholder="Enter rental rate"></label><br>
	<label for="length">Film Length: <input name="length" placeholder="Enter film length"></label><br>
	<label for="replacement_cost">Replacement cost: <input name="replacement_cost" placeholder="Enter replacement cost"></label><br>
	<label for="rating">Rating: <input name="rating" placeholder="Enter rating" ></label><br>
	<label for="special_features">Special Features <input name="special_features" placeholder="Enter special features"></label><br> --> 
	
	<input type="submit" value="Add Film">
</form>
</body>

</html>