<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집  리스트</title>
<style type="text/css">
.dataRow:hover {
	background : #eee;
	cursor:pointer;

}
</style>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(
				function() {
					var no = $(this).find(".no").text();
					location = "view.do?no=" + no + "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
				});

			var key = "${pageObject.key}";
			if(!key) key = "EV";
			$("#key").val(key);
	})
</script>
</head>
<body>
	<div class="container">
		<h2>맛집 리스트</h2>
		<form class="form-inline">
			<div class="input-group">
				<select class="form-control" name="key" id="key">
					<option value="EV">전체</option>
					<option value="1">제주 모슬포/화순</option>
					<option value="2">제주 서귀포시내</option>
					<option value="3">제주 성산/우도</option>
					<option value="4">제주 제주시내</option>
					<option value="5">제주 중문단지</option>
					<option value="6">제주 표선/성읍</option>
					<option value="7">제주 한림/애월</option>
					<option value="8">제주 함덕/김녕</option>
				</select>
			</div>
			<div class="input-group">
				<select class="form-control" name="key2" id="key2">
					<option value="EV">전체</option>
					<option value="1">한식</option>
					<option value="2">분식</option>
					<option value="3">양식</option>
					<option value="4">해산물</option>
					<option value="5">회/스시</option>
					<option value="6">세계음식</option>
					<option value="7">뷔페</option>
					<option value="8">디저트</option>
					<option value="9">카페</option>
					<option value="10">술집</option>
					<option value="11">브런치</option>
					<option value="12">치킨</option>
				</select>
			</div>
			
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search"
					name="word" value="${pageObject.word }">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- 한줄 시작 -->
		<div class="row">
			<c:forEach items="${list }" var="vo" varStatus="vs">
				<!--  이미지 데이터 한개 표시 시작 -->
				<div class="col-md-3">
					<div class="thumbnail dataRow" data-no = "${vo.no }">
						<img src="${vo.image }" alt="${vo.name}" style="width: 100%">
						<div class="caption">
							<div>${vo.name }</div>
							<div class="regionKind">${vo.region }-${vo.kind }</div>
							<div>${vo.introduce }</div>
							<div>${vo.hit }							
							</div>
						</div>

					</div>
				</div>
				<!-- 이미지 데이터 한개 표시 끝 -->
				<c:if
					test="${vs.count % 4 == 0 && vs.count != pageObject.perPageNum }">
					${"</div>" }
					${"<div class='row'>" }
		</c:if>
			</c:forEach>
		</div>
		<!--  이미지 한줄 끝 -->
		<div>
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>

		<div>
			<a href="write.do?perPageNum=${pageObject.perPageNum }"
				class="btn btn-info">등록</a>
		</div>
	</div>

</body>
</html>