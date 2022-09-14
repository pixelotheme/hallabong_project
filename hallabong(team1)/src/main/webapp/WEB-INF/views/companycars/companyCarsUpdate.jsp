<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>

<title>렌트카 수정</title>
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
	$("#cancelBtn").on("click",function(){

			var str = '<input type="hidden" name="key" value="${param.key}">';
			str += '<input type="hidden" name="word" value="${param.word}">';
			$("#formAction").append(str);
			$("#licensePlateDiv").remove();
	        $("#formAction").attr("action", "/companycars/companyCarsView.do").attr("method","get").submit();
				
		})
	$("#licensePlate").keyup(function(){
		var reg = /\s/g;

		var licensePlate = $("#licensePlate").val();
		
		$("#licensePlate").val(licensePlate.replace(reg, ""))
		})

})
	
</script>

</head>
<body>
	<div class="container">
		<h2>번호판 수정</h2>
			
			<!-- 방금 등록한 차번호 -->
			<form action="" method="post" id="formAction">
				<input type="hidden" name="carNo" value="${param.carNo }">
				<input type="hidden" name="companyNo" value="${param.companyNo}">
				<input type="hidden" name="companyCarsNo" value="${param.companyCarsNo}">
				<input type="hidden" name="carInfoNo" value="${param.carInfoNo}">
				
				<input type="hidden" name="page" value="${param.page}">
				<input type="hidden" name="perPageNum" value="${param.perPageNum}">

				<!-- /.row -->
				<div class="row">
					<!-- /.col-lg-12 차량 정보 표시 -->
					<div class="col-lg-12">
						<div class="panel panel-default row">
							<!-- 테이블의 소제목 -->
							<div class="panel-heading">번호판 수정
							
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
							
								<div id="licensePlateDiv" >
									<div id="licensePlateDiv">
										<label for="licensePlate">번호판</label> 
										<input name="licensePlate" id="licensePlate" value="${companyCarsVO.licensePlate }"  class="form-control licensePlate">
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
				<button type="submit" id="submitBtn">수정</button>
				<button type="reset">새로입력</button>
				<button type="button" id="cancelBtn">취소</button>
			</div>
			</form>
			
			
			
			
		<!-- 


			 -->






	</div>
</body>
</html>