<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Where the results go</h1>
	<!--  Likely some kind of card and full display here-->
	<c:choose>
		<c:when test="${not empty userFilm}">
			<c:forEach var="userFilm" items="${userFilm}">
				<h2>
					<c:out value="${userFilm.title}" />
				</h2>
			</c:forEach>
		</c:when>
	</c:choose>
		<!-- TODO: Setup no film found -->


	<a href="home.do"><button>Go Home</button></a>


</body>
</html>