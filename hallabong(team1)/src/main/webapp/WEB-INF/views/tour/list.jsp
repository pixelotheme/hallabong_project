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
			
		$("#area").val(${pageObject.area }).prop("selected", true);
		$("#theme").val(${pageObject.theme }).prop("selected", true);
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
	<h2>Tour</h2>
	
	<!-- 검색 부분 -->
	<form class="form-inline">
		<div class="input-group" id="area_select">
			<select name="area" id="area" class="form-control" onchange="areaChange()">
				<option value="">지역 전체</option>
				<option value="제주시" ${(pageObject.area == '제주시')? "selected":""}>제주시</option>
				<option value="애월읍" ${(pageObject.area == '애월읍')? "selected":""}>애월읍</option>
				<option value="한림읍" ${(pageObject.area == '한림읍')? "selected":""}>한림읍</option>
				<option value="한경면" ${(pageObject.area == '한경면')? "selected":""}>한경면</option>
				<option value="대정읍" ${(pageObject.area == '대정읍')? "selected":""}>대정읍</option>
				<option value="안덕면" ${(pageObject.area == '안덕면')? "selected":""}>안덕면</option>
				<option value="서귀포시" ${(pageObject.area == '서귀포시')? "selected":""}>서귀포시</option>
				<option value="남원읍" ${(pageObject.area == '남원읍')? "selected":""}>남원읍</option>
				<option value="표선면" ${(pageObject.area == '표선면')? "selected":""}>표선면</option>
				<option value="성산읍" ${(pageObject.area == '성산읍')? "selected":""}>성산읍</option>
				<option value="구좌읍" ${(pageObject.area == '구좌읍')? "selected":""}>구좌읍</option>
				<option value="조천읍" ${(pageObject.area == '조천읍')? "selected":""}>조천읍</option>
			</select>
		</div>
		<div class="input-group" id="theme_select">
			<select name="theme" id="theme" class="form-control" onchange="themeChange()">
				<option value="">테마 전체</option>
				<option value="체험관광" ${(pageObject.theme == '체험관광')? "selected":""}>체험관광</option>
				<option value="휴양관광" ${(pageObject.theme == '휴양관광')? "selected":""}>휴양관광</option>
				<option value="역사문화" ${(pageObject.theme == '역사문화')? "selected":""}>역사문화</option>
				<option value="박물관/기념관" ${(pageObject.theme == '박물관/기념관')? "selected":""}>박물관/기념관</option>
				<option value="드라마" ${(pageObject.theme == '드라마')? "selected":""}>드라마</option>
				<option value="전통시장" ${(pageObject.theme == '전통시장')? "selected":""}>전통시장</option>
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
					<li>${vo.area}</li>
					<li>${vo.theme}</li>
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
		<c:if test="${!empty login}">
			<c:if test="${login.gradeNo == 9 }">
				<a href="write.do?perPageNum=${pageObject.perPageNum}" class="btn btn-info">등록</a>
			</c:if>
		</c:if>
	</div>
	<div class="text-center">
		<pageNav:pageNavTour listURI="list.do" pageObject="${TourpageObject}"></pageNav:pageNavTour>
	</div>
</div><!-- //container -->
</body>
</html>