/**
 * 
 */
	//다음 api js 파일로 옮김
$(function(){

	$("#selectCompany").on("change",function(){

		var checkId = $(this).find(':selected').data("id")
 		alert(checkId + loginId);
		//아이디 비교할 예정 다르면 선택불가
		if(checkId != loginId){
			alert("등록한 회사를 선택해주세요")
			$(this).val("N");
		}else{
//				alert("등록한 회사를22 선택해주세요")
//			$(this).val("N");
		}
		
		});

	$("#submitBtn").on("click", function(){
		event.preventDefault();
		var companyCheck = $("#selectCompany").find(':selected').data("id")
		
//		alert(companyCheck)
//		alert("로그인 아이디"+ "${login.id}" + loginId)
		// 선택된 아이디 == 로그인한 아이디
		if(companyCheck != loginId){
			alert("등록한 회사를 선택해주세요")
			
			return null;
			}
		else{

			if(!checkData()){
				alert("입력다시")
				return false;
				}
			else{
				var regex = /[^0-9]/g;
				//input 태그 hidden으로 집어넣어줄 예정 - 가격, 대여가능나이, 대여가능 운정 경력
				var price = $("#price").val();
				var rentAge = $("#rentAge").val();
				var rentExperience = $("#rentExperience").val();
				price = price.replace(regex, "");
				rentAge = rentAge.replace(regex, "");
				rentExperience = rentExperience.replace(regex, "");
	
				var str = '<input type="hidden" name="price"  value="'+price+'" />';
				str += '<input type="hidden" name="rentAge" id="rentAge" value="'+rentAge+'"/>';
				str += '<input type="hidden" name="rentExperience" id="rentExperience"  value="'+rentExperience+'"/>';	
	
				$("#actionForm").append(str)
				$("#actionForm").submit();
				}	
					
			}
		
		});
	//가격 변환
	$("#price").change(function(){
		var price = $("#price").val();
		var regex = /[^0-9]/g;	
		price = price.replace(regex, "")
		
		price = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

		$("#price").val(price);
		})
	//대여가능(만)나이
	$("#rentAge").change(function(){
		var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

		var rentAge = $("#rentAge").val();
		rentAge = rentAge.replace(regex, "")+'살';
		$("#rentAge").val(rentAge);
				
		})	
// 	대여가능 운전 경력
	$("#rentExperience").change(function(){
		var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

		var rentExperience = $("#rentExperience").val();
		rentExperience = rentExperience.replace(regex, "")+'년';
		$("#rentExperience").val(rentExperience);
				
		})
				
})