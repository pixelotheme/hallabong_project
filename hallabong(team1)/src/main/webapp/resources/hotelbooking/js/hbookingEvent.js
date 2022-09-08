/**
 * 첨부파일에 대한 이벤트를 선언
 */
//하단부분의 HTML 객체를 선택해야 하므로 HTML 문서 로딩 후 실행되도록 형태를 정의한다.
$(function(){
	
	//리스트 데이터 클릭 이벤트   
	$(".dataRow").on("click", function(){
		alert("글보기로 이동");
		var hbno = $(this).find(".no").text(); 
		location = "view.do?hbno="+hbno+"&page="+page+"&perPageNum="+perPageNum+"&key="+key+"&word="+word;
	});

	
});