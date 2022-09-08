<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>렌트카 회사 등록</title>


<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarCompany/addressForWrite.js"></script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarCompany/telForWrite.js"></script>

<script type="text/javascript">
$(function(){
	$("#cancelBtn").on("click",function(){
		location="/rentcarcompany/rentCarCompanyList.do?perPageNum=${param.perPageNum}"
		})
	
})

</script>
</head>
<body>
	<div class="container">
	<h2>렌트카 회사 등록</h2>
		<form method="post">
		<input type="hidden" value="${param.perPageNum }" name="perPageNum">
			<div class="form-group">
				<!--  for 는 id 와 연결된다   name은 vo 변수명과 같아야한다, 비어있지않게-->
				<label for="companyName">회사명</label>
				<input name="companyName" id="companyName" class="form-control" required="required" >
			</div>		
			<div class="form-group">
				<!--  나중에 유효성검사 010-0000-0000 으로 자동으로 바뀌게 해주기 -->
				<label for="tel">연락처</label>
				<input name="tel" id="tel" class="form-control" required="required" maxlength="13" placeholder="숫자만 입력해주세요" value="064"/>
			</div>		
			<div class="input-group">
				<!--  주소 api 쓰기-->
<!-- 				<label for="address"></label> -->
				<p>    우편번호 : <input name="zipcode" id="zipcode" readonly size="10" class="form-control" placeholder="우편번호">
				    <input type="button" onclick="daumZipCode()" value="우편번호 찾기"> </p>
				    주소 : <input name="streetAdr" id="streetAdr" size="60" class="form-control" placeholder="주소"  required="required"><br>
				    상세주소 : <input name="detailAdr" id="detailAdr" class="form-control" placeholder="상세주소"  required="required">
			</div>		
			<div>
				<button class="btn btn-default" id="submitBtn">등록</button>
				<button class="btn btn-default" type="reset">새로입력</button>
				<button class="btn btn-default" type="button" id="cancelBtn">취소</button>
			</div>
		
		</form>
		
		
		
	</div>
</body>
</html>