<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 수정</title>	
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
$(function() {
	//이벤트 처리
	$("#cancelBtn").click(function(){
 	//	alert("취소 클릭");
		history.back();
	});
	$("#region").val(${vo.region }).prop("selected", true);
	$("#kind").val(${vo.kind }).prop("selected", true);
});
</script>
</head>
<body>
	<div class="container">
	<h2>맛집 수정 </h2>
	
		<form action="update.do" method="post" enctype="multipart/form-data">
			<input name="page" type="hidden" value="${param.page }">
			<input name="perPageNum" type="hidden" value="${param.perPageNum }">
			<input name="key" type="hidden" value="${param.key }">
			<input name="word" type="hidden" value="${param.word }">
			<input name="no" type="hidden" value="${vo.no }">
			<table class="table">
				<tr>
					<th>가게명</th>
					<td><input name="name" class="form-control" value="${vo.name }" required = "required"></td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<select name="region" id="region" required="required">
							<option value="0">전체</option>
							<option value="1">제주 모슬포/화순</option>
							<option value="2">제주 서귀포시내</option>
							<option value="3">제주 성산/우도</option>
							<option value="4">제주 제주시내</option>
							<option value="5">제주 중문단지</option>
							<option value="6">제주 표선/성읍</option>
							<option value="7">제주 한림/애월</option>
							<option value="8">제주 함덕/김녕</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>음식 종류</th>
					<td>
						<select name="kind" id="kind" required="required">
					<option value="0">전체</option>
					<option value="1">한식</option>
					<option value="2">분식</option>
					<option value="3">양식</option>
					<option value="4">해산물</option>
					<option value="5">회/스시</option>
					<option value="6">세계음식</option>
					<option value="7">뷔페</option>
					<option value="8">디저트</option>
					<option value="9">카페</option>
					<option value="10">술집</option>
					<option value="11">브런치</option>
					<option value="12">치킨</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="address" class="form-control" value="${vo.address }" required="required"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input name="tel" class="form-control" value="${vo.tel }" required="required"></td>
				</tr>
				<tr>
					<th>음식 종류</th>
					<td><input name="foodType" class="form-control" value="${vo.foodType }"></td>
				</tr>
				<tr>
					<th>가격대</th>
					<td><input name="price" class="form-control" value="${vo.price }"></td>
				</tr>
				<tr>
					<th>소개</th>
					<td><input name="introduce" class="form-control" value="${vo.introduce }" required="required"></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input name="imageFile" id="imageFile" class="form-control" type="file" value="${vo.image}" required="required"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="7" name="content" class="form-control" required="required">${vo.content }</textarea></td>
				</tr>
						
				<tr>
					<th>주차</th>
					<td><input name="park" class="form-control" value = "${vo.park }"></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td><input name="hours" class="form-control" value="${vo.hours }"></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-default">수정</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
		</form>

	</div>
</body>
</html>