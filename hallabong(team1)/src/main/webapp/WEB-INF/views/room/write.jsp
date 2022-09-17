<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 등록</title>	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function() {
	//이벤트 처리
	$("#cancelBtn").click(function(){
 	//	alert("취소 클릭");
		history.back();
	});
});
</script>
</head>
<body>
	<div class="container">
	<h2>객실 등록 폼</h2>
	
		<form action="write.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="perPageNum" value="${param.perPageNum }" >
			<input type="hidden" name="no" value="${param.no }" >
			<table class="table">
				
				<tr>
					<th>객실 명</th>
					<td><input name="ro_name" class="form-control"></td>
				</tr>
				<tr>
					<th>1박 기준 가격</th>
					<td><input name="ro_price" class="form-control"></td>
				</tr>
				<tr>
					<th>인원수</th>
					<td><input name="ro_people" class="form-control"></td>
				</tr>
				<tr>
					<th>객실 기본 옵션</th>
					<td><textarea rows="7" name="ro_info" class="form-control"></textarea></td>
				</tr>
				<tr>
					<th>예약상태</th>
					<td><input name="ro_state" class="form-control"></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input name="imageFile" id="imageFile" class="form-control" type="file" required="required"></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-info">등록</button>
			<button type="reset" class="btn btn-info">새로입력</button>
			<button type="button" id="cancelBtn" class="btn btn-info">취소</button>
		</form>

	</div>
</body>
</html>