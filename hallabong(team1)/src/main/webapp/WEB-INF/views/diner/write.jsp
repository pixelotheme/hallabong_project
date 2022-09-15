<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 등록</title>	
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
	<h2>맛집 등록 폼</h2>
	
		<form action="write.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="perPageNum" value="${param.perPageNum }">
			<table class="table">
				<tr>
					<th>가게명</th>
					<td><input name="name" class="form-control"></td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<select name="region" >
							<option value="전체">전체</option>
							<option value="제주 모슬포/화순">제주 모슬포/화순</option>
							<option value="제주 서귀포시내">제주 서귀포시내</option>
							<option value="제주 성산/우도">제주 성산/우도</option>
							<option value="제주 제주시내">제주 제주시내</option>
							<option value="제주 중문단지">제주 중문단지</option>
							<option value="제주 표선/성읍">제주 표선/성읍</option>
							<option value="제주 한림/애월">제주 한림/애월</option>
							<option value="제주 함덕/김녕">제주 함덕/김녕</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>음식 종류</th>
					<td>
						<select name="kind">
					<option value="전체">전체</option>
					<option value="한식">한식</option>
					<option value="분식">분식</option>
					<option value="양식">양식</option>
					<option value="해산물">해산물</option>
					<option value="회/스시">회/스시</option>
					<option value="세계음식">세계음식</option>
					<option value="뷔페">뷔페</option>
					<option value="디저트">디저트</option>
					<option value="카페">카페</option>
					<option value="술집">술집</option>
					<option value="브런치">브런치</option>
					<option value="치킨">치킨</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="address" class="form-control"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input name="tel" class="form-control"></td>
				</tr>
				<tr>
					<th>가격대</th>
					<td><input name="price" class="form-control"></td>
				</tr>
				<tr>
					<th>소개</th>
					<td><input name="introduce" class="form-control"></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input name="imageFile" id="imageFile" class="form-control" type="file" required="required"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="7" name="content" class="form-control"></textarea></td>
				</tr>
						
				<tr>
					<th>주차</th>
					<td><input name="park" class="form-control"></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td><input name="hours" class="form-control"></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-info">등록</button>
			<button type="reset" class="btn btn-info">새로입력</button>
			<button type="button" id="cancelBtn" class="btn btn-info">취소</button>
		</form>

	</div>
</body>
</html>