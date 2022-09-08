<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>

<title>렌트카 등록</title>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<style type="text/css">
.row{
	display: grid;
}
</style>


<script type="text/javascript"
	src="/resources/rentCar/rentCarJS/companyWrite.js"></script>
<script>


	//다음 api js 파일로 옮김
$(function(){
	var licensePlateDiv = $("#licensePlateDiv");
	
// 	$("#InsurancePlus").hide();
	
	$("#licensePlatePlusbtn").on("click",function(){
		var str = "";

		str += "<div>"
		str += "<label for='licensePlate'>번호판"
		str += "</label>"
		str += "<input name='licensePlate' id='licensePlate' class='form-control licensePlate'>"		
		str += "</div>"

			licensePlateDiv.append(str);
	})	
		

	$("#submitBtn").on("click",function(){
		event.preventDefault();
		
		var reg = /\s/g;
		
		var licensePlates = $("#licensePlateDiv input");
		
		var n = licensePlates.length;
// 		alert(n);
// 		alert(licensePlates);
		var i = 0;
		licensePlates.each(function(){
			//값 수정
			var licensePlateVal =licensePlates.eq(i).val();
			
			licensePlateVal = licensePlateVal.replace(reg, "");
// 			alert(licensePlateVal)
			licensePlates.eq(i).val(licensePlateVal)
			
			if(i < n){
				i = i + 1;
// 				alert(i);
				}
			
			})
		$("#actionForm").submit();
		})// end of submitBtn

	$("#cancelBtn").on("click",function(){
			$("#licensePlateDiv").remove();
	        $("#actionForm").attr("action", "/companycars/companyCarsList.do").attr("method","get").submit();
				
		})
		
})
	
</script>

</head>
<body>
	<div class="container">
		<h2>번호판 등록</h2>
			
			<!-- 현재 보고있는  차량 의 번호판 목록 (같은회사의) ajax로 불러와 데이터 저장해둔뒤 넘어가는 데이터와 비교 
			
			-->
			
			<!-- 방금 등록한 차번호 -->
			<form action="" method="post" id="actionForm">
				<input type="hidden" name="carNo" value="${param.carNo }">
				<input type="hidden" name="companyNo" value="${param.companyNo}">
				<input type="hidden" name="carInfoNo" value="${param.carInfoNo}">

			<!-- /.row -->
			<div class="row">
				<!-- /.col-lg-12 차량 정보 표시 -->
				<div class="col-lg-12">
					<div class="panel panel-default row">
						<!-- 테이블의 소제목 -->
						<div class="panel-heading">번호판 등록
						<button id="licensePlatePlusbtn" type="button">번호판 입력 추가</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
						
							<div id="licensePlateDiv" >
								<div>
									<label for="licensePlate">번호판</label> 
									<input name="licensePlate" id="licensePlate" class="form-control licensePlate">
								</div>
							
							</div>						
						
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 차량 정보 표시 -->
			</div>
			<!--/. row -->				
				
			<div>
				<button type="button" id="submitBtn">등록</button>
				<button type="reset">새로입력</button>
				<button type="button" id="cancelBtn">취소</button>
			</div>
			</form>
			
			
			
			
		<!-- 


			 -->






	</div>
</body>
</html>