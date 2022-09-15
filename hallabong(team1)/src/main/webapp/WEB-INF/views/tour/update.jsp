<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광명소 게시판 글수정</title>

<script type="text/javascript">
$(document).ready(function(){
	$("#cancleBtn").click(function(){
		history.back();
	});
	$("#area").val(${vo.area}).prop("selected", true);
	$("#theme").val(${vo.theme}).prop("selected", true);

	$("#submitBtn").click(function(){
		alert($("#area").val());
		alert($("#theme").val());
	});
});
</script>

<script type="text/javascript" src="/resources/tour/js/tourUpload.js"></script>
</head>
<body>
<div class="container">
	<form method="post" role="form" enctype="multipart/form-data">
		<input name="page" type="hidden" value="${param.page}">
		<input name="perPageNum" type="hidden" value="${param.perPageNum}">
		<input name="areaUrl" type="hidden" value="${param.area}">
		<input name="themeUrl" type="hidden" value="${param.theme}">
		<input name="no" type="hidden" value="${vo.no}">
		<div class="form-group">
			<label for="name">관광명소 이름</label>
			<input type="text" name="name" id="name" class="form-control" value="${vo.name}">
		</div>
		<div class="form-group">
			<label for="area">지역 선택</label>
			<select name="area" id="area" required="required">
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
			<select name="theme" id="theme" required="required">
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
			<input type="text" name="address" id="address" class="form-control" value="${vo.address}">
		</div>
		<div class="form-group">
			<label for="tel">대표전화</label>
			<input type="text" name="tel" id="tel" class="form-control" value="${vo.tel}">
		</div>
		<div class="form-group">
			<label for="hours">운영시간</label>
			<input type="text" name="hours" id="hours" class="form-control" value="${vo.hours}">
		</div>
		<div class="form-group">
			<label for="imageFile">대표 이미지</label>
			<input type="file" name="imageFile" id="imageFile" class="form-control" value="${vo.thumbnail}">
		</div>
		<div class="form-group">
			<div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
					  <div class="panel-heading">첨부파일 여러개 등록</div>
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
			<textarea rows="5" name="content" class="form-control" style="width:100%;">${vo.content}</textarea>
		</div>
		<div class="form-group">
			<label for="roadMap">지도</label>
			<textarea rows="5" name="roadMap" class="form-control" style="width:100%;">${vo.roadMap}</textarea>
		</div>
	
		<div class="text-right">
			<button class="btn btn-info" id="submitBtn">글수정</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" id="cancleBtn" class="btn btn-default">취소</button>
		</div>
	</form>
</div>
</body>
</html>