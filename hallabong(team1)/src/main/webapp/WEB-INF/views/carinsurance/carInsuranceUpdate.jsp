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
<title>렌트카 수정</title>
<style type="text/css">
.row{
	display: grid;
}
</style>

<script type="text/javascript"
	src="/resources/rentCar/rentCarJS/companyWrite.js"></script>
	
<script type="text/javascript" src="/resources/rentCar/regEx.js"></script>
<script type="text/javascript" src="/resources/rentCar/form.js"></script>


<script>
var carNo = "${param.carNo }"


$(function(){

	$("#InsurancePlus").show();
	
				
		//2번째 가 없을때 에러나는상황
	$("#submitBtn").on("click",function(){
		var checkValue = false;
		if($("#InsurancePlus").data("plus") === 1){

			if(!checkData(1)){
// 				alert("입력다시")
				return false;
				}
			if(!checkData(2)){
// 				alert("입력다시")
				return false;
				}
			checkValue = true;
			}
		else{
			if(!checkData(1)){
// 				alert("입력다시")
				return false;
				}
			checkValue = true;
			}
		
		if(checkValue == true){
			var insuranceNoCheck = "";
					//보험 번호가 비어있지않으면 비어있지않으면
	// 				if(${!empty carInsuranceVO[1].insuranceNo} != null){
					if(${!empty carInsuranceVO[1].insuranceNo}){
// 						alert("인덱스 1 이 있다")
						//2번째 값이 있다면 -> 보험번호에 인덱스 0 을 넣어준다 - 컨트롤러에서 강제로 넣어준다(무조건 배열 2개에 보험번호가 null 값은 아니게 된다)
						insuranceNoCheck = ${carInsuranceVO[0].insuranceNo};
						}
					else{
						//2번째 번호가 없으면 빈칸?
// 						alert("인덱스 1 이 없다")
						insuranceNoCheck = "";
						}
			
					var carNo = "${param.carNo }";
					var carInfoNo = "${param.carInfoNo}";
					var regex = /[^0-9]/g;
				let carInsuranceVOList = [
					{
						category : $("#category1").val(),
						insuranceNo : insuranceNoCheck,
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
						insuranceNo : ${carInsuranceVO[1].insuranceNo},
					insurancePrice : $("#insurancePrice2").val().replace(regex, ""),
					insuranceAge :$("#insuranceAge2").val().replace(regex, ""),
					insuranceExperience :$("#insuranceExperience2").val().replace(regex, ""),
					compensation :$("#compensation2").val().replace(regex, ""),
					customerCharge :$("#customerCharge2").val(),
					carNo : "${param.carNo }"
					} 
		
					];
	
// 			alert(JSON.stringify(carInsuranceVOList))
	//{ carInsuranceVOList : JSON.stringify(carInsuranceVOList) } 이렇게 넘겼다가 하루종일 못넘김 ;;
			   $.ajax({
				     method: 'post',
				     url: '/rentcarboardajaxcontroller/updateCarInsurance.do',
				     traditional: true,
				     data: JSON.stringify(carInsuranceVOList),
				     contentType: "application/json; charset=utf-8",
				     success: function (data,status, xhr) {
				        if (data) {
				        	checkValue = false;
// 				          alert("성공 "+data);
				          location='/rentcarboard/rentCarBoardView.do?carNo='+carNo+'&carInfoNo='+carInfoNo
				          +'&companyNo=${param.companyNo}&page=${param.page }&perPageNum=${param.perPageNum }&key=${param.key }&word=${param.word }';
				        }
				     },
				     error: function (xhr,status, error){
				    	 checkValue = false;
				    	  	alert("에러"+error);
				    	  }
				   });//end of ajax
			}//end of ajax if
		})


	function deleteAjaxFunc(topInsuranceNo,bottomInsuranceNo){

			
			carNo = "${param.carNo }";
			carInfoNo = "${param.carInfoNo}";	
// 			alert("111111")
					let carInsuranceVOList = [
				{
					insuranceNo : topInsuranceNo,
				}
				,
				{
					insuranceNo : bottomInsuranceNo,
				} 
	
				];

// 		alert(JSON.stringify(carInsuranceVOList))
//{ carInsuranceVOList : JSON.stringify(carInsuranceVOList) } 이렇게 넘겼다가 하루종일 못넘김 ;;
		   $.ajax({
			     method: 'post',
			     url: '/rentcarboardajaxcontroller/deleteCarInsurance.do',
			     traditional: true,
			     data: JSON.stringify(carInsuranceVOList),
			     contentType: "application/json; charset=utf-8",
			     success: function (data,status, xhr) {
			        if (data) {
// 			          alert("성공 "+data);
			          location='/rentcarboard/rentCarBoardView.do?carNo='+carNo+
			          '&carInfoNo='+carInfoNo+'&companyNo=${param.companyNo}';
			        }
			     },
			     error: function (xhr,status, error){
			    	  	alert("에러"+error);
			    	  }
			   });//end of ajax

			}
	
	var topInsuranceNo = 0;
	var bottomInsuranceNo = 0;
	//위쪽 삭제버튼 눌렀을때 보험번호 가져와야한다
	$("#deleteTop").on("click",function(){
		var topInsuranceNo = ${carInsuranceVO[0].insuranceNo};

// 		alert(topInsuranceNo);
		if(confirm("정말 삭제하시겠습니까?")){
			deleteAjaxFunc(topInsuranceNo,0);
			}
		})
	$("#deleteBottom").on("click",function(){
		var bottomInsuranceNo = ${carInsuranceVO[1].insuranceNo};

// 		alert(bottomInsuranceNo);
		if(confirm("정말 삭제하시겠습니까?")){
			deleteAjaxFunc(0,bottomInsuranceNo);
			}
		});

	$("#cancelBtn").on("click", function(){
		 location='/rentcarboard/rentCarBoardView.do?carNo=${param.carNo }&carInfoNo=${param.carInfoNo}&companyNo=${param.companyNo}';
		})
		
})
	
</script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/carinsurance/updateFunc.js"></script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/carinsurance/updateEvent.js"></script>


</head>
<body>
	<div class="container">
		<h2>렌트카 보험  수정</h2>
			
			<!-- 방금 등록한 차번호 -->
			<c:forEach items="carInsuranceVO">
			
			</c:forEach>
			
			<!-- /.row -->
			<div class="row">
				<!-- /.col-lg-12 차량 정보 표시 -->
				<div class="col-lg-12">
					<div class="panel panel-default row">
						<!-- 테이블의 소제목 -->
						<div class="panel-heading">등록할 회사, 차량
						 <button type="button" id="deleteTop">${(carInsuranceVO[0].category == '일반자차')? '일반자차':'고급자차'} 삭제</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body form-group">	
						<!-- 내용  -->		
						 	<div class="col-lg-6">
								<label for="category">보험 카테고리</label> 
								<select name="category" id="category1" class="form-control">
									<option value="일반자차" ${(carInsuranceVO[0].category == '일반자차')? 'selected':''}>일반자차</option>
									<option value="고급자차" ${(carInsuranceVO[0].category == '고급자차')? 'selected':''}>고급자차</option>
								</select>			
							</div>
							<div class="col-lg-6">
								<label for="insurancePrice">보험금</label> 
								<input class="form-control" name="insurancePrice" id="insurancePrice1" value="<fmt:formatNumber value='${carInsuranceVO[0].insurancePrice }' pattern='#,###'/>">
							</div>
							
							<div class="col-lg-6">
								<label for="insuranceAge">보험 가입 대상 나이</label> 
								<input class="form-control" name="insuranceAge" id="insuranceAge1"  value="<fmt:formatNumber value='${carInsuranceVO[0].insuranceAge }' pattern='#살'/>">
							</div>
							<div class="col-lg-6">
								<label for="insuranceExperience">보험 가입 운전경력</label> 
								<input class="form-control" name="insuranceExperience" id="insuranceExperience1" value="<fmt:formatNumber value='${carInsuranceVO[0].insuranceExperience }' pattern='#년'/>">
							</div>
							<div class="col-lg-6">
								<label for="compensation">보상한도</label> 
								<input class="form-control" name="compensation" id="compensation1"value="<fmt:formatNumber value='${carInsuranceVO[0].compensation }' pattern='#,###'/>">
							</div>
							<div class="col-lg-6">
								<label for="customerCharge">고객 부담금</label> 
								<textarea class="form-control" rows="5" name="customerCharge" id="customerCharge1">${carInsuranceVO[0].customerCharge }</textarea>
							</div>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 차량 정보 표시 -->
			</div>
			<!--/. row -->
			
<!-- 			<button id="InsurancePlusbtn" type="button">보험 내용 추가 on,off</button> -->
			
			
			
<!-- 			<div id="InsurancePlus"> -->
			<button  class="btn btn-default" id="InsurancePlusBtn" type="button">보험 내용 추가</button>
			<button  class="btn btn-default" id="InsurancePlusBtnClose" type="button">보험 내용 추가 닫기</button>
			
						<!-- /.row -->
			<div class="row" id="InsurancePlus" data-plus="1">	
				<!-- /.row -->
				<div class="row">
					<!-- /.col-lg-12 차량 정보 표시 -->
					<div class="col-lg-12">
						<div class="panel panel-default row">
							<!-- 테이블의 소제목 -->
							<div class="panel-heading">등록할 회사, 차량
							 <button type="button" id="deleteBottom">${(carInsuranceVO[1].category == '일반자차')? '일반자차':'고급자차'}삭제</button>
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body form-group">			
					
								<div class="col-lg-6">
								<label for="category">보험 카테고리</label> 
									<select class="form-control" name="category" id="category2">
										<option value="고급자차" ${(carInsuranceVO[1].category == '고급자차')? 'selected':''}>고급자차</option>
										<option value="일반자차" ${(carInsuranceVO[1].category == '일반자차')? 'selected':''}>일반자차</option>
									</select>			
								</div >
								<div class="col-lg-6">
									<label for="insurancePrice">보험금</label> 
									<input  class="form-control"name="insurancePrice" id="insurancePrice2" value="${carInsuranceVO[1].insurancePrice }">
								</div>
								
								<div class="col-lg-6">
									<label for="insuranceAge">보험 가입 대상 나이</label> 
									<input class="form-control" name="insuranceAge" id="insuranceAge2"value="${carInsuranceVO[1].insuranceAge }">
								</div>
								<div class="col-lg-6">
									<label for="insuranceExperience">보험 가입 운전경력</label> 
									<input class="form-control" name="insuranceExperience" id="insuranceExperience2" value="${carInsuranceVO[1].insuranceExperience }">
								</div>
								<div class="col-lg-6">
									<label for="compensation">보상한도</label> 
									<input class="form-control" name="compensation" id="compensation2" value="${carInsuranceVO[1].compensation }">
								</div>
								<div class="col-lg-6">
									<label for="customerCharge">고객 부담금</label> 
									<textarea class="form-control" rows="5" name="customerCharge" id="customerCharge2">${carInsuranceVO[1].customerCharge }</textarea>
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
				<button class="btn btn-default" type="button" id="submitBtn">등록</button>
				<button class="btn btn-default" type="reset">새로입력</button>
				<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
			</div>
		<!-- 


			 -->






	</div>
</body>
</html>