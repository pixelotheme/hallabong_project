<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록</title>	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function() {
	//이벤트 처리
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
</head>
<body>
	<div class="container">
	<h2>호텔 등록 </h2>
	
		<form action="write.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="perPageNum" value="${param.perPageNum }">
			<table class="table">
				<tr>
					<th>지역</th>
					<td>
						<select name="area" >
							<option value="">지역 선택</option>
							<option value="제주시">제주시</option>
							<option value="서귀포시">서귀포시</option>
							<option value="조천읍">조천읍</option>
							<option value="한림읍">한림읍</option>
							<option value="한경면">한경면</option>
							<option value="대정읍">대정읍</option>
							<option value="안덕면">안덕면</option>
							<option value="남원읍">남원읍</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>호텔명</th>
					<td><input name="name" class="form-control"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="bus_address" class="form-control"></td>
				</tr>
				<tr>
					<th>bus_tel</th>
					<td><input name="bus_tel" class="form-control"></td>
				</tr>
				<tr>
					<th>e_mail</th>
					<td><input name="bus_mail" class="form-control"></td>
				</tr>
				<tr>
					<th>소개글</th>
					<td><input name="content" class="form-control"></td>
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