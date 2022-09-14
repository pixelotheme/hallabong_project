<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트카 예약 리스트</title>

<!--    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
$(function(){

	//검색 데이터 세팅
	$("#key").val("${empty(pageObject.key)?'I':pageObject.key}");
	$("#word").val("${pageObject.word}");
	$("#perPageNum").val("${pageObject.perPageNum}");
	// 리스트데이터 클릭 이벤트 -> 글보기로 이동
	$(".dataRow").on("click", function(){
		// alert("글보기로 이동");
		var bookingNo = $(this).find(".bookingNo").text();
		location = "view.do?bookingNo="+bookingNo
					+ "&page=" + "${pageObject.page}"
					+ "&perPageNum=" + "${pageObject.perPageNum}"
					+ "&key=" + "${pageObject.key}"
					+ "&word=" + "${pageObject.word}";
	});

	// 글등록 버튼 이벤트
	$("#writeBtn").on("click", function(){
		// alert("글등록으로 이동");
		location = "write.do?perPageNum=${pageObject.perPageNum}";
	});
	
	
});
</script>
</head>
<body>
<div class="container">
	<!-- 페이지 제목 줄 -->
	<div class="row">
		<div class="col-md-12">
		<h2>렌트카 예약 리스트</h2>
		</div>
	</div>
	<!-- /. 페이지 제목줄 끝 -->
	<c:if test="${login.gradeNo == 9}">

		<!-- 검색 줄 -->
		<div class="row" style="padding: 5px;">
			<!-- 검색 -->
			<div class="col-md-8">
				<form class="form-inline">
					<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					<div class="input-group">
					  	<select class="form-control" name="key" id="key">
					  		<option value="I">예약자 아이디</option>
					  		<option value="N">차종</option>
					  		<option value="C">회사명</option>
					  	</select>
				  	</div>
					<div class="input-group">
					  <input type="text" class="form-control" placeholder="Search" name="word"
					   id="word">
					  <div class="input-group-btn">
					    <button class="btn btn-default" type="submit">
					      <i class="glyphicon glyphicon-search"></i>
					    </button>
					  </div>
				  </div>
				</form>
			</div>
		</div>
		<!-- 검색 줄의 끝 -->
		</c:if>
	<!-- 데이터 표시 -->
	
	<div class="row">
		<div class="col-md-12">
			<!-- 데이터 들어가는공간 -->
			<div class="list-group">
				<c:forEach items="${rbList }" var="vo">
					<c:if test="${login.gradeNo == 9 }">
					
						<div class="list-group-item dataRow row">
							<div class="col-md-3">
								<span class="bookingNo">${vo.bookingNo }</span>
							</div>
							<div class="col-md-3">
								<strong> ${vo.companyName }</strong>
								<span class="badge pull-right">${vo.carName }</span>
							</div>
							<div class="col-md-3">
								<span>
									<fmt:formatDate value="${vo.rentalDate }" pattern="yyyy-MM-dd"/>
									~ <fmt:formatDate value="${vo.returnDate }" pattern="MM-dd"/>
								</span>
							</div>
							<div class="col-md-3">
								<span><fmt:formatNumber value="${vo.totalPrice }" pattern="#,###"/>원</span>
	
								<span>${vo.bookingStatus }</span>
								<span>예약자 - ${vo.consumerId }</span>
								
							</div>
						</div><!-- //데이터 출력 -->
					</c:if>
					<c:if test="${login.gradeNo == 1}">
						<c:if test="${login.id == vo.consumerId }">
							<div class="list-group-item dataRow row">
								<div class="col-md-3">
									<span class="bookingNo">${vo.bookingNo }</span>
								</div>
								<div class="col-md-3">
									<strong> ${vo.companyName }</strong>
									<span class="badge pull-right">${vo.carName }</span>
								</div>
								<div class="col-md-3">
									<span>
										<fmt:formatDate value="${vo.rentalDate }" pattern="yyyy-MM-dd"/>
										~ <fmt:formatDate value="${vo.returnDate }" pattern="MM-dd"/>
									</span>
								</div>
								<div class="col-md-3">
									<span><fmt:formatNumber value="${vo.totalPrice }" pattern="#,###"/>원</span>
		
									<span class="badge">${vo.bookingStatus }</span>
									<span>[예약자 - ${vo.consumerId }]</span>
									
								</div>
							</div><!-- //데이터 출력 -->						
						</c:if>
					
					</c:if>
				</c:forEach>
			</div>			
		</div>
	</div>
	
	<!-- /.데이터 표시 끝 -->
	
	<!-- 페이지 처리, 버튼  -->
	<div class="row">
		<div class="col-md-4">
			<div class="btn-group" style="padding: 20px;">
			  <button type="button" class="btn btn-default" id="writeBtn">등록</button>
			</div>
		</div>
		<div class="col-md-8 pull-right text-right">
			<pageNav:rentCarPageNav listURI="list.do" pageObject="${pageObject }"/>
		</div>
	</div>
	<!-- 페이지 처리 끝-->
	
	
	
</div>

</body>
</html>