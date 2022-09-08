<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<!-- a태그 강제 클릭 이벤트를 하기 위한 라이브러리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- alert창 디자인 바꾸기 위한 라이브러리 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
//삭제 ---------------------
$().ready(function () {
	    $(".deleteBtn").click(function () {
	        Swal.fire({
	            title: '삭제하시겠습니까?',
	            text: "삭제되면 복구 불가",
	            icon: 'warning',
	            showDenyButton: true,
	            confirmButtonColor: '#3085d6',
	            denyButtonColor: '#d33',
	        }).then((result) => {
	        	  if (result.isConfirmed) {
	        		    $(".deleteBtn").attr("href","delete.do?no=${vo.no }")
	        		    $(".deleteBtn")[0].click()
	        		    Swal.fire('삭제 완료', '', 'success')
	        		  } else if (result.isDenied) { 
	        		    Swal.fire('삭제 취소', '', 'success')
	        		  }
	        })
	    });
	});
//취소(돌아가기)--------------------------
$().ready(function () {
	    $("#cancelBtn").click(function () {
	        Swal.fire({
	            icon: 'question',
	            title: 'FAQ 리스트 돌아갑니다.',
	            text: '',
	            showDenyButton: true,
	            confirmButtonColor: '#3085d6',
	            denyButtonColor: '#d33',
	        }).then((result) => {
	        	if (result.isConfirmed) {
	                Swal.fire('FAQ 리스트 돌아갑니다.', '', 'success')
	        		history.back()
	        	}else if (result.isDenied) {
        		    Swal.fire('FAQ 리스트로 돌아가지않습니다.', '', 'success')
      		  } 
	        })
	    });
});
//등록--------------------------
$().ready(function () {
    $("#update").click(function () {
        Swal.fire({
            icon: 'question',
            title: '글을 수정 하시겠습니까?',
            text: '제목, 내용을 다 수정 하셨습니까?',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        }).then((result) => {
        	if (result.isConfirmed) {
        		$("#update").attr("type","submit")
    		    $("#update").trigger("click")
                Swal.fire('글 수정 됐습니다.', '', 'success')
                $("#update").attr("type","button")
            }else if (result.isDenied) {
    		    Swal.fire('글 수정이 취소 됐습니다.', '', 'success')
  		  }
        })
    });
});
//새로입력--------------------------
$().ready(function () {
    $("#reset").click(function () {
        Swal.fire({
            title: '새로 입력 하실겁니까?',
            text: "입력하신 것들이 지워집니다.",
            icon: 'question',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        })
        .then((result) => {
        	  if (result.isConfirmed) {
        		    $("#reset").attr("type","reset")
        		    $("#reset").trigger("click")
        		    Swal.fire('새로 입력 완료!', '', 'success')
        		    $("#reset").attr("type","button")
        		  } else if (result.isDenied) {
        		    Swal.fire('새로 입력 취소', '', 'success')
        		  }
        })
    });
});
</script>
</head>
<body>
<div class="container">
	<h2>수정하기</h2>
	<form method="post">
		<div class="form-group">
			<label>번호</label>
			<input name="no" required="required" class="form-control" value="${vo.no }">
		</div>
		<div class="form-group">
			<label>제목</label>
			<input name="title" required="required" class="form-control" value="${vo.title }">
		</div>
		<div class="form-group">
			<label>내용</label>
			<p style="white-space: pre-line;"><textarea rows="5" name="content" class="form-control">${vo.content }</textarea></p>
		</div>
		<button type="button" id="update" class="btn btn-default">수정</button>
		<button type="button" id="reset" class="btn btn-default">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
		<a class="btn btn-default deleteBtn">삭제</a>		
	</form>
	
</div>
</body>
</html>