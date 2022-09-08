<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 에러 페이지</title>
</head>
<body>
<div class="container">
	<h2>존재 하지 않는 아이디</h2>
	<div class="alert alert-danger">
	   	아이디나 비밀번호를 확인 해 주세요.
	</div>
	
	<span>
	<img
    src="/resources/img/hallabong.png" width="500" height="300" border="0"
    align="middle">
	</span>
	
	
	<a href="loginForm.do" class="btn btn-default">로그인으로 돌아가기</a>
	
</div>

</body>
</html>