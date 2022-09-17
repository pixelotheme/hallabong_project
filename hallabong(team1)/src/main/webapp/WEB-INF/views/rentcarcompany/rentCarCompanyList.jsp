<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#searchForm{
padding-bottom: 15px;
}
</style>

<title>렌트카 회사 리스트</title>
</head>
<body>
<div class="container">

					<!-- 검색 시작 -->
		<form class="form-inline" id="searchForm">
			<!-- 검색 key -->
			<div class="input-group">
				<select class="form-control" name="key" id="key">
						<option value="companyName">회사명 검색</option>
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
			
		<table width="100%"
			class="table table-bordered table-hover">
			
			<tr>
				<th>글번호</th>
				<th>회사명</th>
				<th>연락처</th>
				<th>주소</th>
				<th>등록한 아이디</th>
			</tr>
			
			
			<tbody>
				<c:forEach items="${list }" var="vo">
				<!-- move 를 클릭하면 그안에 bno 가져와서 js 로  form태그의 action을 글보기로
				바꿔 넘겨준다 -->
					<tr onclick="location='/rentcarcompany/rentCarCompanyUpdate.do?companyNo=${vo.companyNo}&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}'">
						<td>
						${vo.companyNo}
						</td>
						<td>
						${vo.companyName}
						</td>
						<td>
						${vo.tel}
						</td>
						<td>
						${vo.address}
						</td>
						<td>
						${vo.id}
						</td>
						
					</tr>
				</c:forEach>

			</tbody>

		</table>
<c:if test="${login.gradeNo == 9 }">
	<button class="btn btn-default" type="button" onclick="location='/rentcarcompany/rentCarCompanyWrite.do?perPageNum=${pageObject.perPageNum}'">회사등록</button>
	<button class="btn btn-default" type="button" onclick="location='/rentcarboard/rentCarBoardList.do'">렌트카 리스트</button>
	<!-- 페이징 처리 -->
</c:if>		
	<div>
		<pageNav:rentCarPageNav listURI="rentCarCompanyList.do" pageObject="${pageObject }"/>
	</div>


</div>
</body>
</html>