<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- alert창 디자인 바꾸기 위한 라이브러리 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>FAQ 글 등록</title>
<script type="text/javascript">
// 취소(돌아가기)--------------------------
$().ready(function () {
	    $("#cancelBtn").click(function () {
	        Swal.fire({
	            icon: 'question',
	            title: 'FAQ 게시판 리스트로 돌아갑니다.',
	            text: '',
	            showDenyButton: true,
	            confirmButtonColor: '#3085d6',
	            denyButtonColor: '#d33',
	        }).then((result) => {
	        	if (result.isConfirmed) {
	                Swal.fire('리스트로 돌아갑니다.', '', 'success')
	        		history.back()
	        	}else if (result.isDenied) {
        		    Swal.fire('리스트로 돌아가지않습니다.', '', 'success')
      		  } 
	        })
	    });
});
// 등록--------------------------
$().ready(function () {
    $("#write").click(function () {
        Swal.fire({
            icon: 'question',
            title: '글을 등록 하시겠습니까?',
            text: '제목, 내용을 다 입력 하셨습니까?(입력 안 하셨다면 등록이 안됩니다.)',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        }).then((result) => {
        	if (result.isConfirmed) {
        		$("#write").attr("type","submit")
    		    $("#write").trigger("click")
                Swal.fire('글 등록 됐습니다.', '', 'success')
                $("#write").attr("type","button")
            }else if (result.isDenied) {
    		    Swal.fire('글 등록이 취소 됐습니다.', '', 'success')
  		  }
        })
    });
});
// 새로입력--------------------------
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
	<h2>FAQ 글 등록</h2>
	<form method="post">
		<div class="form-group">
			<label>제목</label>
			<input name="title" required="required" class="form-control">
		</div>
		<div class="form-group">
			<label>내용</label>
			<p style="white-space: pre-line;"><textarea rows="5" name="content" class="form-control"></textarea></p>
		</div>
		<button type="button" class="btn btn-default" id="write">등록</button>
		<button type="button" class="btn btn-default" id="reset">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
	</form>
</div>
</body>
</html>