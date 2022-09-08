<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>차량 기본정보 보기</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(function(){
	
})
</script>

</head>
<body>
<div class="container">

		<h2>차량 기본정보 보기</h2>

		
				<ul class="list-group">
		<!-- grid 를 사용한다면 class="col-md-2" 으로 할경우 깨짐 row 를 속성으로 넣어줘야 안깨진다 -->
				<li class="list-group-item row">
					<div class="col-md-3">번호</div>
					<div class="col-md-9">${carBasicInfoVO.carInfoNo }</div>
				</li>
				<li class="list-group-item row">
				<div class="col-md-3">모델</div>
				<div class="col-md-9">
				${carBasicInfoVO.carName }
				</div>
				</li>
				<li class="list-group-item row">
				<div class="col-md-3">연료</div>
				<div class="col-md-9">
				${carBasicInfoVO.carFuel }
				</div>
				</li>
				<li class="list-group-item row">
				<div class="col-md-3">정원</div>
				<div class="col-md-9">
				${carBasicInfoVO.carCapacity }
				</div>
				</li>
				<li class="list-group-item row">
				<div class="col-md-3">차종</div>
				<div class="col-md-9">
				${carBasicInfoVO.carTypes }
				</div>
				</li>
			</ul>	
		  	
					<!-- 이미지바꾸기 -->
			
							<img alt="차량 이미지" src="/upload/rentcarboard/${carFileUploadVO.realSavePath}/s_${carFileUploadVO.fileName}" width="100px">
												
					<form action="carBasicInfoImageDelete.do" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<input type="hidden" name="del" value="${carFileUploadVO.fileName != null ? carFileUploadVO.fileName:"0" }">
<%-- 							<input type="hidden" name="carNo" value="${carsVO.carNo }"> --%>
							<input type="hidden" name="carInfoNo" value="${carBasicInfoVO.carInfoNo}">
							<input type="hidden" name="page" value="${param.page}">
							<input type="hidden" name="perPageNum" value="${param.perPageNum}">									
							<input type="hidden" name="key" value="${param.key}">									
							<input type="hidden" name="word" value="${param.word}">									
						</div>
						<button class="btn btn-default">이미지 삭제</button>
						
					</form>

				<!-- 이미지바꾸기 끝-->
		
		<ul class="list-group">
		</ul>
	
	

<button class="btn btn-default" type="button" onclick="location='/carbasicinfo/carBasicInfoUpdate.do?carInfoNo=${carBasicInfoVO.carInfoNo}&page=${param.page }&perPageNum=${param.perPageNum }&key=${param.key }&word=${param.word }'">차량 기본 정보 수정</button>

<button class="btn btn-default" type="button" onclick="location='/carbasicinfo/carBasicInfoDelete.do?carInfoNo=${carBasicInfoVO.carInfoNo}&perPageNum=${param.perPageNum }'">차량 기본 정보 삭제</button>
<button class="btn btn-default" type="button" onclick="location='/carbasicinfo/carBasicInfoList.do?page=${param.page }&perPageNum=${param.perPageNum }&key=${param.key }&word=${param.word }'">리스트</button>

</div>


</body>
</html>