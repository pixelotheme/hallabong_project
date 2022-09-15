<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>렌트카 회사 수정</title>
<meta charset="UTF-8">
<!--    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarCompany/addressForWrite.js"></script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarCompany/telForWrite.js"></script>
<!-- <script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarCompany/ajaxForUpdate.js"></script> -->
<!-- ajax  -->
<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarCompany/infoForUpdateFunc.js"></script>
<script type="text/javascript" src="/resources/rentCar/rentCarJS/rentCarCompany/infoForUpdateEvent.js"></script>

<script>

$(function(){

//회사 삭제
	$("#deleteBtn").on("click", function(){
		
			alert(companyNo)
			if(confirm("정말 삭제하시겠습니까?")){
			location='companyDelete.do?companyNo='+companyNo;
				}
		})
//리스트로 돌아가기
		$("#cancelBtn").on("click", function(){
		location='/rentcarcompany/rentCarCompanyList.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}';
		
		})
		

//수정시 아이디비교
		$("#submitBtn").on("click", function(){
			// "test" 자리에 로그인 아이디 넣어주면된다
// 			alert("${login.id}");
			if(confirm("수정하시겠습니까?")){
				if($("#id").val() == "${login.id}"){
					
					$("#updateForm").submit();
					}
				else{
					alert("수정 권한이없습니다")
					}
				};
		})


		//로드가 되면 change 시키는것은 어떤가
jQuery(document).ready(function() {

// 	   alert("로딩 완료"); 
	   $("#companySelect option[value=${param.companyNo}]").prop('selected','selected').change();
	});		
})

</script>
<style type="text/css">
#zipBtn{
margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container">
	<h2>렌트카 회사 수정</h2>
			<div class="form-group">
			회사
				<select name="companyNo" id="companySelect" class="form-control">
						<option selected="selected">회사 선택</option>
					<c:forEach items="${companyVO }" var="company">
						<option value="${company.companyNo }" >${company.companyName }</option>
					</c:forEach>
				</select>
			</div>
	
	
		<form method="post" id="updateForm">
		
				<input type="hidden" name="page" value="${param.page}">
				<input type="hidden" name="perPageNum" value="${param.perPageNum}">
<!-- 		<input type="hidden" value="" id="updateCompanyNo" name="companyNo"> -->
		
		
			<div class="form-group">
				<!--  for 는 id 와 연결된다   name은 vo 변수명과 같아야한다-->
				<label for="id">등록한 아이디</label>
				<input name="id" id="id" class="form-control" readonly="readonly">
			</div>		
			<div class="form-group">
				<!--  for 는 id 와 연결된다   name은 vo 변수명과 같아야한다-->
				<label for="companyName">회사명</label>
				<input name="companyName" id="companyName" class="form-control" required="required">
			</div>		
			<div class="form-group">
				<!--  나중에 유효성검사 010-0000-0000 으로 자동으로 바뀌게 해주기 -->
				<label for="tel">연락처</label>
				<input name="tel" id="tel" class="form-control" required="required" maxlength="13">
			</div>		
			
			<div>
			<label>현재 주소</label>
			<div></div>
			</div>
			<div class="input-group">
				<!--  주소 api 쓰기-->
				<p>    우편번호 : <input name="zipcode" id="zipcode" readonly size="10" class="form-control" placeholder="우편변호">
				   <input type="button" onclick="daumZipCode()" value="우편번호 찾기" id="zipBtn"> </p>
				    주소 : <input name="streetAdr" id="streetAdr" size="60" class="form-control" placeholder="주소"><br>
				    상세주소 : <input name="detailAdr" id="detailAdr" class="form-control" placeholder="상세주소">
			</div>		
		
		</form>
		
		
		
			<div style="padding-top: 10px">
				<button class="btn btn-default" type="button" id="submitBtn">수정</button>
				<button class="btn btn-default" type="reset">새로입력</button>
				<button class="btn btn-default" type="button" id="deleteBtn">회사 삭제</button>
				<button class="btn btn-default" type="button" id="cancelBtn">취소, 리스트</button>
			</div>
	</div>
</body>
</html>