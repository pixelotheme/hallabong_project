<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>

<link href="/resources/css/new_main.css" rel="stylesheet" />
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script type="text/javascript">

	// 다음 주소 api를 위한 코드
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[id=addr1]").val(data.zonecode);
				$("[id=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
	
</script>


</head>
<body>
		<div id="wrapper">

			<!-- content-->
			<div id="content">

	<form action="memberExUpdate.do" id="memberUpdate" method="post">


				<div>
					<label for="address">주소</label><br>
					<span class="post int_mobile"> <input
						class="int" style="width: 40%; display: inline; background:#eee;"
						placeholder="우편번호" name="zonecode" id="addr1" type="text"
						readonly="readonly" > 
					<button type="button" class="btn btn-default"
						onclick="execPostCode();" style="padding: 14px 12px; margin-left: 170px; margin-top: -52px; border-radius: 1px;">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
					</span>
				</div>
				<div>
					<span class="postbox int_mobile"><input class="int" placeholder="도로명 주소"
						name="address" id="addr2" type="text" readonly="readonly"  style="background:#eee;" value="${vo.address }" /> </span>
				</div>
				<div>
					<span class="postboxtext int_mobile"> <input class="int" placeholder="상세주소" name="address"
						id="addr3" type="text" /> </span>
				</div>


				<div class="btn_area">
					<button id="btnJoin">
						<span>수정하기</span>
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