<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광명소 게시판 리스트</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/resources/tour/css/tour.css">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
$(function(){
	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		location = "view.do?no=" + no
			+ "&page=${pageObject.page}"
			+ "&perPageNum=${pageObject.perPageNum}"
			+ "&area=${pageObject.area}"
			+ "&theme=${pageObject.theme}"
			+ "&word=${pageObject.word}";
			
		$("#area").val(${pageObject.area}).prop("selected", true);
		$("#theme").val(${pageObject.theme}).prop("selected", true);
	});
});

function areaChange() {
	var select = document.getElementById("area").options[document.getElementById("area").selectedIndex].value;
	if(select != 0) {
		location = "list.do?page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
				+ "&area=" + select + "&theme=${pageObject.theme}&word=${pageObject.word}";
	}
}
function themeChange() {
	var select2 = document.getElementById("theme").options[document.getElementById("theme").selectedIndex].value;
	if(select2 != 0) {
		location = "list.do?page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
				+ "&area=${pageObject.area}"+"&theme=" + select2 + "&word=${pageObject.word}";
	}
}
</script>
</head>
<body>
<div class="container">
	<!-- 검색 부분 -->
	<form class="form-inline">
		<input name="page" type="hidden" value="${pageObject.page}">
		<input name="perPageNum" type="hidden" value="${pageObject.perPageNum }">
		
		<div class="input-group" id="area_select">
			<select name="area" id="area" class="form-control" onchange="areaChange()">
				<option value="0" ${(pageObject.area == 0)? "selected":""}>지역 전체</option>
				<option value="1" ${(pageObject.area == 1)? "selected":""}>제주시</option>
				<option value="2" ${(pageObject.area == 2)? "selected":""}>애월읍</option>
				<option value="3" ${(pageObject.area == 3)? "selected":""}>한림읍</option>
				<option value="4" ${(pageObject.area == 4)? "selected":""}>한경면</option>
				<option value="5" ${(pageObject.area == 5)? "selected":""}>대정읍</option>
				<option value="6" ${(pageObject.area == 6)? "selected":""}>안덕면</option>
				<option value="7" ${(pageObject.area == 7)? "selected":""}>서귀포시</option>
				<option value="8" ${(pageObject.area == 8)? "selected":""}>남원읍</option>
				<option value="9" ${(pageObject.area == 9)? "selected":""}>표선면</option>
				<option value="10" ${(pageObject.area == 10)? "selected":""}>성산읍</option>
				<option value="11" ${(pageObject.area == 11)? "selected":""}>구좌읍</option>
				<option value="12" ${(pageObject.area == 12)? "selected":""}>조천읍</option>
			</select>
		</div>
		<div class="input-group" id="theme_select">
			<select name="theme" id="theme" class="form-control" onchange="themeChange()">
				<option value="0" ${(pageObject.theme == 0)? "selected":""}>테마 전체</option>
				<option value="1" ${(pageObject.theme == 1)? "selected":""}>체험관광</option>
				<option value="2" ${(pageObject.theme == 2)? "selected":""}>휴양관광</option>
				<option value="3" ${(pageObject.theme == 3)? "selected":""}>역사문화</option>
				<option value="4" ${(pageObject.theme == 4)? "selected":""}>박물관/기념관</option>
				<option value="5" ${(pageObject.theme == 5)? "selected":""}>드라마</option>
				<option value="6" ${(pageObject.theme == 6)? "selected":""}>전통시장</option>
			</select>
		</div>
		<div class="input-group" id="search_input">
			<input type="text" name="word" class="form-control" placeholder="검색어를 입력해 주세요." value="${pageObject.word}">
			<div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>
	</form>
	
	<!-- 한 줄 시작 -->
	<div class="row">
		<!-- 이미지 데이터 한 개 표시 시작 되는 위치 -->
		<c:forEach items="${list}" var="vo" varStatus="vs">
		<div class="tourList dataRow">
			<div class="tourImg">
				<p><img src="${vo.thumbnail}" alt="${vo.name} 대표 이미지"></p>
			</div>
			<div class="caption">
				<ul>
					<li>${vo.areaName}</li>
					<li>${vo.themeName}</li>
				</ul>
				<p class="name"><span class="no">${vo.no}</span>${vo.name}</p>
				<p class="likeCnt"><i class="fa fa-heart"></i> ${vo.likeCnt}</p>
			</div>
		</div>
		<!-- 이미지 데이터 한 개 표시 끝 -->
		<c:if test="${vs.count % 3 == 0 && vs.count != pageObject.perPageNum }">
			${"</div>"}
			${"<div class='row'>"}
		</c:if>
		</c:forEach>
	</div><!-- //row -->
	
	<div class="text-right">
		<c:if test="${!empty login && login.gradeNo == 9 }">
			<a href="write.do?perPageNum=${pageObject.perPageNum}" class="btn btnC">등록</a>
		</c:if>
	</div>
	<div class="text-center">
		<pageNav:pageNavTour listURI="list.do" pageObject="${TourpageObject}"></pageNav:pageNavTour>
	</div>
</div><!-- //container -->
</body>
</html>