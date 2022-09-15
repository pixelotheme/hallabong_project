/**
 * 댓글의 이벤트 처리
 */
// 하단 부부의 HTML 객체를 선택해야 하므로 HTML 문서 로딩 후 실행되도록 형태를 정의


$(function(){
	
	console.log("----------------------------");
	console.log("replyEvent.js 실행.");
	
	// 변수에 대한 값을 세팅한다.
	noValue = $("#no").data("no"); // 게시판 보기에서 글번호를 찾아서 세팅
	replyUL = $(".chat"); // 댓글 목록을 표시한 객체 선택
	replyPageFooter = $("#footer_pagination");

	console.log("replyEvent $(function()({})) - noValue : " + noValue);
	
	var starValue = ""; // 별점 변수 선언
	
	//자동으로 한번은 댓글이 실행되게 한다. 페이지 : 1
	showList(1);
	
	// 댓글 등록을 위한 모달 창을 보이게 하는 버튼 이벤트 ----------------------------------
	$("#addReplyBtn").on("click",function(e){
//			var star = $(this).data("star");
//			$("myModal").data("star", star);
	//	 alert("댓글 등록 창 열기 클릭1");
		// 모달 창의 데이터를 지운다.
		$("#modalReply").val("");
		// 필요한 입력항목은 보이게 필요 없는 보이지 않게
		$("#modalUpdateBtn, #modalDeleteBtn").hide();
		$("#modalRegisterBtn").show();
		// 모달 창을 보이게 한다.
		$("#myModal").modal("show");
	//	alert("modal open");

	});// 댓글 등록을 위한 모달 창을 보이게 하는 버튼 이벤트 끝

	// 모달 창의 등록 버튼 이벤트 -> 댓글 등록 처리 진행 -----------------------------------
	$("#modalRegisterBtn").on("click", function(){
		// alert("댓글 진행 처리");
		
		// 데이터 수집
		var reply = {
			reply : $("#modalReply").val(),
			id : $("#modalId").val(),
			star : starValue,
			no : noValue
		}
		
//		console.log(starValue);
		
		// 댓글 등록 함수로 데이터 전달이 잘해서 댓글 등록 진행
		replyService.add(
			reply,
			// 등록 성공했을 때 후에 실행되는 함수
			function(result){
				// 결과 메시지 경고
				alert(result);
				// 댓글 리스트를 새롭게 뿌려 준다.
				showList(1);
			}
		);

		// 모달을 닫는다.
		$("#myModal").modal("hide");
		
	});// 모달 창의 등록 버튼 이벤트의 끝
	


	// 댓글을 클릭하면 수정 / 삭제하는 이벤트 - 모달 창을 연다. -----------------------------
	$(replyUL).on("click", "li", function(){
		// alert("댓글 수정이나 삭제를 진행");
		// rno를 찾아 와서 modal에 세팅하자. (data-* 활용) - 숨겨서 세팅
		var rno = $(this).data("rno");
		// alert(rno);
		$("#myModal").data("rno", rno);
		// alert($("#myModal").data("rno"));
		
		// 수정할 데이터 세팅
		var reply = $(this).find("p").html();
		// alert(reply); 
		$("#modalReply").val(reply.replaceAll("<br>", "\n"));
		var id = $(this).find("strong").text();
		$("#modalId").val(id);
		
		var star = $(this).find("p").html();
		$("#star").val(star);
		
		
		
		// 필요한 입력항목은 보이게 필요 없는 보이지 않게
		$("#modalUpdateBtn, #modalDeleteBtn").show();
		$("#modalRegisterBtn").hide();
		$("#myModal").modal("show");
	}); // 댓글을 클릭하면 수정 / 삭제하는 이벤트의 끝

	// 댓글 수정 처리 이벤트 --------------------------------------------------
	$("#modalUpdateBtn").on("click",function(){
		// 데이터수집 -> JSON
		var reply = {
			reply : $("#modalReply").val(),
			star : $("#star").val(),
			rno : $("#myModal").data("rno")
		}

		// modal을 안보이기
		$("#myModal").modal("hide");
		
		// replyService로 보낸다.
		replyService.update(reply, function(result){
			alert(result);
			showList(pageNum);
		});
	})// 댓글 수정 처리 이벤트의 끝

	// 댓글 삭제 처리 이벤트 --------------------------------------------------
	$("#modalDeleteBtn").on("click", function(){
		replyService.remove($("#myModal").data("rno"),
			function(result){ // 성공했을 때 실행되는 함수
				$("#myModal").modal("hide"); // 모달창 닫기
				alert(result); // 서버에서 전달 메시지 출력
				showList(1); // 댓글 리스트 다시 불러오기
			},
			function(err){ // 실패했을 때 실해되는 함수.
				alert("Error ... : " + err)
			}
		);
	}); // 댓글 삭제 처리 이벤트 끝

		(function () {
    var starEls = document.querySelectorAll('#star span.star');
    var rate = 0;

    loop(starEls, function (el, index) {
        el.addEventListener('click', function () {
            rating(index + 1);
        });
    });

    function loop(list, func) {
        Array.prototype.forEach.call(list, func);
    }

    function rating(score) {
        loop(starEls, function (el, index) {
            if (index < score) {
                el.classList.add('on');
            } else {
                el.classList.remove('on');
            }
        });

        rate = score;
    }
})();

	// 페이지네이션 페이지 이벤트 함수 ------------------------------------------------
	// 반드시 on 함수 사용해야만 한다. - JS에 의해서 새로 생긴 태그에는 이벤트가 주어지지 않는다.
	replyPageFooter.on("click", "li a", function(e){
		// a 태그 페이지 이동 무시
		e.preventDefault();
		// alert("댓글 페이지 이동 클릭");

		// 이동하려는 페이지 정보 가져오기
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum : " + targetPageNum);
		// 전역 변수인 pageNum에 넣으면 다른 함수에서도 사용이 가능하다.
		pageNum = targetPageNum;

		showList(pageNum);
	});// 페이지네이션 페이지 이벤트 함수 끝


	// 별 이벤트
	$(".star").click(function(){
		starValue = $(this).data("star");
	});
});