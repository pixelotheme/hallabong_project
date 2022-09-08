<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 글수정</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#cancleBtn").click(function(){
		history.back();
	});
});
</script>
</head>
<body>
<div class="container">
	<h2>이미지 게시판 글수정</h2>
	<form method="post">
		<input type="hidden" name="page" value="${param.page}">
		<input type="hidden" name="perPageNum" value="${param.perPageNum}">
		<!-- <input type="hidden" name="key" value="${param.key}">
		<input type="hidden" name="word" value="${param.word}"> -->
		<div class="form-group">
			<label for="no">번호</label>
			<input type="text" name="no" id="no" class="form-control" value="${vo.no}" readonly>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" name="title" id="title" class="form-control" value="${vo.title}">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea rows="5" name="content" class="form-control" style="width:100%;">${vo.content}</textarea>
		</div>
	
		<div class="text-right">
			<button class="btn btn-info">글수정</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" id="cancleBtn" class="btn btn-default">취소</button>
		</div>
	</form>
</div>
</body>
</html>