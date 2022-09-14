<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세정보 수정</title>

<!--    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  
  <!-- datepicker -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 위치 중요 css -->
<link rel="stylesheet" type="text/css" href="/resources/rentCar/rentCarCSS/rentCarDatePicker.css">
<!-- js -->
<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarDatePicker.js"></script>

<script type="text/javascript">
$(function(){

	//대여,반납일
	$("#dateChange").on("change",function(){

		 var prePrice =  "${vo.prePrice}";
		 var rentalDate = $("#rentalDate").val();
		 var returnDate = $("#returnDate").val();
		if(!rentalDate){
			alert("대여일을 선택해주세요")
			return
			}
		if(!returnDate){
			alert("반납일을 선택해주세요")
			return			
			}
		var Date = {rentalDate : $("#rentalDate").val() , returnDate : $("#returnDate").val(), prePrice: prePrice}
		
// 		alert(JSON.stringify(Date))

		$.ajax({
			     method: 'post',
			     url: '/rentcarboardajaxcontroller/totalPrice.do',
			     data: JSON.stringify(Date),
			     contentType: "application/json; charset=utf-8",
			     success: function (data,status, xhr) {
			        if (data) {
						if(data.totalPrice == prePrice){
							alert("대여,반납일을 다시선택해주세요")
							}
						else{
// 							alert("성공 "+data.totalPrice);
							var ajaxPrice = data.totalPrice;

// 							alert("천단위"+ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
							var formatPrice = ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							str = "<p>"+formatPrice+"원</p>"
							$("#bookingPrice").html(str);
							$("#totalPrice").attr("value", ajaxPrice)
							}

			        }
			     },
			     error: function (xhr,status, error){
// 			    	  	alert("에러"+error);
			    	  	alert("예약날짜를 다시 확인해주세요");
			    	  }
			   });//end of ajax
	
	})
	
//정규표현식
	
	$("#userName").change(function(){
		var regex = /\s/g;				

		var userName = $("#userName").val();
		userName = userName.replace(regex, "");
		$("#userName").val(userName);
				
		})	
	$("#userEmail").change(function(){
		 var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		 var regex = /\s/g;	

		 
		 var userEmail = $("#userEmail").val();
		 userEmail = userEmail.replace(regex, "");
		 
		 if(regEmail.test(userEmail) === false){
				alert("이메일을 확인해주세요 (영문+숫자)")
				$("#userEmail").val(userEmail);
			 }
		})
		
	$("#drivingLicense").change(function(){
		var regexLicense = /(\d{2}-\d{2}-\d{6}-\d{2})/;			

		
		var drivingLicense = $("#drivingLicense").val();

		if(regexLicense.test(drivingLicense) === false){
			alert("운전면허를 확인해주세요  - 형식 11-11-111111-11");

		}		
		})

	$("#submitBtn").on("click",function(){
		event.preventDefault();
		 var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		 var regex = /\s/g;		//공백 확인	
		 var regexLicense = /(\d{2}-\d{2}-\d{6}-\d{2})/;
		 var regName = /^[가-힣]{2,10}$/ 


		var userName = $("#userName").val();
		if(regName.test(userName) === false){
			alert("이름 입력 2~10 이내 공백 제외");
			return false;
			}	
			
		 var userEmail = $("#userEmail").val();
		 userEmail = userEmail.replace(regex, "");
		 
		 if(regEmail.test(userEmail) === false){
				alert("이메일을 확인해주세요 (test@test.com)")
				$("#userEmail").val(userEmail);
				return false
			 }
		var drivingLicense = $("#drivingLicense").val();

		if(regexLicense.test(drivingLicense) === false){
				alert("운전면허를 확인해주세요  - 형식 11-11-111111-11");

			return false;
			
			};	

		var regTel1 = /(\d{2,3}[ ,-]-?\d{2,4}[ ,-]-?\d{4})/; //00-
		
		var userTel = $("#userTel").val();
		alert(regTel1.test(userTel));
		if(regTel1.test(userTel) === false){
			alert("연락처를 입력해주세요")
			return false;			

			}

		$("#actionForm").submit();
		
		})//end of submitBtn


	$("#cancelBtn").on("click",function(){
		location="/rentcarbooking/view.do?bookingNo=${param.bookingNo}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}"
		})
	
});
jQuery(document).ready(function() {

//	   alert("로딩 완료"); 
		//페이지 로드가 끝나면 value에 넣어주고 - selected 된 것을 바꿔준다
		if("${login.gradeNo == 9 }"){
		   $("#bookingStatus option[value=${bookingVO.bookingStatus}]").prop('selected','selected').change();
			}
	   
	});	
</script>
</head>
<body>
<div class="container">
	<!-- 페이지 제목 줄 -->
	<div class="row">
		<div class="col-md-12">
		<h2>예약 상세정보 수정</h2>
		</div>
	</div>
	<!-- /. 페이지 제목줄 끝 -->
	

	
	<!-- 데이터 표시 -->
<!-- /.row -->
<div class="row">
	<!-- /.col-lg-12 차량 정보 표시 -->
	<div class="col-lg-6">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">차량 정보</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
					<div class="form-group">
						<label>회사이름</label> <input class="form-control" value="${vo.companyName }" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>차량이름</label> <input class="form-control" value="${vo.carName }" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>연료</label> <input class="form-control" value="${vo.carFuel }"  readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>보험종류</label> <input class="form-control" value="${vo.insuranceType }" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>대여일</label> <input class="form-control" value='<fmt:formatDate value="${bookingVO.rentalDate }" pattern="yyyy-MM-dd"/>' readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>반납일</label> <input class="form-control" value='<fmt:formatDate value="${bookingVO.returnDate }" pattern="yyyy-MM-dd"/>'  readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>상품금액</label> <input class="form-control" value="<fmt:formatNumber value='${vo.prePrice }' pattern='#,###'/>" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>최종금액</label> <input class="form-control" value="<fmt:formatNumber value='${bookingVO.totalPrice }' pattern='#,###'/>"  readonly="readonly"/>
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
						<label>이름</label> <input class="form-control" name="name" readonly="readonly" value="${loginVO.name }"/>
					</div>
					<div class="form-group">
						<label>이메일</label> <input class="form-control" name="email" readonly="readonly" value="${loginVO.email }"/>
					</div>
					<div class="form-group">
						<label>휴대폰</label> <input class="form-control" name="tel" readonly="readonly" value="${loginVO.tel }"/>
					</div>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<div class="col-lg-6">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">사용자 정보 입력</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form method="post" id="actionForm">
				
				<input type="hidden" value="${bookingVO.bookingNo }" name="bookingNo">
				<input type="hidden" value="${bookingVO.carNo }" name="carNo">
				<input type="hidden" value="${bookingVO.companyNo }" name="companyNo">
				<input type="hidden" value="${bookingVO.carInfoNo }" name="carInfoNo">
				<input type="hidden" value="${bookingVO.companyCarsNo }" name="companyCarsNo">
				<input type="hidden" value="${vo.prePrice }" name="prePrice" />
				<input type="hidden" value="${bookingVO.totalPrice }" name="totalPrice" id="totalPrice" />				
				<input type="hidden" value="test" name="consumerId" />		
				<input type="hidden" value="${bookingVO.companyName}" name="companyName" />	
				<input type="hidden" value="${bookingVO.paymentType}" name="paymentType" />	
				<input type="hidden" value="${bookingVO.paymentAccount}" name="paymentAccount" />
				<input type="hidden" name="page" value="${param.page}">
				<input type="hidden" name="perPageNum" value="${param.perPageNum}">			
				<div class="form-group">
					<div>
						<label>이름</label> <input class="form-control" name="userName" id="userName" value="${bookingVO.userName }"/>
					</div>
					<div>
						<label>이메일</label> <input class="form-control" name="userEmail" id="userEmail" value="${bookingVO.userEmail }"/>
					</div>
					<div >
						<label>휴대폰</label> <input class="form-control" name="userTel" id="userTel" value="${bookingVO.userTel }"/>
					</div>
					<div >
						<label>면허번호</label> <input class="form-control" name="drivingLicense" id="drivingLicense" value="${bookingVO.drivingLicense }" />
					</div>
					
					<div id="dateChange">
						<div>
							<label for="rentalDate">대여일</label>
							<input class="datepicker" id="rentalDate" name='rentalDate' value='<fmt:formatDate value="${bookingVO.rentalDate }" pattern="yyyy-MM-dd"/>'/>
						</div>
						<div>
							<label for="returnDate">반납일</label>
							<input class="datepicker" id="returnDate" name='returnDate' value='<fmt:formatDate value="${bookingVO.returnDate }" pattern="yyyy-MM-dd"/>'>
						</div>
					</div>
					
					<div id="bookingPrice">
						<fmt:formatNumber value="${bookingVO.totalPrice}" pattern="#,###" />
					</div>
					<!-- 관리자 권한일때만 수정가능 -->		
					<c:if test="${login.gradeNo == 9 }">
						<div>
							<label for="bookingStatus">예약 현황</label>
							<select name="bookingStatus" id="bookingStatus" class="form-control">
								<option value="예약">예약</option>
								<option value="결제">결제</option>
								<option value="대여">대여</option>
								<option value="반납">반납</option>
							</select>
						
						</div>
					</c:if>		
					<c:if test="${login.gradeNo == 1 }">
						<div>
							<label for="bookingStatus">예약 현황</label>
							<input class="form-control" id="bookingStatus" name="bookingStatus" value="${bookingVO.bookingStatus}" readonly="readonly">
						</div>
					</c:if>		
				</div>
					<button type="button" class="btn btn-default" id="submitBtn">예약 수정</button>
					<button type="reset" class="btn btn-default">새로고침</button>
					<button type="button" class="btn btn-default" id="cancelBtn">수정 취소</button>
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>

	
</div>
<!-- /.row  -->
	
	<!-- 버튼 끝-->
	
	
</div>

</body>
</html>