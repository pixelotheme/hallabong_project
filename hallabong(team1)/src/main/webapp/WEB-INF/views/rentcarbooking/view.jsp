<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 보기</title>

<!--    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
$(function(){

	
	// 리스트버튼 클릭 이벤트 -> 글보기로 이동
	$("#listBtn").on("click", function(){
		// alert("글보기로 이동");
		location = "list.do?"
					+ "&page=" + "${param.page}"
					+ "&perPageNum=" + "${param.perPageNum}"
					+ "&key=" + "${param.key}"
					+ "&word=" + "${param.word}";
	});

	// 글수정 버튼 이벤트
	$("#updateBtn").on("click", function(){
		// alert("글등록으로 이동");
		location = "update.do?bookingNo=${vo.bookingNo}&companyCarsNo=${vo.companyCarsNo}"
		+ "&carNo=${vo.carNo}&companyNo=${vo.companyNo}&carInfoNo=${vo.carInfoNo}"
		+ "&page=" + "${param.page}"
		+ "&perPageNum=" + "${param.perPageNum}"
		+ "&key=" + "${param.key}"
		+ "&word=" + "${param.word}"
		+ "&mypage="+"${param.mypage}";
	});
	
	// 삭제 버튼 이벤트
	$("#deleteBtn").on("click", function(){
		// alert("새로고침 클릭");
		if(confirm("예약을 취소하시겠습니까?")){
		location = "delete.do?bookingNo=${vo.bookingNo}&companyCarsNo=${vo.companyCarsNo}";
			}
	});
	
});
</script>
</head>
<body>
<div class="container">
	<!-- 페이지 제목 줄 -->
	<div class="row">
		<div class="col-md-12">
		<h2>예약 보기</h2>
		</div>
	</div>
	<!-- /. 페이지 제목줄 끝 -->
	

	
	<!-- 데이터 표시 -->
	
	<!-- /.데이터 표시 끝 -->
		<div>
			<ul class="list-group">
		<!-- grid 를 사용한다면 class="col-md-2" 으로 할경우 깨짐 row 를 속성으로 넣어줘야 안깨진다 -->
				<li class="list-group-item row">
					<div class="col-md-3">예약번호</div>
					<div class="col-md-9">${vo.bookingNo }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">예약상태</div>
					<div class="col-md-9">${vo.bookingStatus }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">에약자 아이디</div>
					<div class="col-md-9">${vo.consumerId }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">사용자 이름</div>
					<div class="col-md-9">${vo.userName }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">사용자 이메일</div>
					<div class="col-md-9">${vo.userEmail }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">사용자 연락처</div>
					<div class="col-md-9">${vo.userTel }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">예약 금액</div>
					<div class="col-md-9"><fmt:formatNumber value='${vo.totalPrice }' pattern='#,###원'/></div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">결제 수단</div>
					<div class="col-md-9">${vo.paymentType }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">결제 회사</div>
					<div class="col-md-9">${vo.paymentCompany }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">결제 계좌</div>
					<div class="col-md-9">${vo.paymentAccount }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">면허 번호</div>
					<div class="col-md-9">${vo.drivingLicense }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">대여일</div>
					<div class="col-md-9">
					<fmt:formatDate value="${vo.rentalDate }" pattern="yyyy-MM-dd"/>
					</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">반납일</div>
					<div class="col-md-9">
					<fmt:formatDate value="${vo.returnDate }" pattern="yyyy-MM-dd"/>
					</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">렌터카 회사명</div>
					<div class="col-md-9">${vo.companyName }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-md-3">차종</div>
					<div class="col-md-9">${vo.carName }</div>
				</li>

			</ul>	
		</div>  		
	<!--  버튼 -->
	<div class="row">
		<div class="col-md-4">
			<div class="btn-group" style="padding: 20px;">
			<c:if test="${login.id == vo.consumerId || login.gradeNo == 9}">
			  <button type="button" class="btn btn-default" id="updateBtn">수정</button>
			  <button type="button" class="btn btn-default" id="deleteBtn">예약취소</button>
			</c:if>
			
			<c:if test="${param.mypage == 1 }">
			  <button type="button" class="btn btn-default" onclick="location='/member/myPage.do'">마이페이지</button>
			</c:if>
			<c:if test="${param.mypage != 1 }">
			  <button type="button" class="btn btn-default" id="listBtn">리스트</button>
			</c:if>
			</div>
		</div>
	</div>
	
	<!-- 버튼 끝-->
	
	
</div>

</body>
</html>