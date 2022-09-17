<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광명소 게시판 글수정</title>

<link rel="stylesheet" type="text/css" href="/resources/tour/css/tour.css">

<script type="text/javascript">
$(function(){
	(function(){
		
		var no = $("#no").data("no");

		$.getJSON("/tour/getAttachList", {no : no}, function(arr){
			console.log(arr);

			var str = "";
			// list를 데이터가 있는 만큼 반복 처리한다. foreach : each()
			// each(function(index, dto))
			$(list).each(function(i, obj){
				var fileCallPath = "";
				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
					 +"' data-filename='" + obj.fileName + "' data-type='"+obj.image+"'>";
				str += "<div>";
				if(!obj.image){
					//이미지가 아닌 경우의 내용
					// 다운로드 받을 파일 정보를 만든다.(조립)
					fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" +obj.fileName);
					str += "<a href='/download?fileName="+fileCallPath+"'>";
					str += "<span class='glyphicon glyphicon-floppy-open'></span> " 
						+ obj.fileName;
					str += "</a>"
				} else {
					// 이미지인 경우의 내용
					// 불러올 파일 정보를 만든다.(조립)
					fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" +obj.fileName);
					// s_ 가 없는 원래 이미지 파일
					var originPath = obj.uploadPath + "\\" + obj.uuid + "_" +obj.fileName;

					// \\ -> \ 로 변환되어 처리된다. \\ ==> / 로 변환시키자.
					originPath = originPath.replace(new RegExp(/\\/g), "/");

					// javascript:showImage() -> javascript tag 바로 아래 showImage()를 찾는다.
					str += "<a href=\"javascript:showImage(\'" + originPath + "\')\">";
					str += "<img src='/display?fileName=" + fileCallPath + "'style='max-width:100px;'>";
					str += "</a>"
				} // if else의 끝
				str += "<span class=\'deleteX\' data-file=\'" + fileCallPath + "\' data-type=\'" + (obj.image?"image":"file") + "\'>";
				str += " x ";
				str += "</span>";
				str += "</div>";
				str += "</li>";
			}); // foreach의 끝

			$(".uploadResult ul").html(str);
		});
	});
});
</script>

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
			<label for="imageFile">대표 이미지(수정 시 썸네일은 필수로 넣어주세요.)</label>
			<input type="file" name="imageFile" id="imageFile" class="form-control" value="${vo.thumbnail}">
		</div>
		<!-- <div class="form-group">
			<div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
					  <div class="panel-heading">첨부파일 여러개 등록</div>
					  <div class="panel-body">
					  	첨부할 파일을 선택하는 div -> 파일을 선택하면 값이 변경된다. change 이벤트가 발생
					  	<div class="form-group uploadDiv">
							<input type="file" name="uploadFile" multiple>
						</div>
						올라간 파일의 정보보이기 div.
						<div class="uploadResult">
							<ul>
							</ul>
						</div>
					  </div>
					</div>
            		
            	</div>
            </div>
            /.row - 첨부파일의 끝
		</div> -->
		<div class="form-group">
			<label for="content">소개</label>
			<textarea rows="5" name="content" class="form-control" style="width:100%;">${vo.content}</textarea>
		</div>
		<div class="form-group">
			<label for="roadMap">지도</label>
			<textarea rows="5" name="roadMap" class="form-control" style="width:100%;">${vo.roadMap}</textarea>
		</div>
	
		<div class="text-right" style="margin-top:30px;">
			<button class="btn btnC" id="submitBtn">글수정</button>
			<button type="reset" class="btn btnD">새로입력</button>
			<button type="button" id="cancleBtn" class="btn btnD">취소</button>
		</div>
	</form>
</div>
</body>
</html>