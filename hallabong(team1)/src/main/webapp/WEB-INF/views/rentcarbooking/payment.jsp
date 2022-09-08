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

   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	




	
	$("#accountTransfer").hide();
	$("#creditCard").hide();
	$("#paymentAccountID").hide();
	
	$("#paymentType").on("change", function(){
		var type = $("#paymentType").val();
// 		alert(type);
		if(type == '카드'){
			$("#creditCard").show();
			$("#accountTransfer").hide();
			$("#paymentAccountID").show();
			}
		else if(type == '계좌이체'){
			$("#accountTransfer").show();
			$("#creditCard").hide();
			$("#paymentAccountID").show();
			}

		})
	$("#paymentID").on("click",function(){
		event.preventDefault();
		var type = $("#paymentType").val();
		if(type == ""){
			alert("결제방법을 선택해주세요")
			return;
			}
		else{
			if(type == '카드'){
				$("#accountTransferId").html("");
				
				}
			else{
				$("#creditCardSpan").html("");
				}
			$("#paymentForm").submit();
			}
		})

		//랜덤 값 계좌처럼 출력
		var random = "${random}";
		random = random.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, "-")
	$("#paymentAccountID").val(random);


		
});
// 		$("#paymentType").val("${param.paymentType}");
		
		jQuery(document).ready(function() {

//		 	   alert("로딩 완료"); 
				//페이지 로드가 끝나면 value에 넣어주고 - selected 된 것을 바꿔준다
			   $("#paymentType option[value=${param.paymentType}]").prop('selected','selected').change();
			});	
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

<!-- row 회원정보 열-->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!-- 테이블의 소제목 -->
			<div class="panel-heading">사용자 정보 입력</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="" method="post" id="paymentForm">
				<input type="hidden" value="${param.bookingNo }" name="bookingNo" />
				<input type="hidden" value="결제" name="bookingStatus">
				
					<div class="form-group">
					
						<div >
							<label>결제종류</label>
							<select class="form-control" name="paymentType" id="paymentType">
								<option value="">결제 방법 선택</option>
								<option value="카드">신용카드</option>
								<option value="계좌이체">계좌이체</option>
							</select>
						</div>
						<div id="companyDIV">
							<label>결제회사</label>
							<span id="creditCardSpan">
								<select class="form-control" name="paymentCompany" id="creditCard">
									<option value="삼성">삼성</option>
									<option value="현대" >현대</option>
									<option value="농협" >농협</option>
									<option value="신한" >신한</option>
								</select>
							
							</span >
							<span id="accountTransferId">
								<select class="form-control" name="paymentCompany" id="accountTransfer">
									<option value="${param.companyName }">${param.companyName }</option>
	<%-- 								<option value="${vo.companyName }">${vo.companyName }</option> --%>
								</select>
							</span>						
						</div>
						<div>
							<label>결제계좌</label> 
							<input class="form-control" name="paymentAccount" value="" id="paymentAccountID" readonly="readonly"/>
								
						</div>
					</div>
					<button type="submit" class="btn btn-default" id="paymentID">예약하기</button>
					<button type="reset" class="btn btn-default">새로고침</button>
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