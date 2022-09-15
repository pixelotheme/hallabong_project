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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
	$(function(){
		$(".dataRow").on("click", function(){
			// alert("보기로 이동");
				var no = $(this).data("no");
					location = "view.do?no=" + no + "&inc=1" + "&page=${pageObject.page}"
 							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
				});

			var key = "${pageObject.key}";
			if(!key) key = "rkn";
			$("#key").val(key);

	});

// 	function regionChange() {
// 		var select = document.getElementById("region").options[document.getElementById("region").selectedIndex].value;
// 		if(select != 0) {
// 			location = "list.do?page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}";
// 		}
// 	}
// 	function kindChange() {
// 		var select1 = document.getElementById("kind").options[document.getElementById("kind").selectedIndex].value;
// 		if(select1 != 0) {
// 			location = "list.do?page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}"
// 					 ;
// 		}
// 	}
</script>
</head>
<body>
	<div class="container">
	<h1 style="text-align: center;">맛집 리스트</h1> 

		<!--  가운데 정렬 -->
<!-- 		<div>			 -->
<!-- 			<form action="list.do"> -->
<!-- 				페이지 정보를 다시 그대로 보냄 -->
<!-- 				<input name="page" type="hidden" value="1"> -->
<%-- 				<input name="perPageNum" type="hidden" value="${pageObject.perPageNum }"> --%>

<%-- 						<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }"> --%>
		<form class="form-inline">
			<div class="input-group">
				<select class="form-control" name="key" id="key">
					<option value="r">지역</option>
					<option value="k">종류</option>
					<option value="n">이름</option>
					<option value="rk">지역/종류</option>	
					<option value="rn">지역 /이름</option>
					<option value="kn">종류/이름</option>
					<option value="rkn">전체</option>
				</select>
			</div>
<!-- 			<div class="input-group"> -->
<!-- 				<select class="form-control" name="kind" id="kind" onchange = "kindChange()"> -->
<!-- 					<option value="A">전체</option> -->
<!-- 					<option value="B">한식</option> -->
<!-- 					<option value="C">분식</option> -->
<!-- 					<option value="D">양식</option> -->
<!-- 					<option value="E">해산물</option> -->
<!-- 					<option value="F">회/스시</option> -->
<!-- 					<option value="G">세계음식</option> -->
<!-- 					<option value="H">뷔페</option> -->
<!-- 					<option value="I">디저트</option> -->
<!-- 					<option value="J">카페</option> -->
<!-- 					<option value="K">술집</option> -->
<!-- 					<option value="L">브런치</option> -->
<!-- 					<option value="M">치킨</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
			
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search"
					name="word" id="word" value="${pageObject.word }">
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
							<br>
							<div><p><span class="glyphicon glyphicon-eye-open" style="padding-right: 5px;"></span> ${vo.hit}</p>							
							</div>
						</div>

					</div>
				</div>
				<!-- 이미지 데이터 한개 표시 끝 -->
				<c:if test="${vs.count % 4 == 0 && vs.count != pageObject.perPageNum }">
					${"</div>" }
					${"<div class='row'>" }
		</c:if>
			</c:forEach>
		</div>
		<!--  이미지 한줄 끝 -->
		<div>
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>

			<a href="write.do?perPageNum=${pageObject.perPageNum }"
				class="btn btn-default">등록</a>
		</div>
	</div>

</body>
</html>