/**
 * 첨부파일에 대한 이벤트를 선언
 */
//하단부분의 HTML 객체를 선택해야 하므로 HTML 문서 로딩 후 실행되도록 형태를 정의한다.
$(function(){
	
	//리스트 데이터 클릭 이벤트   
	$(".dataRow").on("click", function(){
		//alert("글보기로 이동");
		var hbno = $(this).find(".no").text(); 
		location = "../hotelbooking/view.do?hbno="+hbno+"&page="+page+"&perPageNum="+perPageNum+"&key="+key+"&word="+word;
	});

	$("#cancelBtn").on("click",function(){
		history.back();
	});
	
	$("#updateBtn").on("click", function(){
		alert("글수정 이동");
		location = "update.do?hbno="+hbno+"&page="+page+"&perPageNum="+perPageNum+"&key="+key+"&word="+word;
		
	
	});
		$("#deleteBtn").on("click", function(){
		
		location = "delete.do?no="+hbno+"&perPageNum="+perPageNum;
		
	
	});
	
	
	
	// name이 checkbox인 체크박스 체크 여부 확인 예제
	$("#writeBtn").on("click", function(){
		if($(':radio[name="checkbox"]:checked').length < 1){
		alert('개인정보처리방침 체크해주세요.\n안그러면 못넘어 갑니다!!!!!!!');                        
		// 첫번 째 체크박스에 포커스
		$(':input:checkbox[name=checkbox]:eq(0)').focus();
		return false;
		}
	
		
	});
	
	$("#pay1").on("change",function(){
					
					var c = ['국민카드','현대카드','롯데카드'];
			 		var b = ['국민은행','우리은행','농협은행'];
			 		var v = $( '#pay1' ).val();
			 		var o;
					
					if( v == 'c'){
						o = c;
					} else if(v == 'b'){
						o = b;
					}else {
						o = [];
					}
					
					$('#pay2').empty();
					$('#pay2').append('<option></option>');
					for ( var i = 0; i < o.length; i++){
						$('#pay2').append('<option>' + o[i] +'</option>');
					}
						
				});
		
	


	
});