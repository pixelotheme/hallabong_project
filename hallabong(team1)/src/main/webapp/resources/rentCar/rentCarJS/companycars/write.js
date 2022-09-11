/**
 * 
 */
	//다음 api js 파일로 옮김
$(function(){
	
	
// 	$("#InsurancePlus").hide();
	
	$("#licensePlatePlusbtn").on("click",function(){
		var licensePlateDiv = $("#licensePlateDiv");
		var str = "";

		str += "<div>"
		str += "<label for='licensePlate'>번호판"
		str += "</label>"
		str += "<input name='licensePlate' id='licensePlate' class='form-control licensePlate'>"		
		str += "</div>"

			licensePlateDiv.append(str);
	})	
		

	$("#submitBtn").on("click",function(){
		event.preventDefault();
		
		var reg = /\s/g;
		
		var licensePlates = $("#licensePlateDiv input");
		
		var n = licensePlates.length;
// 		alert(n);
// 		alert(licensePlates);
		var i = 0;
		licensePlates.each(function(){
			//값 수정
			var licensePlateVal =licensePlates.eq(i).val();
			
			licensePlateVal = licensePlateVal.replace(reg, "");
// 			alert(licensePlateVal)
			licensePlates.eq(i).val(licensePlateVal)
			
			if(i < n){
				i = i + 1;
// 				alert(i);
				}
			
			})
		$("#actionForm").submit();
		})// end of submitBtn

	$("#cancelBtn").on("click",function(){
			$("#licensePlateDiv").remove();
	        $("#actionForm").attr("action", "/companycars/companyCarsList.do").attr("method","get").submit();
				
		})
	$("#resetBtn").on("click",function(){
		location.reload();
				
		})
		
})
	