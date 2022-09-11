/**
 * 
 */
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
			
// 		var Date = {rentalDate : $("#rentalDate").val() , returnDate : $("#returnDate").val(), prePrice: $("#plusPrice").data("price")}
		var Date = {rentalDate : $("#rentalDate").val() , returnDate : $("#returnDate").val(), prePrice: prePrice}
		
// 		alert(JSON.stringify(Date))

		$.ajax({
			     method: 'post',
			     url: '/rentcarboardajaxcontroller/totalPrice.do',
			     data: JSON.stringify(Date),
			     contentType: "application/json; charset=utf-8",
// 			     success: function (data,status, xhr) {
			     success: function (data,status, xhr) {
			        if (data) {
						if(data.totalPrice == prePrice){
							var ajaxPrice = data.totalPrice;

// 							alert("천단위"+ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
							var formatPrice = ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							str = '<label class="col-md-4" for="returnDate">예약 금액</label>';
							str += "<div class='col-md-8'>"+formatPrice+"원</div>"
							$("#bookingPrice").html(str);
							$("#totalPrice").attr("value", ajaxPrice)
														
// 							alert("대여,반납일을 다시선택해주세요")
							}
						else{
// 							alert("성공 "+data.totalPrice);
							var ajaxPrice = data.totalPrice;

// 							alert("천단위"+ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
							var formatPrice = ajaxPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							str = '<label class="col-md-4" for="returnDate">예약 금액</label>';
							str += "<div class='col-md-8'>"+formatPrice+"원</div>"
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

	
})//end of $(function(){})