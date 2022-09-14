/**
 * 
 */
$(function(){
		
//정규표현식
	
	$("#userName").change(function(){
		var regex = /\s/g;				

		var userName = $("#userName").val();
		userName = userName.replace(regex, "");
		$("#userName").val(userName);
				
		})	
	$("#userEmail").change(function(){
		 var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		 var regex = /\s/g;	

		 
		 var userEmail = $("#userEmail").val();
		 userEmail = userEmail.replace(regex, "");
		 
		 if(regEmail.test(userEmail) === false){
				alert("이메일을 확인해주세요 (영문+숫자)")
				$("#userEmail").val(userEmail);
			 }
		})
		
	$("#drivingLicense").change(function(){
		var regexLicense = /(\d{2}-\d{2}-\d{6}-\d{2})/;			

		
		var drivingLicense = $("#drivingLicense").val();

		if(regexLicense.test(drivingLicense) === false){
			alert("운전면허를 확인해주세요  - 형식 11-11-111111-11");

		}		
		})

	$("#submitBtn").on("click",function(){
		event.preventDefault();
		 var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		 var regex = /\s/g;		//공백 확인	
		 var regexLicense = /(\d{2}-\d{2}-\d{6}-\d{2})/;
		 var regName = /^[가-힣]{2,10}$/ 


		var userName = $("#userName").val();
		if(regName.test(userName) === false){
			alert("이름 입력 2~10 이내 공백 제외");
			return false;
			}	
			
		 var userEmail = $("#userEmail").val();
		 userEmail = userEmail.replace(regex, "");
		 
		 if(regEmail.test(userEmail) === false){
				alert("이메일을 확인해주세요 (영문+숫자)")
				$("#userEmail").val(userEmail);
				return false
			 }
		var drivingLicense = $("#drivingLicense").val();

		if(regexLicense.test(drivingLicense) === false){
				alert("운전면허를 확인해주세요  - 형식 11-11-111111-11");

			return false;
			
			};	

		var regTel1 = /(\d{2,3}[ ,-]-?\d{2,4}[ ,-]-?\d{4})/; //00-
// 		var regTel1 = /^(\d{0,2})(\d{0,3})(\d{0,4})$/g; //00-
// 		var regTel2 = /^(\d{0,3})(\d{0,4})(\d{0,4})$/g;	// 000-
		
		var userTel = $("#userTel").val();
		alert(regTel1.test(userTel));
// 		alert(regTel2.test(userTel));
		if(regTel1.test(userTel) === false){
			alert("연락처를 입력")
			return false;			

			}

		$("#actionForm").submit();
		
		})//end of submitBtn

})