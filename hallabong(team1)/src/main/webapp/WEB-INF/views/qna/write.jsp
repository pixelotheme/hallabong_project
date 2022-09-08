<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- alert창 디자인 바꾸기 위한 라이브러리 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>질문하기</title>
<script type="text/javascript">
// 취소(돌아가기)--------------------------
$().ready(function () {
	    $("#cancelBtn").click(function () {
	        Swal.fire({
	            icon: 'question',
	            title: 'QNA 게시판 리스트로 돌아갑니다.',
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
// 질문--------------------------
$().ready(function () {
    $("#write").click(function () {
        Swal.fire({
            icon: 'question',
            title: '질문 등록 하시겠습니까?',
            text: '제목, 내용을 다 입력 하셨습니까?(입력 안 하셨다면 등록이 안됩니다.)',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        }).then((result) => {
        	if (result.isConfirmed) {
        		$("#write").attr("type","submit")
    		    $("#write").trigger("click")
                Swal.fire('질문이 등록 됐습니다.', '', 'success')
                $("#write").attr("type","button")
            }else if (result.isDenied) {
    		    Swal.fire('질문 등록이 취소 됐습니다.', '', 'success')
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
	<h1 style="font-size: 14px;">질문하기</h1>
	<form method="post">
		<input name="perPageNum" value="${param.perPageNum }" type="hidden">
		<div class="form-group">
			<label style="font-size: 14px;">제목</label>
			<input name="title" required="required" class="form-control" style="font-size: 14px;">
		</div>
		<div class="form-group">
			<label style="font-size: 14px;">내용</label>
			<textarea rows="5" name="content" class="form-control" style="font-size: 14px;"></textarea>
		</div>
		<button type="button" class="btn btn-info" id="write" style="font-size: 14px;">질문하기</button>
		<button type="button" class="btn btn-info" id="reset" style="font-size: 14px;">새로입력</button>
		<button type="button" id="cancelBtn" class="btn btn-info" style="font-size: 14px;">취소</button>
	</form>
</div>
</body>
</html>