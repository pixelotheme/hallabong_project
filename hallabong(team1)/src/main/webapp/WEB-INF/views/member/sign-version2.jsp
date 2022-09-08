<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link href="/resources/css/new_main.css" rel="stylesheet" />
<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// 비밀번호 확인
	$(function(){
		$('.pw').focusout(function () {
			//각각 값을 담는곳
	        var pwd1 = $("#pw1").val();
	        var pwd2 = $("#pw2").val();
			
	        if ( pwd1 != '' && pwd2 == '' ) {
	            null;
	        }
			// 각 값이 비어있지 않다면 확인	   
			else if (pwd1 != "" || pwd2 != "") {     
	       		  if (pwd1 == pwd2) {
	            	// 일치하면 아래의 설정한 font로 출력
	            	$('#pwcheck').html('비밀번호 일치함<br><br>');
	                $('#pwcheck').attr('color', '#199894b3');
	            } else {
	            	if (pw2 != null){
	            		// 동일함
	            	$('#pwcheck').html('비밀번호 일치하지 않음<br><br>');
	                $('#pwcheck').attr('color', '#f82a2aa3');
	            	$("#pw2").focus();

	            	}
	            };
	        }

	});

		$('.pw').focusout(function () {
			// 8자 이상이지 않으면 알람 출력 및 값 비우기
			if ($("#pw1").val().length < 8) {
					$('#pwcheck1').html('비밀번호는 8자 이상이어야 합니다<br><br>');
					$('#pwcheck1').attr('color', '#f82a2aa3');
					$("#pw1").val("").focus();
				return false;

			} else {
				// 형식에 맞다면 알람 지우기
				$('#pwcheck1').html('');

				} 
			// 비밀번호 공백 지우기
			if($.trim($("#pw1").val()) !== $("#pw1").val()){
					$('#pwcheck1').html('공백은 입력이 불가능합니다<br><br>');
					$('#pwcheck1').attr('color', '#f82a2aa3');
					$("#pw1").val("").focus();
					return false;
				}
		});
		// 아이디 공백 지우기
		$('#id').focusout(function () {
			
			if($.trim($("#id").val()) !== $("#id").val()){
				$('#id_check').html('공백은 입력이 불가능합니다<br><br>');
				$('#id_check').attr('color', '#f82a2aa3');
				$("#id").val("").focus();
				return false;
			}

		});
		// 연락처 공백 지우기
		$('#tel').focusout(function () {
			
			if($.trim($("#tel").val()) !== $("#tel").val()){
				$('#tel_check').html('공백은 입력이 불가능합니다<br><br>');
				$('#tel_check').attr('color', '#f82a2aa3');
				$("#").val("").focus();
				return false;
			}

		});

		
		
		
		// 아이디 중복체크
		$("#id").keyup(function() {
			$.ajax({
				url : "/member/check_id.do",
				type : "POST",
				data : {
					id : $("#id").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$('#id_check').attr('color', '#199894b3');
					
					} else {
						$("#id_check").html("");
						$('#id_check').attr('color', '#f82a2aa3');
					}
				},
			})
		});
		
// 		// 이메일 중복체크
// 		$("#email").keyup(function(){
// 			$.ajax({
// 				url : "/member/check_email.do",
// 				type : "POST",
// 				data : {
// 					email : $("#email").val()
// 				},
// 				success : function(result) {
// 					if (result == 1) {
// 						$("#email_check").html("중복된 이메일이 있습니다.");
// 						$('#email_check').attr('color', '#f82a2aa3');
// 					} else {
// 						$("#email_check").html("");
// 						$("#btnSign").removeAttr("disabled");
// 					}
// 				},
// 			})
// 		});
		
// 		// 전화번호 중복체크
// 		$("#tel").keyup(function(){
// 			$.ajax({
// 				url : "/member/check_tel.do",
// 				type : "POST",
// 				data : {
// 					tel : $("#tel").val()
// 				},
// 				success : function(result) {
// 					if (result == 1) {
// 						$("#tel_check").html("중복된 전화번호가 있습니다.");
// 						$("#btnSign").attr("disabled", "disabled");
// 					} else {
// 						$("#tel_check").html("");
// 						$("#btnSign").removeAttr("disabled");
// 					}
// 				},
// 			})
// 		});
	})
	
</script>


</head>
<body>

		<div id="wrapper">

			<!-- content-->
<div class="container">

<form action="sign.do" id="sign" method="post" enctype="multipart/form-data">
					<table class="table">
				<tr>
					<th>아이디</th>
					<!-- maxlength : 입력 최대 길이 제한, placeholder:값이 비어 있으면 배경으로 나타나는 글자, required:필수입력 autocomplete:자동완성기능 -->
					<td><input name="id" maxlength="20" placeholder="아이디입력"
						required="required" title="필수입력" autocomplete="off" id="id">
						<font id='id_check' size="2"></font>
						</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input name="pw" maxlength="20" required="required" type="password" class="pw" id=pw1 pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$">
						<font id='pwcheck1' size="2" color="#eee"></font>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input name="pw" maxlength="20" required="required" type="password" class="pw" id=pw2 pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"> 
						<font id="pwcheck" size="2" color="#eee"></font>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="name" required="required" maxlength="10"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input name="gender" type="radio" value="남자"
						checked="checked"> 남자 <input name="gender" type="radio"
						value="여자"> 여자</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input name="birth" required="required" maxlength="4"
						style="width: 40px;" id="year"> 년 <input name="births"
						required="required" maxlength="2" style="width: 40px;"
						type="number" min="1" max="12" value="1" id="month"> 월 <input
						name="births" required="required" maxlength="2"
						style="width: 40px;" id="day"> 일</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input name="tel" maxlength="13" required="required" placeholder="- 없이 숫자만 입력해주세요." pattern="([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})" id="tel">
					<font id="tel_check" size="2" color="#eee"></font>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input name="email" required="required" pattern = [a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,} id="email">
						<font id="email_check" size="2" color="#eee"></font>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<!-- button type - submit:데이터 전달, reset:처음상태, button:동작이 없다. -->
						<button type="submit" id="btnSign">가입</button>
						<button type="reset">새로고침</button>
						<button type="button" onclick="location='/main/main.do'">취소</button>
					</td>
				</tr>
			</table>
	</form>
</div>
			<!-- content-->

		</div>
		<!-- wrapper -->
<!-- <script src="/js/main.js"></script> -->
</body>
</html>