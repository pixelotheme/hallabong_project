/**
 * 첨부파일에서 사용할 변수와 함수를 선언해 놓는다.
 */

console.log("----------------------------");
console.log("attachFunction.js loading ... ");

// 전역 변수로 사용할 변수 선언
var uploadResult = ""; // 파일명 리스트를 보여줄 ul 태그 선택하는 객체 변수 선언
var bno = ""; // 첨부파일을 가져올 글번호

// 파일명을 보여줄 함수 -------------------------------------------------------------
function showUploadFile(list){
	// ul tag 비우기
	// uploadResult.empty();
	
	var str = "";
	// list를 데이터가 있는 만큼 반복 처리 한다. foreach : each() 사용
	// each(function(index, dto))
	$(list).each(function(i, obj){
		var fileCallPath = "";
		str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
		 +"' data-filename='" + obj.fileName + "' data-type='"+obj.fileType+"'>";
		str += "<div>";
		if(!obj.fileType){
			// 이미지가 아닌 경우의 내용
			// 다운로드 받을 파일 정보를 만든다.(조립)
			fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			str += "<span>" + obj.fileName + "</span><br/>"
				+ "<span class='glyphicon glyphicon-floppy-open' style='font-size:25px;'></span>";
		} else {
			// 이미지인 경우의 내용
			// 불러올 파일 정보를 만든다.(조립)
			fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			// s_가 없는 원래 이미지 파일
			var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
			
			// \\ -> \ 로 변환되어 처리된다. \\ ==> / 로 변환시키자.
			originPath = originPath.replace(new RegExp(/\\/g), "/");
			
			// javascript:showImage() -> javascript tag 바로 아래 showImage()를 찾는다.
			str += "<a href=\"javascript:showImage(\'" + originPath + "\')\">";
			str += "<img src='/display?fileName=" + fileCallPath + "'>";
			str += "</a>"	
		} // if else의 끝
		str += "</div>";
		str += "</li>";
	}); // foreach의 끝

	// ul tag에 추가
	uploadResult.append(str);
} // 파일명을 보여줄 함수
// 첨부 파일을 보여주는 함수 선언의 끝


//큰이미지(원래 이미지 파일)를 보여주는 함수 -> javascript:showImage() 로 작성하면 동작되도록 script tag 아래 둔다.
function showImage(fileCallPath) {
	// 동작, 데이터 확인
	// alert(fileCallPath);
	$(".bigPictureWrapper").css("display","flex").show();

	// 큰 이미지를 둘러 싸고 있는 div를 클릭하면 안 보이게 하는 이벤트 처리
	$(".bigPicture")
	.html("<img src='/display?fileName=" + fileCallPath + "'>")
	.animate({width:'100%', height:'100%'}, 1000);
}