<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 보기</title>
 
<!-- 장점 : 재활용 가능, 이미지게시판과 이미지 댓글을 동시에 개발할 수 있다. 보안에 도움이 된다. -->
<!-- utility JS -->
<script type="text/javascript" src="/resources/js/hotelbooking/util.js" ></script>

<!-- 댓글 객체인 replyServcie를 가져오자. - 처리하는 함수만 존재, 호출이 없다. -->
<script type="text/javascript" src="/resources/js/hotelbooking/reply.js" ></script>

<!-- 댓글 페이지네이션 - 처리하는 함수만 존재, 호출이 없다. -->
<script type="text/javascript" src="/resources/js/hotelbooking/replyPagination.js" ></script>

<!-- 댓글 이벤트처리 / replyServcie를 호출해서 서버에서 DB처리를 하는것을가져오자. -->
<script type="text/javascript" src="/resources/js/hotelbooking/replyEvent.js"></script>

<script type="text/javascript">
	module="/hotelbookingdate";
	 var ro_no = "1";
	
</script>

<script type="text/javascript">
$(function(){
	$("#deleteBtn").click(function(){
		return confirm("정말 삭제하시겠습니까?");
	});
});
</script>
</head>
<body>
	<div class="container">
	<div>방번호1번</div>
			
				<a href="update.do?no=1&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-default">수정</a>
				<a href="delete.do?no=1&perPageNum=${param.perPageNum}" class="btn btn-default" id="deleteBtn">삭제</a>
		<a href="list.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}" class="btn btn-default">리스트</a>
	
		<!--  캘린더 있는 부분 -->
	<%@ include file="../hotelbookingdate/hotelbookingdate.jsp" %>
	
	</div>