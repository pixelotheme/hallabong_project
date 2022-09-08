<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
 <%@ page import="com.hallabong.hotelbooking.vo.HotelBookingVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>

<script type="text/javascript">

</script>

<script type="text/javascript" src="/resources/member/js/myPageEvent.js"></script>
</head>
<body>
<div class="container">
<h1>내 정보 보기</h1>
<table class="table">
	<tbody>
		<tr>
			<th>아이디</th>
			<td class="id">${vo.id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td class="id">${vo.name }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td class="id"><fmt:formatDate value="${vo.birth }"/></td>
		</tr>
		<tr>
			<th>성별</th>
			<td class="id">${vo.gender }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td class="id">${vo.tel }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td class="id">${vo.email }</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>주소</th> -->
<%-- 			<td class="id">${vo.address }</td> --%>
<!-- 		</tr> -->
		<tr>
			<th>가입일</th>
			<td class="id"><fmt:formatDate value="${vo.regDate }"/></td>
		</tr>
		<tr>
			<th>등급</th>
			<td class="id">${vo.gradeName }</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<a href="../member/logout.do" class="btn btn-default">로그아웃</a>
				<a href="../member/memberUpdateForm.do" class="btn btn-default">내 정보 수정</a>
				<a href="../member/memberWithdrawForm.do" class="btn btn-default">회원 탈퇴</a>
				
				<c:if test="${login.gradeNo == 9 }">
		<!-- 관리자 메뉴 -->
				<a href="../member/memberList.do" class="btn btn-default">회원리스트</a>
				</c:if>
				<a href="../hotelbooking/list.do" class="btn btn-success" style="">호텔  예약 목록</a>
				<a href="../list.do" class="btn btn-success">렌트카  예약 목록</a>	
			</td>
		</tr>
	</tfoot>
</table>   
</div>
</body>
</html>