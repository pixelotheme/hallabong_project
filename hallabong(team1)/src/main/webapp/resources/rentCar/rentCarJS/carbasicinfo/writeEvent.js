/**
 * 
 */
$(function(){
	$("#cancelBtn").on("click",function(){
		location="/carbasicinfo/carBasicInfoList.do?perPageNum=${param.perPageNum}"
		});

		//대여가능(만)나이
	$("#carCapacity").keyup(function(){
			var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

			var carCapacity = $("#carCapacity").val();
			carCapacity = carCapacity.replace(regex, "")+'명';
			$("#carCapacity").val(carCapacity);
					
			});

		$("#submitBtn").on("click", function(){
			if(9 != loginGradeNo){
				alert("관리자 아이디로 로그인해주세요");
				
				return null;
				}
			else{
				event.preventDefault();
					if(!checkData()){
						return false;
						}
					else{
						var regex = /[^0-9]/g;
						//input 태그 hidden으로 집어넣어줄 예정 - 가격, 대여가능나이, 대여가능 운정 경력
						var carCapacity = $("#carCapacity").val();
						carCapacity = carCapacity.replace(regex, "");
		
						var str = '<input type="hidden" name="carCapacity"  value="'+carCapacity+'" />';
		
						
						
						$("#actionForm").append(str)
						$("#actionForm").submit();
						}
				}
			
			});
});
