/**
 * 
 */
var companyNo = 0;
//ajax를 위한 전역변수

function getCompanyInfo(companyNo, callback){
 	$.getJSON(
	 		 "/rentcarboardajaxcontroller/companyView.do?companyNo="+companyNo,
	 		function(data){ 
				
	 			if(callback){ 
		 			callback(data);
	 			 
// 	 			 $("#companyName").val(data.companyView.companyName);
// 	 			 $("#tel").val(data.companyView.tel);
// 	 			 $("#updateCompanyNo").val(data.companyView.companyNo);
	 			 
// 	 			 $("#zipcode").val(data.companyView.zipcode);
// 	 			 $("#streetAdr").val(data.companyView.streetAdr);
// 	 			 $("#detailAdr").val(data.companyView.detailAdr);

// 	 			 $("#id").val(data.companyView.id);
// 	 			return ;
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
}