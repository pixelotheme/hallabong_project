/**
 * 첨부파일에 대한 이벤트를 선언
 */

$(function(){
	
	console.log("----------------------------");
	console.log("attachEvent.js 실행");
	
	
	// 전역 변수에 값을 세팅한다.
	// 파일명 리스트를 보여줄 ul 태그 선택
	uploadResult = $(".uploadResult ul");
	no = $("#no").data("no");
	
	
	// 처음에 문서가 로딩되면 바로 처리되는 함수 --------------------------------------------
	(function(){
		// 첨부파일 데이터를 불러오는 Ajax 처리 함수 적용

		$.getJSON("/tour/getAttachList", {no : no}, function(arr){
			console.log(arr);

			// ul태그 안에 넣을 li태그를 작성해서 ul태그 안에 넣는다.
			showUploadFile(arr);
		});
	})(); // 처음에 문서가 로딩되면 바로 처리되는 함수의 끝

});