<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA</title>
<!-- a태그 강제 클릭 이벤트를 하기 위한 라이브러리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- alert창 디자인 바꾸기 위한 라이브러리 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
.refNo{
	display: none;
}
</style>
<script type="text/javascript">
$(function(){
	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		var refno = $(this).find(".refNo").text();
		location = "view.do?no=" + no
				+ "&refNo=" + refno
				+ "&page=${pageObject.page}"
				+ "&perPageNum=${pageObject.perPageNum}"
				+ "&key=${pageObject.key}"
				+ "&word=${pageObject.word}"
	});
});
//질문 창 이동 ---------------------
$().ready(function () {
    $("#write").click(function () {
        Swal.fire({
            title: '질문하기로 이동할까요?',
            text: "",
            icon: 'question',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        }).then((result) => {
        	  if (result.isConfirmed) {
        		    $("#write").attr("href","write.do?perPageNum=${pageObject.perPageNum }")
        		    $("#write")[0].click()
        		    Swal.fire('질문하기로 이동합니다.', '', 'success')
        		  } else if (result.isDenied) { 
        		    Swal.fire('질문하기로 이동 안 합니다.', '', 'success')
        		  }
        })
    });
});
</script>
</head>
<body>
<div class="container">
<h1 style="font-size: 35px;">QNA</h1>
<div class="max-width-container">
        <!-- mainContents [depth3Tab] -->
        <div id="newsTab" class="depth3-tab depth3-list-wrap tab-news tab-column-4">
    <div class="scroller" style="width: 900px; transition-timing-function: cubic-bezier(0.1, 0.54, 0.4, 1); transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
        <div class="depth3-list">
          <span class="depth3-list-items selected">
          <a href="/faq/list.do" data-match-path="" style="font-size: 20px;">FAQ</a>
          </span>
          <span class="depth3-list-items">
          <a href="/qna/list.do" data-match-path="" style="font-size: 20px;">QNA</a>
          </span>
      </div>
    </div>
</div><!-- // mainContents [depth3Tab] -->
    </div>
<table class="table">
			<tr>
			<th style="font-size: 14px;">번호</th>
			<th style="font-size: 14px;">제목</th>
			<th style="font-size: 14px;">아이디</th>
			<th style="font-size: 14px;">작성일</th>
			</tr>
			<c:forEach items="${list }" var="vo">
			<tr class="dataRow">
				<td class="no">${vo.no }</td>
				<td class="refNo">${vo.refNo }</td>
				<td>${vo.title } 
				<c:if test="${vo.cnt > 0 }">
						<span class="badge">${vo.cnt }</span>
						</c:if>
				</td>
				<td style="font-size: 14px;">${vo.id }</td>
				<td style="font-size: 14px;"><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<a id="write" style="font-size: 14px;" class="btn btn-info pull-right">질문하기</a>
			</td>
		</tr>
</table>
</div>
</body>
</html>