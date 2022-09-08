<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 Error Page</title>
</head>
<body>
<div class="container">
	<h2>404에러 페이지</h2>
	<div class="alert alert-danger">
		${exception.message }
	</div>
	<ul class="list-group">
		<c:forEach items="${exception.stackTrace }" var="stack">
			  <li class="list-group-item">${stack } </li>
		</c:forEach>
	</ul>
</div>

</body>
</html>