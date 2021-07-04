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
	<label for="title">Film Title: </label><input name="title" placeholder="Enter Film Title"><br>
	<label for="description">Film Description: <br> 
	<textarea name="description" rows="4" cols="50" placeholder="Enter Film Description" ></textarea></label><br> 
	<label for="release_year">Release Year: </label><input name="release_year" type="number" min="1900" max="2099" step="1" value="1950"><br>
	<label for="language_id">Language ID:  
  	<select name="language_id" class="form-control" id="language_id">
    	<option value=1>1. English</option>
    	<option value=2>2. Italian</option>
    	<option value=3>3. Japanese</option>
    	<option value=4>4. Mandarin</option>
    	<option value=5>5. French</option>
    	<option value=6>6. German</option>
  	</select></label><br>
	<label for="rental_duration">Rental Duration: </label><input name="rental_duration" type="number" min="3" max="7" placeholder="Select rental duration" value="3"><br>
	<label for="rental_rate">Rental Rate: <input name="rental_rate" placeholder="Enter rental rate" type="number" min="0.00" max="5" step="0.50" ></label><br>
	<label for="length">Film Length: <input name="length" type="number" placeholder="Enter film length" value="120"></label><br>
	<label for="replacement_cost">Replacement cost: <input name="replacement_cost" placeholder="Enter replacement cost" type="number" value="0.00" step="0.50" min="0" max="20" ></label><br>
	<label for="rating">Rating: 
	<select name="rating" class="form-control" id="rating" placeholder="Enter rating" value="G" >
    	<option value=1>G</option>
    	<option value=2>PG</option>
    	<option value=3>PG13</option>
    	<option value=4>R</option>
    	<option value=5>NC17</option>
  	</select></label><br>
	<label for="special_features">Special Features<br> 
	<textarea name="special_features" rows="4" cols="50" placeholder="Enter Special Features" ></textarea></label><br> 
	
	<input type="submit" value="Add Film">
</form>
</body>

</html>