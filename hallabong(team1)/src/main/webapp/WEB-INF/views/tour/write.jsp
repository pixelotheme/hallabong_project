<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광명소 게시판 글쓰기</title>
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
	<h2>관광명소 게시판 글쓰기</h2>
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" name="perPageNum" value="${param.perPageNum}">
		<div class="form-group">
			<label for="name">관광명소 이름</label>
			<input type="text" name="name" id="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="area">지역 선택</label>
			<select name="area" id="area">
				<option value="제주시">제주시</option>
				<option value="애월읍">애월읍</option>
				<option value="한림읍">한림읍</option>
				<option value="한경면">한경면</option>
				<option value="대정읍">대정읍</option>
				<option value="안덕면">안덕면</option>
				<option value="서귀포시">서귀포시</option>
				<option value="남원읍">남원읍</option>
				<option value="표선면">표선면</option>
				<option value="성산읍">성산읍</option>
				<option value="구좌읍">구좌읍</option>
				<option value="조천읍">조천읍</option>
			</select>
		</div>
		<div class="form-group">
			<label for="theme">테마 선택</label>
			<select name="theme" id="theme">
				<option value="체험관광">체험관광</option>
				<option value="휴양관광">휴양관광</option>
				<option value="역사문화">역사문화</option>
				<option value="박물관/기념관">박물관/기념관</option>
				<option value="드라마">드라마</option>
				<option value="전통시장">전통시장</option>
			</select>
		</div>
		<div class="form-group">
			<label for="address">주소</label>
			<input type="text" name="address" id="address" class="form-control">
		</div>
		<div class="form-group">
			<label for="tel">대표전화</label>
			<input type="text" name="tel" id="tel" class="form-control">
		</div>
		<div class="form-group">
			<label for="hours">운영시간</label>
			<input type="text" name="hours" id="hours" class="form-control">
		</div>
		<div class="form-group">
			<label for="imageFile">대표 이미지</label>
			<input type="file" name="imageFile" id="imageFile" class="form-control">
		</div>
		<div class="form-group">
			<label for="imageFile">이미지 파일</label>
			<input type="file" name="imageFile" id="imageFile" class="form-control">
		</div>
		<div class="form-group">
			<label for="content">소개</label>
			<textarea rows="5" name="content" class="form-control" style="width:100%;"></textarea>
		</div>
		<div class="form-group">
			<label for="map">지도</label>
			<textarea rows="5" name="content" class="form-control" style="width:100%;"></textarea>
		</div>
	
		<div class="text-right">
			<button class="btn btn-info">글등록</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" id="cancleBtn" class="btn btn-default">취소</button>
		</div>
	</form>
</div>
</body>
</html>