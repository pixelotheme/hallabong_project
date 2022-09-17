<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>호텔  리스트</title>

<style type="text/css">
.dataRow:hover {
	background : #eee;
	cursor:pointer;

}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!--    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->


<script type="text/javascript">
	$(function(){
		$(".dataRow").on("click", function(){
			alert("보기로 이동");
				var no = $(this).data("no");
					location = "view.do?no=" + no + "&page=${pageObject.page}"
 							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
				});

	});
</script>

</head>
<body>
<div class="container-fluid page-header">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
                <h3 class="display-4 text-white text-uppercase">HOTEL LIST</h3>
                <div class="d-inline-flex text-white">
                    <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                    <i class="fa fa-angle-double-right pt-1 px-3"></i>
                    <p class="m-0 text-uppercase">reservation</p>
                </div>
            </div>
        </div>
    </div>
	<div class="container">
	<h1 style="text-align: center;">호텔 리스트</h1> 

		<form class="form-inline">
			<div class="input-group">
				<select class="form-control" name="key" id="key">
				<option value="">지역 선택</option>
				<option value="제주시">제주시</option>
				<option value="서귀포시">서귀포시</option>
				<option value="조천읍">조천읍</option>
				<option value="한림읍">한림읍</option>
				<option value="한경면">한경면</option>
				<option value="대정읍">대정읍</option>
				<option value="안덕면">안덕면</option>
				<option value="남원읍">남원읍</option>
				</select>
				
			</div>
			
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
						<img src="${vo.fileName }" alt="${vo.name}" style="width: 100%">
						<div class="caption">
							<div>${vo.name }</div>
							<div class="area">${vo.area }</div>
							<div class="bus_address">${vo.bus_address}</div>
							<div>${vo.content }</div>
							<br>
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