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

<style type="text/css">
#imageChangeDiv{display:none;}
.list-group-item strong{width:120px; display:inline-block;}
#imageChangeDivShowBtn{margin-top:15px;}
.chat > li:hover {background:#f0f0f0; cursor:pointer;}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#imageChangeDivShowBtn").click(function(){
		$("#imageChangeDiv").show();
	});
	$("#cancelBtn").click(function(){
		$("#imageChangeDiv").hide();
	});

	$("#deleteBtn").click(function(){
		return confirm("정말 삭제하시겠습니까?");
	});
});
</script>

</head>
<body>
<div class="container">
	<div class="sub_title">
		<h2>${vo.name}</h2>
		<div class="subInfo">
			<ul>
				<li>${vo.area}</li>
				<li>${vo.theme}</li>
			</ul>
		</div>
	</div><!-- // sub_title -->
	
	<div class="likeCon">
		<!-- 좋아요 부분 -->
		<c:if test="${empty login}"> 
			<!-- 로그인을 하지 않은 경우 - 좋아요와 상관이 없음 -->
			<i class="fa fa-heart-o" style="font-size:30px; color:grey;" data-toggle="tooltip" title="로그인후에 사용하실 수 있습니다.">좋아요</i>
		</c:if>
		<c:if test="${!empty login}">
			<!--  로그인을 한 경우 -->
			<c:if test="${empty vo.likeNo}">
			<!-- 만약 로그인을 한 경우 likeNo가 비어있다면 좋아요를 누를 수 있다.-->
				<a href="like.do">
					<i class="fa fa-heart-o" style="font-size:30px;" data-toggle="tooltip" title="클릭하여 좋아요를 할 수 있습니다.">좋아요</i>
				</a>
			</c:if>
			<c:if test="${!empty vo.likeNo}">
				<!-- 만약 로그인을 한 경우 myLiked가 비어있지 않다면 좋아요를 취소할 수 있다.-->
				<a href="unlike.do">
				<i class="fa fa-heart-o" style="font-size:30px; color:blue;" data-toggle="tooltip" title="클릭하여 좋아요를 할 수 있습니다.">취소</i>
				</a>
			</c:if>
		</c:if>
		<div class="likeText">
			<p>좋아요 ${vo.likeCnt}개</p>
		</div>
	</div>
	
	<div class="info_box">
		<div class="summaryInfo">
			<dl>
				<dd><span>주소</span>${vo.address}</dd>
				<dd><span>대표전화</span>${vo.tel}</dd>
				<dd><span>운영시간</span>${vo.hours}</dd>
			</dl>
		</div><!-- // summaryInfo -->
		<div class="photoInfo">
			<ul>
				<li><img src="${vo.fileName}" alt="이미지" style="max-width:100%;"></li>
			</ul>
		</div><!-- // photoInfo -->
		
		<div class="info">
			<h3>소개</h3>
			<p>${vo.content}</p>
			<h3>지도</h3>
			<p>${vo.map}</p>
		</div><!-- // info -->
	</div><!-- // info_box -->
	
	
	<div class="text-right">
		<c:if test="${!empty login}">
			<c:if test="${vo.id == login.id}">
				<a href="update.do?no=${vo.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-info">글수정</a>
				<a href="delete.do?no=${vo.no}&deleteName=${vo.fileName}&perPageNum=${param.perPageNum}" class="btn btn-default" id="deleteBtn">글삭제</a>
			</c:if>
		</c:if>
				<a href="list.do?page=${param.page}&perPageNum=${param.perPageNum}&area=${param.area}&theme=${param.theme}&word=${param.word}" class="btn btn-default">목록</a>
	</div>
</div><!-- //container -->
</body>
</html>