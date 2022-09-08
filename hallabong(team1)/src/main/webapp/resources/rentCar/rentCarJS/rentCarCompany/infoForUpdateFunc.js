/**
 * 
 */
$(function(){
		//렌트카 회사를 선택할때 변경되게
	$("#companySelect").on("change",function(){
		//넘어가는 데이터 회사 번호

		companyNo = $(this).val();
// 		alert(companyNo);
		getCompanyInfo(
				companyNo,
				function(data){
				 $("#companyName").val(data.companyView.companyName);
				 $("#tel").val(data.companyView.tel);
				 $("#updateCompanyNo").val(data.companyView.companyNo);
				 
				 $("#zipcode").val(data.companyView.zipcode);
				 $("#streetAdr").val(data.companyView.streetAdr);
				 $("#detailAdr").val(data.companyView.detailAdr);
	
				 $("#id").val(data.companyView.id);				
				}

				)
		 	
	
	})
})