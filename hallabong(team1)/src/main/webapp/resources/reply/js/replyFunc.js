/**
 * 댓글에서 사용할 변수와 함수를 선언해 놓는다.
 */
console.log("----------------------------");
console.log("replyFunc.js loading ....");
	

var noValue = ""; // 게시판 보기에서 글번호를 찾아서 세팅
var replyUL = ""; // 댓글 목록을 표시한 객체 선택

// 자동으로 실행이 안되고 호출해야 실행된다.
// 댓글 리스트 처리 함수 ==============================================================
function showList(page){
	console.log("show list - page : " + page);
	console.log("show list - noValue : " + noValue);
	
	// getList(서버로 전달 데이터, 서버에 갔다오면 처리되는 함수(callback), 오류가 나면 처리되는 함수(error))
	replyService.getList(
			{no:noValue, page : page || 1},
			function(pageObject, list){

				// 넘어오는 데이터 확인하기
				console.log("pageObject : " + JSON.stringify(pageObject));
				console.log("list : " + JSON.stringify(list));

				// page가 -1이면 마자막 페이지로 이동시키자.
				// 글등록을 하면 페이지를 -1을 줘서 마지막 페이지로 이동시킨다. rno asc 정렬로 찾기 때문에 -> desc 필요없다.
				/*
				if(page == -1){
					pageNum = Math.ceil(replyCnt / 10.0);
					showList(pageNum);
					return;
				}
				*/
				
				// list가 넘어오지 않았거나 데이터가 없는 경우 처리하지 않게한다.
				if(list == null || list.length == 0){
					replyUL.html("");
					return;
				}

				// 데이터가 있는 경우의 처리
				var str = "";
				for(var i = 0, len = list.length || 0; i < len; i++){
					// rno를 li 태그에 숨겨 놨다.(data-rno) -> 찾아 올때는 .data("rno") -> 세팅할때는 .data("rno", 1)
					str += "<li class='left clearfix' data-rno='" + list[i].rno + "' >";
					str += "  <div>";
					str += "     <div class='hader'>";
					str += "        <strong class='primary-font'>" + list[i].id + "</strong>";
					str += "        <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small>";
					str += "        <p>" + list[i].reply + "</p>";
					str += "        <p class='left clearfix' data-star='" + list[i].star + "'>" + "</p>";
					str += "     </div>";
					str += "  </div>";
					str += "</li>";
				} // for 문의 끝 - str완성 : 데이터가 있는 만큼 li tag가 생긴다.

				replyUL.html(str); // 원래 있던 것은 사라지고 덮어 쓰기가 된다.

				// 페이지네이션 붙이기
				showReplyPage(pageObject);
				
			}
	); // replyServic.getList() 의 끝
} // showList()의 끝


// 댓글 페이지 처리를 위한 변수 -----------------------------------
var pageNum = 1;
var replyPageFooter = "";


// 댓글의 페이지네이션을 위한 처리 함수 =================================================
function showReplyPage(pageObject){

	// ******************** 페이지 표시하기 *********************************//
	var str = "<ul class='pagination pull-right'>";

	// 이전 페이지 표시
	if(pageObject.startPage > 1){
		str += "<li class='page-item'><a class='page-link' href='" 
			+ (pageObject.startPage - 1) + "'>Previous</a></li>";
	}

	// 시작 페이지 ~ 끝페이지까지 표시
	for(var i = pageObject.startPage ; i <= pageObject.endPage ; i++){
		// 현재 페이지 표시 - active에 i가 현재 페이지면 active라고 넣는다.
		var active = pageObject.page == i ? "active" : "";
		str += "<li class='page-item " + active + "' ><a class='page-link' href='" + i + "'>" + i + "</a></li>";
	}

	// 다음 페이지 표시
	if(pageObject.endPage < pageObject.totalPage){
		str += "<li class='page-item'><a class='page-link' href='" + (pageObject.endPage + 1) + "'>Next</a></li>";
	}
	
	str += "</ul>";

	console.log(str);

	// 페이네이션 객체에 html로 넣는다.
	replyPageFooter.html(str);
		
} // 댓글의 페이지네이션을 위한 처리 함수 끝

