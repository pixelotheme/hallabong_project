<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>비밀번호 찾기</title>

<link href="/resources/css/login.css" rel="stylesheet"/>

</head>
<body>
<div class="main">
			<form action="findPw.do" method="post">
			<section class="login-wrap">
				<h3>비밀번호 찾기</h3>
				<div class="w3-content w3-container w3-margin-top">
					<div class="w3-container w3-card-4">
						<div class="w3-center w3-large w3-margin-top"></div>
						<div align="center">
							<label>아이디</label>
							<div class="form-group login-id-wrap" align="center">
								<input placeholder="아이디" type="text" class="input-id" name="id"
									id="id" style="background: #fff;" autocomplete="off" />
							</div>
							<label>이름</label>
							<div class="form-group login-id-wrap" align="center">
								<input placeholder="이름" type="text" class="input-id" name="name"
									id="name" style="background: #fff;" autocomplete="off" />
							</div>
							<label>연락처</label>
							<div class="form-group login-id-wrap" align="center">
								<input placeholder="연락처" type="text" class="input-id" name="tel"
									id="tel" style="background: #fff;" autocomplete="off" />
							</div>
							<div class="login-btn-wrap" align="center">
								<button type="submit" class="login-btn">아이디 찾기</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>
		</div>
</body>
</html>