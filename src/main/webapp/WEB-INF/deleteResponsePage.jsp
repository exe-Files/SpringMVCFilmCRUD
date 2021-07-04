<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${not deletedFilm}">
		<h1>Film not deleted please choose user created films</h1>
	</c:when>
	<c:otherwise>
		<h1>Film successfully deleted.</h1>
	</c:otherwise>
</c:choose>
<a href="result.do?${typeOfSearch}=${userSearch}">Return to search</a>
</body>
</html>