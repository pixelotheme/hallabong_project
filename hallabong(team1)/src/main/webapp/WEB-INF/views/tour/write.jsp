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

<script type="text/javascript" src="/resources/tour/js/tourUpload.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/tour/css/tour.css">

</head>
<body>
<div class="container">
	<form method="post" role="form" enctype="multipart/form-data">
		<input type="hidden" name="perPageNum" value="${param.perPageNum}">
		<div class="form-group">
			<label for="name">관광명소 이름</label>
			<input type="text" name="name" id="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="area">지역 선택</label>
			<select name="area" id="area">
				<option value="1">제주시</option>
				<option value="2">애월읍</option>
				<option value="3">한림읍</option>
				<option value="4">한경면</option>
				<option value="5">대정읍</option>
				<option value="6">안덕면</option>
				<option value="7">서귀포시</option>
				<option value="8">남원읍</option>
				<option value="9">표선면</option>
				<option value="10">성산읍</option>
				<option value="11">구좌읍</option>
				<option value="12">조천읍</option>
			</select>
		</div>
		<div class="form-group">
			<label for="theme">테마 선택</label>
			<select name="theme" id="theme">
				<option value="1">체험관광</option>
				<option value="2">휴양관광</option>
				<option value="3">역사문화</option>
				<option value="4">박물관/기념관</option>
				<option value="5">드라마</option>
				<option value="6">전통시장</option>
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
			<div class="row">
            	<div class="col-lg-12" style="padding:0;">
            		<div class="panel panel-default">
					  <div class="panel-heading">서브 이미지(최대 4장만 올려 주세요.)</div>
					  <div class="panel-body">
					  	<!-- 첨부할 파일을 선택하는 div -> 파일을 선택하면 값이 변경된다. change 이벤트가 발생 -->
					  	<div class="form-group uploadDiv">
							<input type="file" name="uploadFile" multiple>
						</div>
						<!-- 올라간 파일의 정보보이기 div. -->
						<div class="uploadResult">
							<ul>
							</ul>
						</div>
					  </div>
					</div>
            		
            	</div>
            </div>
            <!-- /.row - 첨부파일의 끝-->
		</div>
		<div class="form-group">
			<label for="content">소개</label>
			<textarea rows="5" name="content" class="form-control" style="width:100%;"></textarea>
		</div>
		<div class="form-group">
			<label for="roadMap">지도</label>
			<textarea rows="5" name="roadMap" class="form-control" style="width:100%;"></textarea>
		</div>
	
		<div class="text-right" style="margin-top:30px;">
			<button type="submit" class="btn btnC">글등록</button>
			<button type="reset" class="btn btnD">새로입력</button>
			<button type="button" id="cancleBtn" class="btn btnD">취소</button>
		</div>
	</form>
</div>
</body>
</html>