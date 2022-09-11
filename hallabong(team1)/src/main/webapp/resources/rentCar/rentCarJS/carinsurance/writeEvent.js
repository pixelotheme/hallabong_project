/**
 * 
 */
	
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
		alert("data-plus : " + $("#InsurancePlus").data("plus"));
				
		if($("#InsurancePlus").data("plus") == 1){
			alert("둘다검사")
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
			alert("data-plust : " + $("#InsurancePlus").data("plus"));
					alert("하나만검사")
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
// 						carNo : "${param.carNo }"
						carNo : carNo
					}
					,
					{
						category : $("#category2").val(),
					insurancePrice : $("#insurancePrice2").val().replace(regex, ""),
					insuranceAge :$("#insuranceAge2").val().replace(regex, ""),
					insuranceExperience :$("#insuranceExperience2").val().replace(regex, ""),
					compensation :$("#compensation2").val().replace(regex, ""),
					customerCharge :$("#customerCharge2").val(),
					carNo : carNo
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
			
	$("#resetBtn").on("click",function(){
		location.reload();
				
		})
	$("#cancelBtn").on("click",function(){
		
		location='/rentcarboard/rentCarBoardList.do';
				
		})
})