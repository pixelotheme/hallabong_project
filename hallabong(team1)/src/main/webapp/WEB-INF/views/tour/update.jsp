<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광명소 게시판 글수정</title>

<script type="text/javascript" src="/resources/tour/js/tourUpload.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#cancleBtn").click(function(){
		history.back();
	});

	$("#area").val(${vo.area}).prop("selected", true);
	$("#theme").val(${vo.theme}).prop("selected", true);
});
</script>
</head>
<body>
<div class="container">
	<form method="post" role="form" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${param.page}">
		<input type="hidden" name="perPageNum" value="${param.perPageNum}">
		<input type="hidden" name="area" value="${param.area}">
		<input type="hidden" name="theme" value="${param.theme}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="no" value="${param.no}">
		<div class="form-group">
			<label for="name">관광명소 이름</label>
			<input type="text" name="name" id="name" class="form-control" value="${vo.name}">
		</div>
		<div class="form-group">
			<label for="area">지역 선택</label>
			<select name="area" id="area" required="required">
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
			<select name="theme" id="theme" required="required">
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
			<textarea rows="5" name="content" class="form-control" style="width:100%;">${vo.content}
			</textarea>
		</div>
		<div class="form-group">
			<label for="roadMap">지도</label>
			<textarea rows="5" name="roadMap" class="form-control" style="width:100%;">${vo.roadMap}
			</textarea>
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