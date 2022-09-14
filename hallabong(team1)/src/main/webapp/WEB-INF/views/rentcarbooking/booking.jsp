<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세정보 작성</title>

<!--    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarBookingJS/userTelForWrite.js"></script>

<script type="text/javascript" src="/resources/rentcarbooking/js/bookingEvent.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#cancelBtn").on("click",function(){
		location="/rentcarboard/rentCarBoardView.do?carNo=${param.carNo}&carInfoNo=${param.carInfoNo}&companyNo=${param.companyNo}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";		
		})

	//회원정보 자동입력
	$("#sameInfo").on("click",function(){
		$("#userName").val("${loginVO.name}");
		$("#userEmail").val("${loginVO.email}");
		$("#userTel").val("${loginVO.tel}");
		})

	
});

function bookingSendMail(){
	const email = $("#loginEmail").val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
	
	$.ajax({
		type : 'get',
		url : "/bookingMail/mailCheck.do", // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		data: { 
			email
			},
		success : function (data) {
			console.log("data : " +  data);
			alert('예약메일 발송')
		}			
	}); // end ajax	
}

</script>
</head>
<body>
<div class="container">
	<!-- 페이지 제목 줄 -->
	<div class="row">
		<div class="col-md-12">
		<h2>예약 상세정보 작성</h2>
		</div>
	</div>
	<!-- /. 페이지 제목줄 끝 -->
	

	
	<!-- 데이터 표시 -->
<!-- /.row -->
<div class="row">
	<!-- /.col-lg-12 차량 정보 표시 -->
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">차량 정보</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
					<div class="form-group">
						<label>회사이름</label> <input class="form-control" value="${vo.companyName }" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>차량이름</label> <input class="form-control" value="${vo.companyName }" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>연료</label> <input class="form-control" value="${vo.carFuel }"  readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>보험종류</label> <input class="form-control" value="${vo.insuranceType }" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>대여일</label> <input class="form-control" value="${param.rentalDate }" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>반납일</label> <input class="form-control" value="${param.returnDate }" readonly="readonly" />
					</div>
					<div class="form-group">
						<label>상품금액</label> <input class="form-control" value="<fmt:formatNumber value='${vo.prePrice }' pattern='#,###원'/>" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>최종금액</label> <input class="form-control" value="<fmt:formatNumber value='${vo.totalPrice }' pattern='#,###원'/>"  readonly="readonly"/>
					</div>


				

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 차량 정보 표시 -->
</div>
<!--/. row -->

<!-- row 회원정보 열-->
<div class="row">
	<div class="col-lg-6">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">회원 정보</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
					<div class="form-group">
						<label>이름</label> <input class="form-control"  readonly="readonly" value="${loginVO.name }" />
					</div>
					<div class="form-group">
						<label>이메일</label> <input class="form-control" readonly="readonly" value="${loginVO.email }" id="loginEmail"/>
					</div>
					<div class="form-group">
						<label>휴대폰</label> <input class="form-control"readonly="readonly" value="${loginVO.tel }"/>
					</div>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<div class="col-lg-6">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">사용자 정보 입력
			<button type="button" id="sameInfo" class="btn btn-default">회원정보와 같다</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
			
				<form method="post" id="actionForm">
				<input type="hidden" value="${vo.carNo }" name="carNo">
				<input type="hidden" value="${vo.companyNo }" name="companyNo">
				<input type="hidden" value="${vo.carInfoNo }" name="carInfoNo">
				<input type="hidden" value="${companyCarsNo.companyCarsNo }" name="companyCarsNo">
				<input type="hidden" value="${vo.prePrice }" name="prePrice" />
				<input type="hidden" value="${vo.totalPrice }" name="totalPrice" />	
				<!-- 로그인 아이디로 지정할 예정 -->			
				<input type="hidden" value="${login.id }" name="consumerId" />		
				<input type="hidden" value="${vo.companyName}" name="companyName" />		
<%-- 				<input type="hidden" value='${param.rentalDate }' name="rentalDate"> --%>
<%-- 				<input type="hidden" value='${param.returnDate }' name="returnDate"> --%>
				<input type="hidden" name="rentalDate" value='<fmt:formatDate value="${vo.rentalDate }" pattern="yyyy-MM-dd"/>'/>
				<input type="hidden" name="returnDate" value='<fmt:formatDate value="${vo.returnDate }" pattern="yyyy-MM-dd"/>'/>
<%-- 					<fmt:formatDate value="${param.returnDate }" pattern="yyyy-MM-dd"/> --%>
					<div class="form-group">
						<label>이름</label> <input class="form-control" name="userName" id="userName" data-un=""/>
					</div>
					<div class="form-group">
						<label>이메일</label> <input class="form-control" name="userEmail" id="userEmail" data-ue=""/>
					</div>
					<div class="form-group">
						<label>휴대폰</label> <input class="form-control" name="userTel" id="userTel" maxlength="13" data-ut=""/>
						
					</div>
					<div class="form-group">
						<label>면허번호</label> <input class="form-control" name="drivingLicense" id="drivingLicense" data-ul=""/>
					</div>
					<button type="button" class="btn btn-default" id="submitBtn">예약하기</button>
					<button type="reset" class="btn btn-default">새로고침</button>
					<button type="button" class="btn btn-default" id="cancelBtn" >취소</button>
				</form>

				

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>

	
</div>
<!-- /.row  -->
	<!-- /.데이터 표시 끝 -->
	
	
	
</div>

</body>
</html>