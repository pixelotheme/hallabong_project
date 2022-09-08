<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>차량 기본정보</title>

<script type="text/javascript">
$(function(){
	$("#cancelBtn").on("click",function(){
		location="/carbasicinfo/carBasicInfoList.do?perPageNum=${param.perPageNum}"
		})

		//대여가능(만)나이
		$("#carCapacity").keyup(function(){
			var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식

			var carCapacity = $("#carCapacity").val();
			carCapacity = carCapacity.replace(regex, "")+'명';
			$("#carCapacity").val(carCapacity);
					
			})	

		$("#submitBtn").on("click", function(){
			
			
			//  == 로그인한 아이디 == 등급번호 -
			if("admin" != "admin"){
				alert("관리자 아이디로 로그인해주세요")
				
				return null;
				}
			else{
				event.preventDefault();
				var regex = /[^0-9]/g;
				//input 태그 hidden으로 집어넣어줄 예정 - 가격, 대여가능나이, 대여가능 운정 경력
				var carCapacity = $("#carCapacity").val();
				carCapacity = carCapacity.replace(regex, "");

				var str = '<input type="hidden" name="carCapacity"  value="'+carCapacity+'" />';

				
				
				$("#actionForm").append(str)
				$("#actionForm").submit();
				}
			
			});
})

</script>
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