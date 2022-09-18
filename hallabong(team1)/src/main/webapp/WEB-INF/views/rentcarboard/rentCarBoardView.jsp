<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>렌트카 view</title>

<style type="text/css">
.list-group-item{
	margin-bottom: 1px;
}
</style>
<!-- datepicker -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 위치 중요 datepicker css -->
<link rel="stylesheet" type="text/css" href="/resources/rentCar/rentCarCSS/rentCarDatePicker.css">
<!--datepicker js -->
<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarDatePicker.js"></script>


<link rel="stylesheet" href="/resources/rentCar/rentCarCSS/rentcarboard/view.css">

<!-- <script type="text/javascript" src="/resources/rentCar/rentCarJS/rentcarboard/view.js"></script> -->

<script type="text/javascript">
$(function(){
	//날짜 선택시 자동 가격계산
	$("#dateChange").on("change",function(){

		 var prePrice =  "${carsVO.price}";
		 var rentalDate = $("#rentalDate").val();
		 var returnDate = $("#returnDate").val();
		if(!rentalDate){
// 			alert("대여일을 선택해주세요")
			return
			}
		if(!returnDate){
// 			alert("반납일을 선택해주세요")
			return			
			}
		if(!returnDate && !rentalDate){
			alert("예약날짜를 선택해주세요")
			return;
			}
		else{
			
		var Date = {rentalDate : $("#rentalDate").val() , returnDate : $("#returnDate").val(), prePrice: prePrice}
		
		$.ajax({
			     method: 'post',
			     url: '/rentcarboardajaxcontroller/totalPrice.do',
			     data: JSON.stringify(Date),
			     contentType: "application/json; charset=utf-8",
			     success: function (data,status, xhr) {
			        if (data) {
						if(data.totalPrice == prePrice){
							var ajaxPrice = data.totalPrice;

// 							alert("천단위"+ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
							var formatPrice = ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							str = '<label class="col-xs-4" for="returnDate">예약 금액</label>';
							str += "<div class='col-xs-8'>"+formatPrice+"원</div>"
							$("#bookingPrice").html(str);
							$("#totalPrice").attr("value", ajaxPrice)
														
							alert("대여,반납일을 다시선택해주세요")
							}
						else{
// 							alert("성공 "+data.totalPrice);
							var ajaxPrice = data.totalPrice;

// 							alert("천단위"+ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
							var formatPrice = ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							str = '<label class="col-xs-4" for="returnDate">예약 금액</label>';
							str += "<div class='col-xs-8'>"+formatPrice+"원</div>"
							$("#bookingPrice").html(str);
							$("#totalPrice").attr("value", ajaxPrice)
							}

// 			         $("#totalPrice").val(data);
			        }
			     },
			     error: function (xhr,status, error){
			    	  	alert("에러"+error);
			    	  }
			   });//end of ajax

		}
	
	})// end of dateChange

	
	$("#bookingBtn").on("click", function(){
		event.preventDefault();
// 		alert($("#totalPrice").val());
		var checkStatus = $("#bookingBtn").data("status");
// 		alert(checkStatus);
		 var rentalDate = $("#rentalDate").val();
		 var returnDate = $("#returnDate").val();
		 var rentalDateD = new Date($("#rentalDate").val());
		 var returnDateD = new Date($("#returnDate").val());

		if(checkStatus == "예약하기"){
				if(!rentalDate){
					alert("대여일을 선택해주세요")
					return
					}
				if(!returnDate){
					alert("반납일을 선택해주세요")
					return			
					}
				if(rentalDateD >= returnDateD ){
					alert("예약일을 다시 선택해주세요")
					return
					}
			$("#bookingForm").submit();
		}
		else{
			alert("회사로 문의")
			return false;
			}
	})


	$("#deleteBtn").on("click", function(){
		
		if(confirm("정말 삭제하시겠습니까?")){
			location='/rentcarboard/rentCarBoardDelete.do?carNo=${carsVO.carNo}';
				}
	})
	
})//end of $(function(){})
</script>
	

</head>
<body>
<div class="container">

		<h2>렌트카 게시판 보기</h2>
		
		<div>
		
				<ul class="list-group">
				<li class="list-group-item row">
					<div class="col-xs-3">차량 이미지</div>
					<div class="col-xs-9">
				<img alt="차량 이미지" src="/upload/rentcarboard/${carFileUploadVO.realSavePath}/s_${carFileUploadVO.fileName}" width="100px">
					</div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">회사명</div>
					<div class="col-xs-9">${companyVO.companyName }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">차량이름</div>
					<div class="col-xs-9">${carBasicInfoVO.carName }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">차 분류</div><div class="col-xs-9">${carBasicInfoVO.carTypes }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">정원</div><div class="col-xs-9">${carBasicInfoVO.carCapacity }명</div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">연료</div>
					<div class="col-xs-9">${carBasicInfoVO.carFuel }</div><p></p>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">가격</div><div class="col-xs-9"><fmt:formatNumber value='${carsVO.price }' pattern='#,###원'/></div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">기어</div><div class="col-xs-9">${carsVO.gearbox}</div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">대여가능 나이</div><div class="col-xs-9"><fmt:formatNumber value='${carsVO.rentAge }' pattern='#살'/></div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">대여 가능 운전 경력</div><div class="col-xs-9"><fmt:formatNumber value='${carsVO.rentExperience }' pattern='#년'/></div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">면허</div><div class="col-xs-9">${carsVO.license }</div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">연식</div><div class="col-xs-9">${carsVO.modelYears }</div>
				</li>
			</ul>	
		</div>	

		<div>
			<ul class="list-group ">
				<li class="list-group-item row">
				<div class="col-xs-3">자차 포함 여부</div><div class="col-xs-9"><strong>${carsVO.insuranceType }</strong></div>
				</li>
			</ul>
			
			<ul class="list-group ">
				<c:forEach items="${carInsuranceVO }" var="vo" varStatus="cnt">
					<c:if test="${cnt.count == 2}">
					<li class="list-group-item row">
					<div class="col-xs-12">-------------------------------------------------------</div>
					</li>
					</c:if>
					<li class="list-group-item row">
						<div class="col-xs-3">보험종류</div>
						<div class="col-xs-9">${vo.category}</div>
					</li>
					<li class="list-group-item row">
						<div class="col-xs-3">보험금</div>
						<div class="col-xs-9"><fmt:formatNumber value='${vo.insurancePrice }' pattern='#,###원'/></div>
					</li>
					<li class="list-group-item row">
						<div class="col-xs-3">보험 가입 가능 나이</div>
						<div class="col-xs-9"><fmt:formatNumber value='${vo.insuranceAge }' pattern='#살'/></div>
					</li>
					<li class="list-group-item row">
						<div class="col-xs-3">보험 가입 가능 운전경력</div>
						<div class="col-xs-9"><fmt:formatNumber value='${vo.insuranceExperience }' pattern='#년'/></div>
					</li>
					<li class="list-group-item row">
						<div class="col-xs-3">보상한도</div>
						<div class="col-xs-9"><fmt:formatNumber value='${vo.compensation }' pattern='#,###원'/></div>
					</li>
					<li class="list-group-item row">
						<div class="col-xs-3">고객부담금</div>
						<div class="col-xs-9">${vo.customerCharge }</div>
					</li>
					
				</c:forEach>
				<li class="list-group-item row">
					<div class="col-xs-12">-------------------------------------------------------</div>
				</li>
				<li class="list-group-item row">
					<div class="col-xs-3">보험 안내</div><div class="col-xs-9">${carsVO.insuranceInfo }</div>
				</li>
			</ul>
			
		</div>
		<!-- // end of insurance -->
				
		<div>
			
			<ul class="list-group ">
				<li class="list-group-item row">
					<div class="col-xs-3">참고사항</div><div class="col-xs-9">${carsVO.rentCarNote }</div>
				</li>

			</ul>
			
			<ul class="list-group ">
				<li class="list-group-item row">
					<div class="col-xs-3">취소/환불</div><div class="col-xs-9">${carsVO.cancelAndRefund }</div>
				</li>
			</ul>
		
		</div>
		
		<div>
			<ul class="list-group">
				<li class="list-group-item row">
					<p>
					회사명 : ${companyVO.companyName }				
					</p>
					<p>
					연락처 : ${companyVO.tel }				
					</p>
					<p>
					주소 : ${companyVO.address }				
					</p>
				</li>
			</ul>
		</div>
		
	
		<!-- 차량 옵션 -->
		<div>
			<ul class="list-group">
				<li class="list-group-item row" id="text-info-typeA">
					<p>
					${(carOptionVO.smoking == '금연차량')? '<span class="on">금연차량</span>':'<span class="off">금연차량</span>'}
					</p>
					<p>
					${(carOptionVO.navigation == '네비게이션')? '<span class="on">네비게이션</span>':'<span class="off">네비게이션</span>'}
					</p>
					<p>
					${(carOptionVO.blackbox == '블랙박스')? '<span class="on">블랙박스</span>':'<span class="off">블랙박스</span>'}
					</p>
					<p>
					${(carOptionVO.rearCamera == '후방카메라')? '<span class="on">후방카메라</span>':'<span class="off">후방카메라</span>'}
					</p>
					<p>
					${(carOptionVO.frontSensor == '전방센서')? '<span class="on">전방센서</span>':'<span class="off">전방센서</span>'}
					</p>
					<p>
					${(carOptionVO.rearSensor == '후방센서')? '<span class="on">후방센서</span>':'<span class="off">후방센서</span>'}
					</p>
					<p>
					${(carOptionVO.sunroof == '썬루프')? '<span class="on">썬루프</span>':'<span class="off">썬루프</span>'}
					</p>
					<p>
					${(carOptionVO.bluetooth == '블루투스')? '<span class="on">블루투스</span>':'<span class="off">블루투스</span>'}
					</p>
					<p>
					${(carOptionVO.heatingSheet == '열선시트')? '<span class="on">열선시트</span>':'<span class="off">열선시트</span>'}
					</p>
					<p>
					${(carOptionVO.heatingHandle == '열선핸들')? '<span class="on">열선핸들</span>':'<span class="off">열선핸들</span>'}
					</p>
					<p>
					${(carOptionVO.leatherSheet == '가죽시트')? '<span class="on">가죽시트</span>':'<span class="off">가죽시트</span>'}
					</p>
					<p>
					${(carOptionVO.ventilationSheet == '통풍시트')? '<span class="on">통풍시트</span>':'<span class="off">통풍시트</span>'}
					</p>
					<p>
					${(carOptionVO.carSeatPay == '카시트(유료)')? '<span class="on">카시트(유료)</span>':'<span class="off">카시트(유료)</span>'}
					</p>
					<p>
					${(carOptionVO.carSeatFree == '카시트(무료)')? '<span class="on">카시트(무료)</span>':'<span class="off">카시트(무료)</span>'}
					</p>
					<p>
					${(carOptionVO.driverAirbag == '운전석에어백')? '<span class="on">운전석에어백</span>':'<span class="off">운전석에어백</span>'}
					</p>
					<p>
					${(carOptionVO.passengerAirbag == '조수석에어백')? '<span class="on">조수석에어백</span>':'<span class="off">조수석에어백</span>'}
					</p>
					<p>
					${(carOptionVO.fourWheel == '4륜구동')? '<span class="on">4륜구동</span>':'<span class="off">4륜구동</span>'}
					</p>
					<p>
					${(carOptionVO.smartKey == '스마트키')? '<span class="on">스마트키</span>':'<span class="off">스마트키</span>'}
					</p>
					<p>
					${(carOptionVO.rearAutomaticDoor == '뒷자석자동문')? '<span class="on">뒷자석자동문</span>':'<span class="off">뒷자석자동문</span>'}
					</p>
					<p>
					${(carOptionVO.freeCharge == '전기충전무료')? '<span class="on">전기충전무료</span>':'<span class="off">전기충전무료</span>'}
					</p>
					<p>
					${(carOptionVO.usb == 'usb')? '<span class="on">usb</span>':'<span class="off">usb</span>'}
					</p>
					<p>
					${(carOptionVO.aux == 'aux')? '<span class="on">aux</span>':'<span class="off">aux</span>'}
					</p>
					<p>
					${(carOptionVO.dmb == 'dmb')? '<span class="on">dmb</span>':'<span class="off">dmb</span>'}
					</p>
					<p>
					${(carOptionVO.camping == '캠핑카')? '<span class="on">캠핑카</span>':'<span class="off">캠핑카</span>'}
					</p>
				</li>
			</ul>
		</div>
		

	

	<div class="row">
<!--  선택한 날짜 차이에 따라 가격이 변해야한다 -->	
		<form action="/rentcarbooking/booking.do" id="bookingForm">
			<input type="hidden" value="${carsVO.price }" name="prePrice">
			<input type="hidden" value="${carsVO.carNo }" name="carNo">
			<input type="hidden" value="${companyVO.companyNo }" name="companyNo">
			<input type="hidden" value="${carBasicInfoVO.carInfoNo }" name="carInfoNo">
			<input type="hidden" value="" name='totalPrice' id='totalPrice'>
			<input type="hidden" name="page" value="${param.page}">
			<input type="hidden" name="perPageNum" value="${param.perPageNum}">		
			<input type="hidden" name="key" value="${param.key}">
			<input type="hidden" name="word" value="${param.word}">		
			
			<div class="panel panel-default">
				<div class="panel-heading">
				예약
				</div>
				<div class="panel-body">
					<div id="dateChange">
						<div>
							<label for="rentalDate">대여일</label>
							<input class="datepicker" id="rentalDate" name='rentalDate'/>
						</div>
						<div>
							<label for="returnDate">반납일</label>
							<input class="datepicker" id="returnDate" name='returnDate'>
						</div>
					</div>
					
					<div class="row" id="bookingPrice">
						<label class="col-xs-4" for="returnDate">예약 금액</label>
						<div class="col-xs-8"><fmt:formatNumber value="${carsVO.price}" pattern="#,###" />원</div>
					</div>
						<div>
							<button class="btn btn-default" type="button" id="bookingBtn" data-status="${totalCompanyCars > 0? '예약하기':'예약불가'}">${totalCompanyCars > 0? "예약하기":"예약불가"}</button>
						</div>
				</div>
			</div>	
		</form>
		
	
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<button class="btn btn-default" type="button" onclick="location='/rentcarboard/rentCarBoardList.do?page=${!empty param.page? param.page:1 }&perPageNum=${!empty param.perPageNum? param.perPageNum:10 }&key=${param.key }&word=${param.word }'">리스트</button>
		</div>
		
		<!--회사 등록된 아이디와  관리자아이디가 같을 때만 보이게 한다 -->
		<c:if test="${companyVO.id eq login.id}">
			<div class="col-lg-12" style="padding-top: 15px">
				<button class="btn btn-default" type="button" onclick="location='/rentcarboard/rentCarBoardUpdate.do?carNo=${carsVO.carNo}&carInfoNo=${carBasicInfoVO.carInfoNo }&companyNo=${carsVO.companyNo }&page=${param.page }&perPageNum=${param.perPageNum }&key=${param.key }&word=${param.word }'">차량 정보 수정</button>
				
				<c:if test="${!empty carInsuranceVO }">
				<button class="btn btn-default" type="button" onclick="location='/carinsurance/carInsuranceUpdate.do?carNo=${carsVO.carNo}&carInfoNo=${carBasicInfoVO.carInfoNo }&companyNo=${carsVO.companyNo }&page=${param.page }&perPageNum=${param.perPageNum }&key=${param.key }&word=${param.word }'">보험 상세 수정</button>
				</c:if>
				<c:if test="${empty carInsuranceVO }">
				<button class="btn btn-default" type="button" onclick="location='/carinsurance/carInsuranceWrite.do?carNo=${carsVO.carNo}&companyNo=${carsVO.companyNo }'">보험 등록</button>
				
				</c:if>
	<%-- 				<button class="btn btn-default" type="button" onclick="location='/rentcarboard/rentCarBoardDelete.do?carNo=${carsVO.carNo}'">차량 삭제</button> --%>
				<button class="btn btn-default" type="button" id="deleteBtn">차량 삭제</button>
				<!-- if(id = carsVO.id)  일때만 보이도록-->
				<button class="btn btn-default" type="button" onclick="location='/companycars/companyCarsList.do?carNo=${carsVO.carNo}&companyNo=${carsVO.companyNo }&carInfoNo=${carBasicInfoVO.carInfoNo }'">차량 번호판 리스트</button>
			
			</div>
		</c:if>
	</div>
</div>


</body>
</html>