/**
 * 첨부파일에 대한 이벤트를 선언
 */
//하단부분의 HTML 객체를 선택해야 하므로 HTML 문서 로딩 후 실행되도록 형태를 정의한다.

	$(function() {
		//dataRow 클래스 클릭 이벤트
		$(".dataRow").click(function() {
			// 클래스로 no 태그 안에 글번호를 넣어 놨다. 글번호 가져오기
			// this 자기 자신의 객체
			// find("찾는 객체") -> 선택한 객체 안에서 찾는다.
			// text() -> 선택한 객체(태그) 안에 글자를 가져온다.
			var no = $(this).find(".no").text();
			//alert("dataRow class click. no =" + no);

			//글보기 페이지로 이동 시킨다.
			if ($(this).hasClass("hotelbooking"))
				location = "/hotelbooking/view.do?hbno="+no;
				});
				 
		});