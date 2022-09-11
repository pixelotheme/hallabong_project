/**
 * 
 */
	
$(function(){
	
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
// 	보허 가입 대상 운전 경력
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
// 	보허 가입 대상 운전 경력
	$("#insuranceExperience2").keyup(function(){
		var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

		var insuranceExperience = $("#insuranceExperience2").val();
		insuranceExperience = insuranceExperience.replace(regex, "")+'년';
		$("#insuranceExperience2").val(insuranceExperience);
				
		})
})