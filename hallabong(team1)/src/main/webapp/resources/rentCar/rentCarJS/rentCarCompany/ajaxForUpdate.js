/**
 * 
 */
$(function(){
		
	//렌트카 회사를 선택할때 변경되게
	$("#companySelect").on("change",function(){
		//넘어가는 데이터 회사 번호

		companyNo = $(this).val();
// 		alert(companyNo);
	 	$.getJSON(
		 		 "/rentcarboardajaxcontroller/companyView.do?companyNo="+companyNo,
		 		function(data){ 
					
		 			if(data){ 
			 			
		 			 
		 			 $("#companyName").val(data.companyView.companyName);
		 			 $("#tel").val(data.companyView.tel);
		 			 $("#updateCompanyNo").val(data.companyView.companyNo);
		 			 
		 			 $("#zipcode").val(data.companyView.zipcode);
		 			 $("#streetAdr").val(data.companyView.streetAdr);
		 			 $("#detailAdr").val(data.companyView.detailAdr);

		 			 $("#id").val(data.companyView.id);
		 			return ;
		 			} 
		 			else{
		 			
		 			if(cvo != null && cvo.length > 0){ alert("데이터가 있습니다.");}
		 			else{alert("데이터가 없습니다.");}
		 			
		 			}
		 		}
		 	).fail(function(xhr, status, error){
		 		if(error)
		 			error();
		 			
		 	});//getJSON() 의 끝
		 	
	
	})
})