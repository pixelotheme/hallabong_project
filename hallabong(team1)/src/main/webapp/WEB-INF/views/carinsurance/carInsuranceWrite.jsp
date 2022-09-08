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
</style>
<script type="text/javascript" src="/resources/rentCar/regEx.js"></script>
<script type="text/javascript" src="/resources/rentCar/form.js"></script>
<script>
	//다음 api js 파일로 옮김
function checkData(num){
	if(!checkEmpty("insurancePrice"+num, "보험금1"+num))return false;
	if(!checkEmpty("insuranceAge"+num, "보험 가입 대상 나이"))return false;
	if(!checkEmpty("insuranceExperience"+num, "보험 가입 운전경력"))return false;
	if(!checkEmpty("compensation"+num, "보상한도"))return false;
	
	
	return true;
}	

	
$(function(){

	$("#InsurancePlus").hide();
	
	$("#InsurancePlusBtn").on("click",function(){
		$("#InsurancePlus").data("plus", "1")
// 		$("#InsurancePlus").fadeToggle(100);
		alert($("#InsurancePlus").data("plus"));
		$("#InsurancePlus").show(100);
		})	
	$("#InsurancePlusBtnClose").on("click",function(){
		$("#InsurancePlus").data("plus", "0")
// 		$("#InsurancePlus").fadeToggle(100);
		alert($("#InsurancePlus").data("plus"));
		$("#InsurancePlus").hide(100);
		})	
		
		
	$("#submitBtn").on("click",function(){
		var checkValue = false;
		if($("#InsurancePlus").data("plus") === 1){

			if(!checkData(1)){
				alert("입력다시")
				return false;
				}
			if(!checkData(2)){
				alert("입력다시")
				return false;
				}
			checkValue = true;
			}
		else{
			if(!checkData(1)){
				alert("입력다시")
				return false;
				}
			checkValue = true;
			}
		
		if(checkValue == true){
			var regex = /[^0-9]/g;
	
				let carInsuranceVOList = [
					{
						category : $("#category1").val(),
						insurancePrice : $("#insurancePrice1").val().replace(regex, ""),
						insuranceAge :$("#insuranceAge1").val().replace(regex, ""),
						insuranceExperience :$("#insuranceExperience1").val().replace(regex, ""),
						compensation :$("#compensation1").val().replace(regex, ""),
						customerCharge :$("#customerCharge1").val(),
						carNo : "${param.carNo }"
					}
					,
					{
						category : $("#category2").val(),
					insurancePrice : $("#insurancePrice2").val().replace(regex, ""),
					insuranceAge :$("#insuranceAge2").val().replace(regex, ""),
					insuranceExperience :$("#insuranceExperience2").val().replace(regex, ""),
					compensation :$("#compensation2").val().replace(regex, ""),
					customerCharge :$("#customerCharge2").val(),
					carNo : "${param.carNo }"
					} 
		
					];
	
			alert(JSON.stringify(carInsuranceVOList))
	//{ carInsuranceVOList : JSON.stringify(carInsuranceVOList) } 이렇게 넘겼다가 하루종일 못넘김 ;;
			   $.ajax({
				     method: 'post',
				     url: '/rentcarboardajaxcontroller/writeCarInsurance.do',
				     traditional: true,
				     data: JSON.stringify(carInsuranceVOList),
				     contentType: "application/json; charset=utf-8",
				     success: function (data,status, xhr) {
				        if (data) {
				        	checkValue = false;
				          alert("성공 "+data);
				          location='/rentcarboard/rentCarBoardList.do';
				        }
				     },
				     error: function (xhr,status, error){
				    	 checkValue = false;
				    	  	alert(error);
				    	  }
				   });//end of ajax

			}//end of ajax if
			else{
				
				}
		})

		
		
		
		//----------------
		
		//보험금가격 변환
		$("#insurancePrice1").change(function(){
			var insurancePrice = $("#insurancePrice1").val();
			var regex = /[^0-9]/g;

			insurancePrice = insurancePrice.replace(regex, "")
			
			insurancePrice = insurancePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

			$("#insurancePrice1").val(insurancePrice);
			})
		//보상한도가격 변환
		$("#compensation1").change(function(){
			var compensation = $("#compensation1").val();
			var regex = /[^0-9]/g;

			compensation = compensation.replace(regex, "");
			
			compensation = compensation.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

			$("#compensation1").val(compensation);
			})
		//보험 가입 대상 (만)나이
		$("#insuranceAge1").keyup(function(){
			var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

			var insuranceAge = $("#insuranceAge1").val();
			insuranceAge = insuranceAge.replace(regex, "")+'살';
			$("#insuranceAge1").val(insuranceAge);
					
			})	
//	 	보허 가입 대상 운전 경력
		$("#insuranceExperience1").keyup(function(){
			var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

			var insuranceExperience = $("#insuranceExperience1").val();
			insuranceExperience = insuranceExperience.replace(regex, "")+'년';
			$("#insuranceExperience1").val(insuranceExperience);
					
			})
	
		//보험금가격 변환
		$("#insurancePrice2").change(function(){
			var insurancePrice = $("#insurancePrice2").val();
			var regex = /[^0-9]/g;

			insurancePrice = insurancePrice.replace(regex, "")
			
			insurancePrice = insurancePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

			$("#insurancePrice2").val(insurancePrice);
			})
		//보상한도가격 변환
		$("#compensation2").change(function(){
			var compensation = $("#compensation2").val();
			var regex = /[^0-9]/g;

			compensation = compensation.replace(regex, "");
			
			compensation = compensation.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

			$("#compensation2").val(compensation);
			})
		//보험 가입 대상 (만)나이
		$("#insuranceAge2").keyup(function(){
			var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

			var insuranceAge = $("#insuranceAge2").val();
			insuranceAge = insuranceAge.replace(regex, "")+'살';
			$("#insuranceAge2").val(insuranceAge);
					
			})	
//	 	보허 가입 대상 운전 경력
		$("#insuranceExperience2").keyup(function(){
			var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

			var insuranceExperience = $("#insuranceExperience2").val();
			insuranceExperience = insuranceExperience.replace(regex, "")+'년';
			$("#insuranceExperience2").val(insuranceExperience);
					
			})
			

				
})
	
</script>
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
			

<!-- 			<div> -->
<!-- 				<label for="insurancePrice">보험금</label>  -->
<!-- 				<input name="insurancePrice" id="insurancePrice1"> -->
<!-- 			</div> -->
			
<!-- 			<div> -->
<!-- 				<label for="insuranceAge">보험 가입 대상 나이</label>  -->
<!-- 				<input name="insuranceAge" id="insuranceAge1"> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<label for="insuranceExperience">보험 가입 운전경력</label>  -->
<!-- 				<input name="insuranceExperience" id="insuranceExperience1"> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<label for="compensation">보상한도</label>  -->
<!-- 				<input name="compensation" id="compensation1"> -->
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<label for="customerCharge">고객 부담금</label>  -->
<!-- 				<textarea rows="5" name="customerCharge" id="customerCharge1"></textarea> -->
<!-- 			</div> -->
			
			<button  class="btn btn-default" id="InsurancePlusBtn" type="button">보험 내용 추가</button>
			<button  class="btn btn-default" id="InsurancePlusBtnClose" type="button">보험 내용 추가 닫기</button>
			
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
			
			
<!-- 				<div id="InsurancePlus"> -->
<!-- 					<div> -->
<!-- 					보험 카테고리 -->
<!-- 						<select name="category" id="category2"> -->
<!-- 							<option value="일반자차">일반자차</option> -->
<!-- 							<option value="고급자차" selected="selected">고급자차</option> -->
<!-- 						</select>			 -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<label for="insurancePrice">보험금</label>  -->
<!-- 						<input name="insurancePrice" id="insurancePrice2"> -->
<!-- 					</div> -->
					
<!-- 					<div> -->
<!-- 						<label for="insuranceAge">보험 가입 대상 나이</label>  -->
<!-- 						<input name="insuranceAge" id="insuranceAge2"> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<label for="insuranceExperience">보험 가입 운전경력</label>  -->
<!-- 						<input name="insuranceExperience" id="insuranceExperience2"> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<label for="compensation">보상한도</label>  -->
<!-- 						<input name="compensation" id="compensation2"> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<label for="customerCharge">고객 부담금</label>  -->
<!-- 						<textarea rows="5" name="customerCharge" id="customerCharge2"></textarea> -->
<!-- 					</div> -->
<!-- 				</div> -->
			
			<div>
				<button class="btn btn-default" type="button" id="submitBtn">등록</button>
				<button class="btn btn-default" type="reset">새로입력</button>
				<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
			</div>
		<!-- 


			 -->






	</div>
</body>
</html>