<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>차량 기본정보</title>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 정규표현식 -->
<script type="text/javascript" src="/resources/rentCar/regEx.js"></script>
<script type="text/javascript" src="/resources/rentCar/form.js"></script>

<script type="text/javascript">

var loginGradeNo = "${login.gradeNo}";

</script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/carbasicinfo/writeFunc.js"></script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/carbasicinfo/writeEvent.js"></script>

</head>
<body>
	<div class="container">
	<h2>차량 기본정보 등록</h2>
		<form  method="post" id="actionForm" enctype="multipart/form-data">
		<input type="hidden" value="${param.perPageNum }" name="perPageNum">
			<div class="form-group">
				<!--  for 는 id 와 연결된다   name은 vo 변수명과 같아야한다-->
				<label for="carName">차 이름</label>
				<input name="carName" id="carName" class="form-control" >
			</div>		
			<div>
			차종
				<select name="carTypes" class="form-control">
					<option value="소형">소형</option>
					<option value="중형">중형</option>
					<option value="고급">고급</option>
					<option value="suv/승합">suv/승합</option>
					<option value="수입">수입</option>
				</select>
			</div>	
			<div class="form-group">
				<label for="carCapacity">차량 정원</label>
				<input id="carCapacity" class="form-control" >
			</div>		
			<div>
				연료
				<select name="carFuel" class="form-control">
					<option value="휘발유">휘발유</option>
					<option value="경유">경유</option>
					<option value="LPG">LPG</option>
					<option value="전기">전기</option>
					<option value="하이브리드">하이브리드</option>
				</select>
			</div>	
			
			<div>
				<label for="uploadFile">사진</label> 
				<input type="file" name="uploadFile" multiple="multiple" class="btn btn-default">
			</div>
			
			<div>
				<button class="btn btn-default" type="button" class="btn btn-default" id="submitBtn">등록</button>
				<button class="btn btn-default" type="reset"class="btn btn-default">새로입력</button>
				<button class="btn btn-default" type="button" id="cancelBtn"class="btn btn-default">취소</button>
			</div>
		
		</form>
		
		
		
	</div>
</body>
</html>