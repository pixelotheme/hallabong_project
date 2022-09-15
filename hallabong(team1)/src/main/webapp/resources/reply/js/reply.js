/**
 * 게시판 댓글 관련 JS
 */
 
 // js가 동작된다.
 console.log("Reply Module .......................");
 
 // replyService JS 객체 생성
 var replyService = (function(){
 	
 	// getList(서버로 전달 데이터, 서버에 갔다오면 처리되는 함수, 오류가 나면 처리되는 함수)
 	// callback, error 함수는 get.jsp의 js 부분에서 작성해서 넣어준다.
 	function getList(param, callback, error){
 		// alert("댓글 가져오리 처리");
 		var no = param.no; // param - json data
 		var page = param.page || 1; // param.page 데이터가 존재하지 않으면 1을 대신 사용하게 한다.
 		
 		// ajax를 통해서 json 데이터로 댓글 리스트를 가져오는 처리
 		// $.getJSON(url, [data,] function);
 		$.getJSON(
 			"/replies/pages/" + no + "/" + page + ".json",
 			// function(서버에서 전달하는 데이터 - json)
 			// 데이터 가져오기를 성공했을 때 처리되는 함수 - data == List<ReplyVO> -> json data -> foreach 
 			function(data){ // data{replyCnt, list}
 				// alert(JSON.stringify(data));
 				// callback 함수가 있으면 callback 함수를 실행하자.
 				if(callback){
 					callback(data.pageObject, data.list);
 				// callback 함수가 없으면 처리되는 처리문
 				} else {
	 				if(data.length > 0) {alert("데이터가 있습니다.");}
	 				else {alert("데이터가 없습니다.");}
 				}
 				
 			}
 		// 데이터 가져오기 실패했을 때 처리되는 함수.
 		).fail(function(xhr, status, err){
 			if(error) error();
 		});
 		// getJSON()의 끝
 		
 	} // getList 함수의 끝
 
 	function displayTime(timeValue){
 		// 오늘 날짜 객체 생성 - 24 시간이 지났는지 알아내기 위해서 필요
 		var today = new Date();
 		
 		// 댓글 작성 시간과의 차이
 		// 날짜객체.getTime() - long 타입의 날짜 데이터가 나온다.
 		var gap = today.getTime() - timeValue;
 		
 		// 작성 날짜에 대한 형식을 만들려 작성 날짜를 날짜객체로 만들어야 한다.
 		var dateObj = new Date(timeValue);
 		var str = "";
 		
 		// 24시간이 안 지난 경우 - 시분초를 출력한다.
 		if(gap < (24 * 60 * 60 * 1000)){
 			
 			var hh = dateObj.getHours();
 			var mi = dateObj.getMinutes();
 			var ss = dateObj.getSeconds();
 			
 			// join(구분문자) 배열을 이어주는 함수. 배열 사이에 구분문자를 넣어 줘서 이어준다. 
 			return [
 				(hh > 9 ? '' : '0') + hh, ':',
 				(mi > 9 ? '' : '0') + mi, ':',
 				(ss > 9 ? '' : '0') + ss
 			].join('');
 		
 		// 24시간이 지난 경우 - 날짜 정보만 출력한다.
 		} else{
 		
 			var yy = dateObj.getFullYear();
 			// 월은 날짜 객체는 0 ~ 11 까지만 운영을 한다. 우리가 사용하는 월은 + 1 처리해야만 한다.
 			var mm = dateObj.getMonth() + 1;
 			var dd = dateObj.getDate();
 			
 			// join(구분문자) 배열을 이어주는 함수. 배열 사이에 구분문자를 넣어 줘서 이어준다. 
 			return [
 				yy, '-',
 				(mm > 9 ? '' : '0') + mm, '-',
 				(dd > 9 ? '' : '0') + dd
 			].join('');
 		
 		}
 		
 	} // displayTime()의 끝
 	
 	// 댓글 등록
 	// add(JSON 데이터, 등록 성공 시 처리 함수(), 등록 오류 처리함수())
 	function add(reply, callback, error){
	
 		console.log("add reply ....... reply : " + JSON.stringify(reply));
 		
 		// ajax를 이용해서 서버에 데이터 전달(URL - /reply/new)
 		$.ajax(
 			{
 				type : "post", // 전달 방식
 				url : "/replies/new", // url
 				data : JSON.stringify(reply), // 브라우저 -> 서버 전달 데이터
 				contentType : "application/json; charset=utf-8", // 전달 데이터의 형식
 				success : function(result, status, xhr){ // 서버 처리가 성공 후 브라우저에서 실행된 함수 
 							 if(callback) {
 							 	callback(result);
 							 }
 				},
 				error : function(xhr, status, er) { // 서버 처리가 실패 후 브라우저에서 실행된 함수 
 							if(error) {
 								error(er);
 							} else {
 								console.log(xhr);
 								console.log(status);
 								console.log(er);
 							}
 				}
 			}
 		);
 		
 	} // 댓글 등록의 끝
 	
 	// 댓글 수정 함수
 	function update(reply, callback, error){
 		// alert("update reply(json) : " + JSON.stringify(reply));
 		
 		// ajax를 이용해서 서버에 수정 요청한다.
 		$.ajax({
 			type : "put", // 전달 방식
 			url : "/replies/" + reply.rno, // 요청 URL
 			data : JSON.stringify(reply), // 서버에 넘어가는 데이터
 			contentType : "application/json; charset=utf-8", // 서버에 넘어가는 데이터의 형식
 			success : function(result, status, xhr){ // 서버에서 처리가 성공하면 실행하는 js의 처리 
 				if(callback) callback(result);
 			},
 			error : function(xhr, status, er){ // 서버에서 처리가 실패하면 실행하는 js의 처리 
 				if(error) error(er);
 				else {
 					console.log(xhr);
 					console.log(status);
 					console.log(er);
 				}
 			}
 		});
 	} // 댓글 수정 끝
 	
 	// 댓글 삭제 함수
 	function remove(rno, callback, error){
 		// alert("remove rno : " + rno);
 		
 		// ajax를 이용해서 서버에 수정 요청한다.
 		
 		$.ajax({
 			type : "delete", // 전달 방식
 			url : "/replies/" + rno, // 요청 URL
 			success : function(result, status, xhr){ // 서버에서 처리가 성공하면 실행하는 js의 처리 
 				if(callback) callback(result);
 			},
 			error : function(xhr, status, er){ // 서버에서 처리가 실패하면 실행하는 js의 처리 
 				if(error) error(er);
 				else {
 					console.log(xhr);
 					console.log(status);
 					console.log(er);
 				}
 			}
 		});
 		
 	} // 댓글 수정 끝
 	
 	return {
 		getList : getList,
 		add : add,
 		update : update,
 		remove : remove,
 		displayTime : displayTime
 	};
 })();
 