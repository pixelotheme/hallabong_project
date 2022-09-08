<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 등록</title>	
<script type="text/javascript">
$(function() {
	//이벤트 처리
	$("#cancelBtn").click(function(){
 		alert("취소 클릭");
		history.back();
	});
});
</script>
</head>
<body>
	<div class="container">
	<h1>맛집 등록 폼</h1>
		<form action="write.do" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>가게명(*)</th>
					<td><input name="name" class="form-control"></td>
				</tr>
				<tr>
					<th>지역(*)</th>
					<td>
						<select name="region" >
							<option value="EV">전체</option>
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
					<th>음식 종류(*)</th>
					<td>
						<select name="kind">
					<option value="EV">전체</option>
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
					<th>주소(*)</th>
					<td><input name="address" class="form-control"></td>
				</tr>
				<tr>
					<th>연락처(*)</th>
					<td><input name="tel" class="form-control"></td>
				</tr>
				<tr>
					<th>음식 종류(*)</th>
					<td><input name="foodType" class="form-control"></td>
				</tr>
				<tr>
					<th>가격대(*)</th>
					<td><input name="price" class="form-control"></td>
				</tr>
				<tr>
					<th>소개</th>
					<td><input name="introduce" class="form-control"></td>
				</tr>
				<tr>
					<th>이미지(*)</th>
					<td><input name="image" class="form-control" type="file" required="required"></td>
				</tr>
				<tr>
					<th>내용(*)</th>
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
<!-- 			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">이미지 추가</button><br> -->			
			<button type="submit" class="btn btn-info">등록</button>
			<button type="reset" class="btn btn-info">새로입력</button>
			<button type="button" id="cancelBtn" class="btn btn-info">취소</button>
		</form>
<!-- 		<button id="check">확인</button> -->
	</div>
	
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	 	<div class="modal-dialog">	
	    	<!-- Modal content-->
	    	<div class="modal-content">
			    <form action="">
			    	<div class="modal-header">
			    		<button type="button" class="close" data-dismiss="modal">&times;</button>
			    		<h4 class="modal-title">이미지 추가</h4>
			      	</div>
			      	<div class="modal-body">
				      	<div id="subImageDiv">
				      		<input type="button" value="추가" onclick="addSubImage()">
				      		<input type="file" name="subImage" class="form-control">
				      		<br><br>	      		
				      	</div>
			      	</div>
			      	<div class="modal-footer">
			      		<button>확인</button>
			        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      	</div>
			    </form>
	    	</div>	
		</div>	  
	</div>
</body>
</html>