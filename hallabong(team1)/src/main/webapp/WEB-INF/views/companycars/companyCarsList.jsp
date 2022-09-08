<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">



<title>차량 번호판 리스트</title>
<script type="text/javascript">
$(function(){
	
$("#key").val("${empty(pageObject.key)?'P':pageObject.key}");	
})

</script>

</head>
<body>
<div class="container">

					<!-- 검색 시작 -->
		<form class="form-inline">
			<input type="hidden" name="carNo" value="${param.carNo }">
			<input type="hidden" name="companyNo" value="${param.companyNo }">
			<input type="hidden" name="carInfoNo" value="${param.carInfoNo }">
			<!-- 검색 key -->
			<div class="input-group">
				<select class="form-control" name="key" id="key">
						<option value="P">번호판</option>
						<option value="C">예약자</option>
<!-- 						<option value="N">차량명</option> -->
						
				</select>
			</div>
			
			<!-- 검색 word -->
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search" name="word" value="${pageObject.word }">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- 검색 종료 -->
		<!-- 정렬을 위한 버튼 -->	
			
			
		<table width="100%"
			class="table table-bordered table-hover">
			<tr>
				<th>회사명, 회사이름</th>
				<th>번호판</th>
				<th>예약 상황</th>
				<th>예약자</th>
			</tr>
			
			
			
			<tbody>
				<c:forEach items="${list }" var="vo">
				<!-- move 를 클릭하면 그안에 bno 가져와서 js 로  form태그의 action을 글보기로
				바꿔 넘겨준다 -->
					<tr onclick="location='/companycars/companyCarsView.do?companyCarsNo=${vo.companyCarsNo}&carNo=${vo.carNo}&companyNo=${vo.companyNo }&carInfoNo=${param.carInfoNo }&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }&key=${pageObject.key }&word=${pageObject.word }'">
						
						<td data-carInfoNo="${vo.companyNo }">
						<p>${vo.companyName}</p>
						<p>${vo.carName }</p>
						</td>
						<td data-carNo="${vo.carNo }">
						<!-- 차 옵션 -->
						${vo.licensePlate }
						</td>
						<td >
						${vo.booking }
						${vo.booking == 1? "예약 불가":"예약 가능" }
						</td>
						<td >
						${vo.consumerId }
						${vo.consumerId != null? vo.consumerId:"예약자가 없습니다" }
						</td>
					</tr>
				</c:forEach>

			</tbody>

		</table>

	<button class="btn btn-default" type="button" onclick="location='/companycars/companyCarsWrite.do?carNo=${param.carNo}&companyNo=${param.companyNo }&carInfoNo=${param.carInfoNo }'">번호판 등록</button>
	
	<button class="btn btn-default" type="button" onclick="location='/rentcarboard/rentCarBoardView.do?carNo=${param.carNo}&carInfoNo=${param.carInfoNo }&companyNo=${param.companyNo }&page=1&perPageNum=10'">렌트카 보기</button>
	<!-- 페이징 처리 -->
	<div>
		<pageNav:rentCarPageNav listURI="companyCarsList.do" pageObject="${pageObject }" query="&carNo=${param.carNo}&companyNo=${param.companyNo }&carInfoNo=${param.carInfoNo }"/>
	</div>


</div>
</body>
</html>