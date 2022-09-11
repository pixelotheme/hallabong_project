<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트카 등록</title>
<style type="text/css">
.row{
	display: grid;
}
</style>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="/resources/rentCar/regEx.js"></script>
<script type="text/javascript" src="/resources/rentCar/form.js"></script>
<script>
var loginId = "${login.id}";
</script>

<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentcarboard/writeFunc.js"></script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentcarboard/writeEvent.js"></script>

</head>
<body>
	<div class="container">
		<h2>렌트카 등록</h2>
		<form method="post" id="actionForm">
		<input type="hidden" value="${param.perPageNum }" name="perPageNum">
	
			<!-- /.row -->
			<div class="row">
				<!-- /.col-lg-12 차량 정보 표시 -->
				<div class="col-lg-12">
					<div class="panel panel-default row">
						<!-- 테이블의 소제목 -->
						<div class="panel-heading">등록할 회사, 차량</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
								<div class="col-lg-6">
								회사
									<select class="form-control" name="companyNo" id="selectCompany">
											<option data-id="N" value="N">회사 선택</option>
										<c:forEach items="${companys }" var="company">
											<option value="${company.companyNo }" data-id="${company.id }">${company.companyName }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-lg-6">	
								차량
									<select name="carInfoNo" class="form-control">
										<c:forEach items="${allCarBasicInfo }" var="carBasicInfo">
											<option value="${carBasicInfo.carInfoNo }">
											${carBasicInfo.carName }, 
											${carBasicInfo.carTypes }, 
											${carBasicInfo.carFuel},
											${carBasicInfo.carCapacity }
											</option>
										</c:forEach>
									</select>
								</div>						
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 차량 정보 표시 -->
			</div>
			<!--/. row -->
			
			<!-- /.row 렌터카 정보 입력 -->
			<div class="row">
				<!-- /.col-lg-12 차량 정보 표시 -->
				<div class="col-lg-12">
					<div class="panel panel-default row">
						<!-- 테이블의 소제목 -->
						<div class="panel-heading">렌터카 정보 입력</div>
						<!-- /.panel-heading -->
						<div class="panel-body form-group">
							<div class ="col-lg-6">
								<label for="price">가격</label> <input id="price" class="form-control"  />
							</div>
							<div class ="col-lg-6">
							<label for="gearbox">변속기</label>
								<select name="gearbox" id="gearbox" class="form-control" >
									<option value="수동">수동</option>
									<option value="자동">자동</option>
								</select>
							</div>
							<div class ="col-lg-6">
								<!-- yyyy-MM -->
								<label for="modelYears">연식</label> 
<!-- 								<input name="modelYears" id="modelYears" placeholder="yyyy-MM 형식" class="form-control"/> -->
									<input onKeyup="inputYMDNumber(this);" name="modelYears" id="modelYears" value="" placeholder="yyyy-MM" style="text-align:center;" class="form-control"/>
							</div>
							<div class ="col-lg-6">
							<label for="insuranceType">보험</label>
								<select name="insuranceType"class="form-control" id="insuranceType">
									<option value="자차미포함">자차미포함</option>
									<option value="일반자차포함">일반자차포함</option>
									<option value="고급자차포함">고급자차포함</option>
								</select>
							</div>
							<div class ="col-lg-6">
								<!-- 숫자만 -->
								<label for="rentAge">대여가능 나이</label> <input 
									id="rentAge" class="form-control"/>
							</div>
				
							<div class ="col-lg-6">
								<!-- 숫자만 -->
								<label for="rentExperience">대여가능 운전 경력</label> <input
									  id="rentExperience" class="form-control"/>
							</div>
							<div class ="col-lg-12">
								<label for="license">면허종류</label> <input
									name="license" id="license" class="form-control"/>
							</div>
							<div class ="col-lg-12">
								<label for="insuranceInfo">보험내용</label>
								<textarea rows="10" name="insuranceInfo" id="insuranceInfo" class="form-control"></textarea>
							</div>
							<div class ="col-lg-12">
								<label for="rentCarNote">참고사항</label>
								<textarea rows="10" name="rentCarNote" id="rentCarNote" class="form-control"></textarea>
							</div>
							<div class ="col-lg-12">
								<label for="cancelAndRefund">취소/환불규정</label>
								<textarea rows="10" name="cancelAndRefund" id="cancelAndRefund" class="form-control"></textarea>
							</div>						
						
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 차량 정보 표시 -->
			</div>
			<!--/. row -->
			
			<!-- /.row 렌터카 옵션 입력 -->
			<div class="row">
				<!-- /.col-lg-12 차량 정보 표시 -->
				<div class="col-lg-12">
					<div class="panel panel-default row">
						<!-- 테이블의 소제목 -->
						<div class="panel-heading">렌터카 옵션 선택</div>
						<!-- /.panel-heading -->
						<div class="panel-body form-group">
								<div>
									<label class="checkbox-inline">
										<input type="checkbox" name="smoking" value="금연차량">금연차량
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name="navigation"value=네비게이션>네비게이션
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name="blackbox"value="블랙박스">블랙박스
									</label>
									<label class="checkbox-inline">
										<input type="checkbox" name="rearCamera"value="후방카메라">후방카메라
									</label>
								</div>
								<div>
									<label class="checkbox-inline">				
										<input type="checkbox" name="frontSensor"value="전방센서">전방센서
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="rearSensor"value="후방센서">후방센서
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="sunroof"value="썬루프">썬루프
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="bluetooth"value="블루투스">블루투스
									</label>
								</div>
								<div>
									<label class="checkbox-inline">					
										<input type="checkbox" name="heatingSheet"value="열선시트">열선시트
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="heatingHandle"value="열선핸들">열선핸들
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="leatherSheet"value="가죽시트">가죽시트
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="ventilationSheet"value="통풍시트">통풍시트
									</label>
								</div>
								<div>
									<label class="checkbox-inline">					
										<input type="checkbox" name="carSeatPay"value="카시트(유료)">카시트(유료)
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="carSeatFree"value="카시트(무료)">카시트(무료)
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="driverAirbag"value="운전석에어백">운전석에어백
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="passengerAirbag"value="조수석에어백">조수석에어백
									</label>
								</div>
								<div>
									<label class="checkbox-inline">				
										<input type="checkbox" name="fourWheel"value="4륜구동">4륜구동
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="smartKey"value="스마트키">스마트키
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="rearAutomaticDoor"value="뒷자석자동문">뒷자석자동문
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="freeCharge"value="전기충전무료">전기충전무료
									</label>
								</div>
								<div>
									<label class="checkbox-inline">
										<input type="checkbox" name="usb"value="usb">USB
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="aux"value="aux">AUX
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="dmb"value="dmb">DMB
									</label>
									<label class="checkbox-inline">						
										<input type="checkbox" name="camping"value="캠핑카">캠핑카
									</label>
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
				<button type="button" id="submitBtn" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">새로입력</button>
				<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
			</div>
		</form>

	</div>
</body>
</html>