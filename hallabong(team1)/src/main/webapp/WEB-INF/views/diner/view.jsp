<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
<meta charset="UTF-8">
	<title>맛집 자세히 보기</title>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<script type="text/javascript">
//jqeury() - html 문서가 로딩이 되면 함수를 호출해서 처리
$(function() {
	$("#updateBtn").click(function(){
		location = "update.do?no=${vo.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";
	});
	
	$("#deleteBtn").on("click", function(){
		if(confirm("정말 삭제하시겠니까?"))
			location = "delete.do?no=${vo.no}&perPageNum=${param.perPageNum}";
	});
	
	$("#listBtn").click(function(){
		location = "list.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";
	});
});
</script>
</head>
<body>
   	<input type="hidden" name="page" value="${pageObject.page }">
   	<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
   	<input type="hidden" name="key" value="${pageObject.key }">
   	<input type="hidden" name="word" value="${pageObject.word }">
	<div class="container">
	<!-- 맛집 내용 출력 -->
	<div class="container">
		<div class="img" style="background-image: url('${vo.image}');">
	        <h4>
	        </h4>        
	        
	        <div class="img-cover"></div>
		</div>
	</div>
	<h2>${vo.name }</h2>
	<p><span class="glyphicon glyphicon-eye-open" style="padding-right: 10px;"></span> ${vo.hit }</p>
	
	<h1></h1>
	<hr style="border:solid; color= silver">
	
	<div class="container">		
		<div class="container">
			
			<p>주소 : ${vo.address }</p>
			<p>전화번호 : ${vo.tel }</p>
			<p>음식종류 : ${vo.kindName }</p>
			<p>가격대 : ${vo.price }</p>
			<p>전화번호 : ${vo.tel }</p>
			<p>${vo.content }</p>		
			<p>주차 : ${vo.park }</p>
			<p>영업시간 : ${vo.hours }</p>

		</div>		
	</div>

		<!-- 그 외 기능 버튼 위치 -->
<%-- 		<c:if test="${!empty login && login.gradeNo == 9 }"> <!-- 관리자 계정일때 수정, 삭제 표시 --> --%>
			<button id="updateBtn" class="btn-default">수정</button>
			<button id="deleteBtn" class="btn-default">삭제</button>
<%-- 		</c:if> --%>
			<button id="listBtn" class="btn-default">리스트</button>
			
			
	
			
	</div>
</body>
</html>