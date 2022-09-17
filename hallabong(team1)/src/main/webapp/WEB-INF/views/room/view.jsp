<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>객실 보기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function() {
	$("#updateBtn").click(function(){
		location = "update.do?ro_no=${vo.ro_no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";
	});
	
	$("#deleteBtn").on("click", function(){
		if(confirm("정말 삭제하시겠니까?"))
			location = "delete.do?ro_no=${vo.ro_no}&perPageNum=${param.perPageNum}&no=&{param.no}";
	});
	
	$("#listBtn").click(function(){
		location = "list.do?page=" + "${param.page}"
		+ 	"&perPageNum=" + "${param.perPageNum}"
		+ "&key=" + "${param.key}"
		+ "&word=" + "${param.word}"
		+ "&no"= + "${param.no}"
		;
	});
});

</script>
<style type="text/css">
  .img{
    position: relative;                                                           
    height: 50vh;
    background-size: cover;
  }
  .img-cover{
     position: absolute;
     height: 100%;
     width: 100%;
     background-size: cover;                                                              
  }

</style>

</head>
<body>
	<input type="hidden" id="ro_no" data-no="${vo.ro_no }">
	<div class="container">
	<!-- 객실 출력 -->
	<div class="container">
		<div class="img" style="background-image: url('${vo.fileName}');">
	        <h4>
	        </h4>        
	        
	        <div class="img-cover"></div>
		</div>
	</div>
	<h2>${vo.ro_name }</h2>
	<h1></h1>
	<hr style="border:solid; color= silver">
	
	<div class="container">		
		<div class="container">
			
			<p>객실명 : ${vo.ro_name }</p>
			<p>가격  1박 기준: ${vo.ro_price }</p>
			<p>인원 : ${vo.ro_people }</p>
			<p>객실 기본옵션 : ${vo.ro_info }</p>
			<p>예약 상태 : ${vo.ro_state }</p>

		</div>		
	</div>

		<!-- 그 외 기능 버튼 위치 -->
<div class="row">
		<div class="col-md-4" style="padding: 20px;">
			<div class="btn-group">
<%-- 		<c:if test="${!empty login && login.gradeNo == 9 }"> <!-- 관리자 계정일때 수정, 삭제 표시 --> --%>
			<button type = "button" id="updateBtn" class="btn-default">수정</button>
			<button type = "button" id="deleteBtn" class="btn-default">삭제</button>
<%-- 		</c:if> --%>
			<button type = "button" id="listBtn" class="btn-default">리스트</button>
			</div>
			</div>
			</div>
			
<%-- 					<c:if test="${!empty login && login.gradeNo == 9 }"> <!-- 관리자 계정일때 수정, 삭제 표시 --> --%>
<%-- 				</c:if> --%>
		
			
	</div>
</body>
</html>