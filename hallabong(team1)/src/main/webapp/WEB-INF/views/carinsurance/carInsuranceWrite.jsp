<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<title>렌트카 보험 등록</title>

<style type="text/css">
.row{
	display: grid;
}
#buttonDiv{
padding-top: 15px;
}
#plusBtn{
padding-bottom: 15px;

}
</style>
<script type="text/javascript" src="/resources/rentCar/regEx.js"></script>
<script type="text/javascript" src="/resources/rentCar/form.js"></script>
<script>

	var carNo = "${param.carNo }"
	var perPageNum = "${param.perPageNum}";
</script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/carinsurance/writeFunc.js"></script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/carinsurance/writeEvent.js"></script>

</head>
<body>
	<div class="container">
		<h2>렌트카 등록</h2>
			
			<!-- 방금 등록한 차번호 -->
			<!-- /.row -->
			<div class="row">
				<!-- /.col-lg-12 차량 정보 표시 -->
				<div class="col-lg-12">
					<div class="panel panel-default row">
						<!-- 테이블의 소제목 -->
						<div class="panel-heading">등록할 회사, 차량</div>
						<!-- /.panel-heading -->
						<div class="panel-body form-group">
						
						    <div class="col-lg-12">
							
							<label for="category">보험 카테고리</label> 
								<select name="category" id="category1" class="form-control">
									<option value="일반자차" selected="selected">일반자차</option>
									<option value="고급자차">고급자차</option>
								</select>			
							</div>
						
							<div class="col-lg-6">
								<label for="insurancePrice">보험금</label> 
								<input name="insurancePrice" id="insurancePrice1" class="form-control insurancePrice">
							</div>
							
							<div class="col-lg-6">
								<label for="insuranceAge">보험 가입 대상 나이</label> 
								<input name="insuranceAge" id="insuranceAge1" class="form-control insuranceAge">
							</div>
							<div class="col-lg-6">
								<label for="insuranceExperience">보험 가입 운전경력</label> 
								<input name="insuranceExperience" id="insuranceExperience1" class="form-control insuranceExperience">
							</div >
							<div class="col-lg-6">
								<label for="compensation">보상한도</label> 
								<input name="compensation" id="compensation1" class="form-control compensation">
							</div>
							<div class="col-lg-12">
								<label for="customerCharge">고객 부담금</label> 
								<textarea rows="5" name="customerCharge" id="customerCharge1" class="form-control"></textarea>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 차량 정보 표시 -->
			</div>
			<!--/. row -->
			
			<div id="plusBtn">
			<button  class="btn btn-default" id="InsurancePlusBtn" type="button">보험 내용 추가</button>
			<button  class="btn btn-default" id="InsurancePlusBtnClose" type="button">보험 내용 추가 닫기</button>
			</div>
			
						<!-- /.row -->
			<div class="row" id="InsurancePlus" data-plus="">
				<!-- /.col-lg-12 차량 정보 표시 -->
				<div class="col-lg-12">
					<div class="panel panel-default row">
						<!-- 테이블의 소제목 -->
						<div class="panel-heading col-lg-12">등록할 회사, 차량</div>
						<!-- /.panel-heading -->
						<div class="panel-body form-group">
							 <div class="col-lg-6">
							 	<label for="category">보험 카테고리</label> 
								<select name="category" id="category2" class="form-control">
									<option value="일반자차">일반자차</option>
									<option value="고급자차" selected="selected">고급자차</option>
								</select>			
							</div>							
							<div class="col-lg-6">
								<label for="insurancePrice">보험금</label> 
								<input name="insurancePrice" id="insurancePrice2" class="form-control insurancePrice">
							</div>
							
							<div class="col-lg-6">
								<label for="insuranceAge">보험 가입 대상 나이</label> 
								<input name="insuranceAge" id="insuranceAge2" class="form-control insuranceAge">
							</div>
							<div class="col-lg-6">
								<label for="insuranceExperience">보험 가입 운전경력</label> 
								<input name="insuranceExperience" id="insuranceExperience2" class="form-control insuranceExperience">
							</div >
							<div class="col-lg-6">
								<label for="compensation">보상한도</label> 
								<input name="compensation" id="compensation2" class="form-control compensation">
							</div>
							<div class="col-lg-6">
								<label for="customerCharge">고객 부담금</label> 
								<textarea rows="5" name="customerCharge" id="customerCharge2" class="form-control"></textarea>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 차량 정보 표시 -->
			</div>
			<!--/. row -->
			
			
			
			<div id="buttonDiv">
				<button class="btn btn-default" type="button" id="submitBtn">등록</button>
				<button class="btn btn-default" type="button" id="resetBtn">새로입력</button>
				<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
			</div>
		<!-- 


			 -->






	</div>
</body>
</html>