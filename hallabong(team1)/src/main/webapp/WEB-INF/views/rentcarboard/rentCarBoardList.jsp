<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
<!--    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<meta charset="UTF-8">

<title>렌트카 리스트</title>
<style type="text/css">
li{
list-style: none;
}

.dataRow:hover{
	background: #eee;
	cursor: pointer;
}
.dataRow{
	border-left: none;
	border-right: none;
}
.list-group-item:first-child{
border-top-left-radius:0;
border-top-right-radius:0;
}
.carImage{
width:100px;

height: 110px;
}

.price{
padding-top: 95px;
font-size: 30px;
}
</style>

<script type="text/javascript">

jQuery(document).ready(function() {

	   $("#key").val("${empty(pageObject.key)?'':pageObject.key}");
	});	


</script>

</head>
<body>
<div class="container">

					<!-- 검색 시작 -->
		<form class="form-inline">
			<div class="row">
			
				<!-- 검색 key -->
				<div class="input-group">
					<select class="form-control" name="key" id="key">
							<option value="">회사 선택</option>
						<c:forEach items="${companys }" var="company">
							<option value="${company.companyName }">${company.companyName }</option>
						</c:forEach>
					</select>
				</div>
				<!-- 검색 word -->
				<div class="input-group">
					<input type="text" class="form-control" placeholder="차량검색" name="word" value="${pageObject.word }">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</div>
		</form>
		<!-- 검색 종료 -->

		<div class="row">
			<div class="col-md-12">
				<!-- 데이터 들어가는공간 -->
				<div class="list-group">
					<c:forEach items="${list }" var="vo">
						<div class="list-group-item dataRow row" 
						onclick="location='/rentcarboard/rentCarBoardView.do?carNo=${vo.carNo}&carInfoNo=${vo.carInfoNo }&companyNo=${vo.companyNo }&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}'">
						
							<div data-carNo="${vo.carNo }" class="col-md-3">
								<img alt="차량 이미지" src="/upload/rentcarboard/${vo.realSavePath}/s_${vo.fileName}" 
								width="100px">
							</div>
							<div data-carInfoNo="${vo.carInfoNo }" class="col-md-3">
								<ul>
									<li>${vo.companyName}</li>
									<li>${vo.carName }</li>
									
									<li>${vo.insuranceType == null ? "자차미포함":"'vo.insuranceType'" }
									${vo.carTypes }
									${vo.carFuel }</li>
									<li><fmt:formatDate value="${vo.modelYears }" pattern="yyyy-MM"/> 
									, ${vo.rentAge }</li>
									
								</ul>
							</div>
							<div class="col-md-3 carOption" >
								<ul>
									<li>${ vo.smoking == null ? "금연차량":"<strong>금연차량</strong>" }
									${ vo.navigation == null ? "네이게이션":"<strong>네이게이션</strong>" }</li>
									<li>${ vo.blackbox == null ? "블랙박스":"<strong>블랙박스</strong>" }
									${ vo.rearCamera == null ? "후방카메라":"<strong>후방카메라</strong>" }</li>
									<li>${ vo.frontSensor == null ? "전방센서":"<strong>전방센서</strong>" }
									${ vo.rearSensor == null ? "후방센서":"<strong>후방센서</strong>" }</li>
									<li>${ vo.sunroof == null ? "썬루프":"<strong>썬루프</strong>" }
									${ vo.bluetooth == null ? "블루투스":"<strong>블루투스</strong>" }</li>
									<li>${ vo.heatingSheet == null ? "열선시트":"<strong>열선시트</strong>" }
									${ vo.heatingHandle == null ? "열선핸들":"<strong>열선핸들</strong>" }</li>
								</ul>
							</div>
							<div class="col-md-3 text-right price" >
								<span class="carPrice" style="align-self: center;"><fmt:formatNumber value="${vo.price }" pattern="#,###"/></span>원
							</div>
						</div><!-- //데이터 출력 -->
					</c:forEach>
				</div>			
			</div>
		</div>				
<c:if test="${login.gradeNo == 9 }">
<!-- 로그인시 등급번호에따라 보이게 -->
	<button class="btn btn-default" type="button" onclick="location='/rentcarboard/rentCarBoardWrite.do?perPageNum=${pageObject.perPageNum}'">렌트카 등록</button>
	<button class="btn btn-default" type="button" onclick="location='/rentcarcompany/rentCarCompanyList.do'">회사리스트</button>
<!-- 	<button type="button" onclick="location='/rentcarboard/rentCarCompanyWrite.do'">회사등록</button> -->
<!-- 	<button type="button" onclick="location='/rentcarboard/rentCarCompanyUpdate.do'">회사정보 수정</button> -->
	<button class="btn btn-default" type="button" onclick="location='/carbasicinfo/carBasicInfoList.do'">차종 리스트</button>
</c:if>
	
	<!-- 페이징 처리 -->
	<div>
		<pageNav:rentCarPageNav listURI="rentCarBoardList.do" pageObject="${pageObject }"/>
	</div>


</div>
</body>
</html>