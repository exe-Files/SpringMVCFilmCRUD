<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get your film</title>
</head>
	<body>
	<form action="result.do" >
		<label for="filmSearch">Find your film: <input name="${typeOfSearch}" placeholder="Enter Film ${typeOfSearch}"></label>
		<input type="submit" value="Find Film">
	</form>
		
	</body>
</html>