<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film App</title>
</head>
	<body>
		<div>
			<h1>Welcome message</h1>
			<p>Please choose what you would like to do</p>
			<form action="userChoice.do">
				<label for="userOption"> <select name="userOption">
						<option value="filmID">Find Film By ID</option>
						<option value="filmKeyword">Find Film By Keyword</option>
						<option value="createFilm">Create new film</option>
				</select>
				</label>
				<input type="submit" value="Begin"/> 
			</form>
		</div>
	</body>
</html>