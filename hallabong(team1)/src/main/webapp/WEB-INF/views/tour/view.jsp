<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광명소 게시판 글보기</title>

<link rel="stylesheet" type="text/css" href="/resources/tour/css/tour.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="/resources/tour/js/tourAttachFunction.js"></script>
<script type="text/javascript" src="/resources/tour/js/tourAttachEvent.js"></script>
<script type="text/javascript" src="/resources/tour/js/like.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#updateBtn").click(function(){
		location = "update.do?no=${vo.no}&page=${param.page}&perPageNum=${param.perPageNum}"
			+"&area=${param.area}&theme=${param.theme}&word=${param.word}";
	});
	$("#deleteBtn").click(function(){
		if(confirm("정말 삭제하시겠습니까?"))
			{ location = "delete.do?no=${vo.no}&deleteName=${vo.thumbnail}&perPageNum=${param.perPageNum}"; }
	});
	$("#listBtn").click(function(){
		location = "list.do?page=${param.page}&perPageNum=${param.perPageNum}"
			+ "&area=${param.area}&theme=${param.theme}&word=${param.word}";
	});
});
</script>

</head>
<body>
<div class="container">
	<input type="hidden" name="page" value="${pageObject.page}">
	<input type="hidden" name="perPageNum" value="${pageObject.perPageNum}">
	<input type="hidden" name="word" value="${pageObject.word}">
	<input type="hidden" name="del" value="${vo.thumbnail}">
	<input type="hidden" name="no" value="${vo.no}" readonly="readonly" id="no" data-no="${vo.no}">
   	<input type="hidden" name="login" id="login" value="${vo.id}">
   	<div class="sub_title">
		<h2>${vo.name}</h2>
		<div class="subInfo">
			<ul>
				<li>${vo.areaName}</li>
				<li>${vo.themeName}</li>
			</ul>
		</div>
		
		<div class="likeCon">
			<!-- 좋아요 부분 -->
			<c:if test="${empty login}"> 
				<!-- 로그인을 하지 않은 경우 - 좋아요와 상관이 없음 -->
				<button type="button" id="likeBtn" class="like"><i class="fa fa-heart-o" id="like"></i> ${vo.likeCnt}</button>
			</c:if>
			<c:if test="${!empty login}">
				<!--  로그인을 한 경우 -->
				<c:if test="${empty vo.no}">
				<!-- 만약 로그인을 한 경우 likeNo가 비어있다면 좋아요를 누를 수 있다.-->
					<button type="button" id="likeBtn" class="like"><i class="fa fa-heart-o" id="like"></i> ${vo.likeCnt}</button>
				</c:if>
				<c:if test="${!empty vo.no}">
					<!-- 만약 로그인을 한 경우 myLiked가 비어있지 않다면 좋아요를 취소할 수 있다.-->
					<button type="button" id="likeBtn" class="like"><i class="fa fa-heart" id="like"></i> ${vo.likeCnt}</button>
				</c:if>
			</c:if>
		</div>
	</div><!-- // sub_title -->
	
	<div class="info_box">
		<div class="summaryInfo">
			<dl>
				<dd><span>주소</span>${vo.address}</dd>
				<dd><span>대표전화</span>${vo.tel}</dd>
				<dd><span>운영시간</span>${vo.hours}</dd>
			</dl>
		</div><!-- // summaryInfo -->
		<div class="photoInfo">
			<div class="uploadResult">
				<ul>
					
				</ul>
			</div>
		</div><!-- // photoInfo -->
		
		<div class="info">
			<h3>소개</h3>
			<p>${vo.content}</p>
			<h3>지도</h3>
			<p>${vo.roadMap}</p>
		</div><!-- // info -->
	</div><!-- // info_box -->
	
	
	<div class="text-right" style="margin-top:30px;">
		<c:if test="${!empty login && login.gradeNo == 9 }">
			<button id="updateBtn" class="btn btnC">글수정</button>
			<button id="deleteBtn" class="btn btnD">글삭제</button>
		</c:if>
			<button id="listBtn" class="btn btnD">글목록</button>
	</div>
</div><!-- //container -->
</body>
</html>