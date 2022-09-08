<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link href="/resources/css/sign.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
	
	// 비밀번호 확인
	$(function(){
		$("#signForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		})
		
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
						$("#btnSign").attr("disabled", "disabled");
					} else {
						$("#id_check").html("");
						$("#btnSign").removeAttr("disabled");
					}
				},
			})
		});
		
		// 이메일 중복체크
		$("#email").keyup(function(){
			$.ajax({
				url : "/member/check_email.do",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
						$("#email_check").attr("color", "#199894b3");
						$("#btnSign").attr("disabled", "disabled");
					} else {
						$("#email_check").html("");
						$("#btnSign").removeAttr("disabled");
					}
				},
			})
		});
		
		// 전화번호 중복체크
		$("#tel").keyup(function(){
			$.ajax({
				url : "/member/check_tel.do",
				type : "POST",
				data : {
					tel : $("#tel").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#tel_check").html("중복된 전화번호가 있습니다.");
						$('#tel_check').attr('color', '#199894b3');
						$("#btnSign").attr("disabled", "disabled");
					} else {
						$("#tel_check").html("");
						$("#btnSign").removeAttr("disabled");
					}
				},
			})
		});
	})
</script>


</head>
<body>

	<!-- header -->
		<!-- wrapper -->
		<div id="wrapper">

			<!-- content-->
			<div id="content">

	<form action="sign.do" id="sign" method="post">


				<div>
					<h3 class="sign_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id"> <input type="text" id="id"
						name="id" class="int" maxlength="20" pattern = "[A-za-z0-9]{5,20}">
					</span> 
					<span id="id_check"></span>
					<span class="error_next_box"></span>
				</div>

				<div>
					<h3 class="sign_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="password" id="pw1"
						name="pw" class="int" maxlength="20" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" required="required"> <span id="alertTxt">사용불가</span>
						<img src="/resources/image/m_icon_pass.png" id="pswd1_img1"
						class="pswdImg" >
					</span> 
					<span class="error_next_box"></span>
				</div>

				<div>
					<h3 class="sign_title">
						<label for="pswd2">비밀번호 재확인</label>
					</h3>
					<span class="box int_pass_check"> <input type="password"
						id="pw2" name="pw2" class="int" maxlength="20" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" required="required"> <img
						src="/resources/image/m_icon_check_disable.png" id="pswd2_img1"
						class="pswdImg">
					</span> 
					<span class="error_next_box"></span>
				</div>

				<div>
					<h3 class="sign_title">
						<label for="name">이름</label>
					</h3>
					<span class="box int_name"> <input type="text" id="name"
						name="name" class="int" maxlength="20" required="required">
					</span> 
					<span class="error_next_box"></span>
				</div>
				
				
				<div>
					<h3 class="sign_title">
						<label for="birth">생년월일</label>
					</h3>
					<span class="box int_name"> <input type="date" id="birth"
						name="birth" class="int" maxlength="20" required="required">
					</span> 
					<span class="error_next_box"></span>
				</div>
				
				
				
				<div>
					<h3 class="sign_title">
						<label for="gender">성별</label>
					</h3>
					<span class="box gender_code"> <select id="gender" name="gender"
						class="sel">
							<option>성별</option>
							<option value="남자">남자</option>
							<option value="여자">여자</option>
					</select>
					</span> 
					<span class="error_next_box">필수 정보입니다.</span>
				</div>
				<div>
					<h3 class="sign_title">
						<label for="email">이메일</label>
					</h3>
					<span class="box int_email"> 
						<input type="text" id="email" name="email" class="int" maxlength="100" pattern = [a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,} required="required">
					</span> 
						<span id="email_check"></span>
						<span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
				</div>
				<div>
					<h3 class="sign_title">
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile"> <input type="text" id="tel" name="tel"
						class="int" maxlength="16" placeholder="- 없이 숫자만 입력해주세요." pattern="([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})" required="required">
					</span> 
					<span id="tel_check" class="w3-text-red"></span>
					<span class="error_next_box"></span>
				</div>


				<div class="btn_area">
					<button id="btnSign">
						<span> 가입하기 </span>
					</button>
				</div>
	</form>

			</div>
			<!-- content-->

		</div>
		<!-- wrapper -->
<script src="/js/main.js"></script>
</body>
</html>