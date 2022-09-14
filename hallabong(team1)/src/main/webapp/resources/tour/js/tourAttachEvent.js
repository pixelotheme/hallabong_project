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

	// 첨부 파일(둘러싸고 있는 li tag)을 클릭하면 처리되는 이벤트 ------------------------------
	$(".uploadResult").on("click", "li", function(){
		// alert("첨부파일 클릭");
		var liObj = $(this);
		// 작업할 파일명을 세팅한다.(서버에 올라간 파일명)
		var prePath = liObj.data("path") + "/"
			+ liObj.data("uuid") + "_" + liObj.data("filename");
		// alert(prePath);
		// alert(prePath.replace(new RegExp(/\\/g), "/"));
		var path = encodeURIComponent(prePath);

		if(liObj.data("type")){
			// 이미지인 경우
			showImage(path.replace(new RegExp(/\\/g), "/"));
		} else {
			// 이미지가 아닌 경우
			// alert("이미지가 아닙니다.");
			location = "/download?fileName=" + path;
		}
	});
	// 첨부 파일(둘러싸고 있는 li tag)을 클릭하면 처리되는 이벤트의 끝
	
});