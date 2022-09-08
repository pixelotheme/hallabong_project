<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 글 보기</title>
<!-- a태그 강제 클릭 이벤트를 하기 위한 라이브러리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- alert창 디자인 바꾸기 위한 라이브러리 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
//삭제 ---------------------
$().ready(function () {
	    $("#deleteBtn").click(function () {
	        Swal.fire({
	            title: '삭제하시겠습니까?',
	            text: "삭제되면 복구 불가",
	            icon: 'warning',
	            showDenyButton: true,
	            confirmButtonColor: '#3085d6',
	            denyButtonColor: '#d33',
	        }).then((result) => {
	        	  if (result.isConfirmed) {
	        		    $("#deleteBtn").attr("href","delete.do?no=${vo.no }&perPageNum=${param.perPageNum}")
	        		    $("#deleteBtn")[0].click()
	        		    Swal.fire('삭제 완료', '', 'success')
	        		  } else if (result.isDenied) { 
	        		    Swal.fire('삭제 취소', '', 'success')
	        		  }
	        })
	    });
	});
//리스트 ---------------------
$().ready(function () {
    $("#listBtn").click(function () {
        Swal.fire({
            title: '리스트로 돌아가겠습니까?',
            text: "",
            icon: 'question',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        }).then((result) => {
        	  if (result.isConfirmed) {
        		    $("#listBtn").attr("href","list.do?page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}")
        		    $("#listBtn")[0].click()
        		    Swal.fire('리스트로 돌아갑니다.', '', 'success')
        		  } else if (result.isDenied) { 
        		    Swal.fire('리스트로 안 돌아갑니다.', '', 'success')
        		  }
        })
    });
});
//수정으로 이동하기 ---------------------
$().ready(function () {
    $("#updateBtn").click(function () {
        Swal.fire({
            title: '수정창으로 이동할까요?',
            text: "",
            icon: 'question',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        }).then((result) => {
        	  if (result.isConfirmed) {
        		    $("#updateBtn").attr("href","update.do?no=${vo.no }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}")
        		    $("#updateBtn")[0].click()
        		    Swal.fire('수정창으로 이동합니다.', '', 'success')
        		  } else if (result.isDenied) { 
        		    Swal.fire('수정창으로 이동 안 합니다.', '', 'success')
        		  }
        })
    });
});
//답변으로 이동하기 ---------------------
$().ready(function () {
    $("#answerBtn").click(function () {
        Swal.fire({
            title: '답변 창으로 이동할까요?',
            text: "",
            icon: 'question',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        }).then((result) => {
        	  if (result.isConfirmed) {
        		    $("#answerBtn").attr("href","answer.do?no=${vo.no }&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}")
        		    $("#answerBtn")[0].click()
        		    Swal.fire('답변 창으로 이동합니다.', '', 'success')
        		  } else if (result.isDenied) { 
        		    Swal.fire('답변 창으로 이동 안 합니다.', '', 'success')
        		  }
        })
    });
});
</script>
</head>
<body>
<div class="container">
<h1 style="font-size: 14px;">QNA ${vo.no }번 글 보기</h1>
<div class="list-group">
			<div class="list-group-item row">
				<div class="col-md-3" style="font-size: 14px;">번호</div>
				<div class="col-md-9" style="font-size: 14px;">${vo.no }</div>
			</div>
			<div class="list-group-item row">
				<div class="col-md-3" style="font-size: 14px;">제목</div>
				<div class="col-md-9" style="font-size: 14px;">${vo.title }</div>
			</div>
			<div class="list-group-item row">
				<div class="col-md-3" style="font-size: 14px;">내용</div>
				<div class="col-md-9" style="font-size: 14px;">${vo.content }</div>
			</div>
			<div class="list-group-item row">
				<div class="col-md-3" style="font-size: 14px;">아이디</div>
				<div class="col-md-9" style="font-size: 14px;">${vo.id }</div>
			</div>
			<div class="list-group-item row">
				<div class="col-md-3" style="font-size: 14px;">작성일</div>
				<div class="col-md-9" style="font-size: 14px;"><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></div>
			</div>
		</div>
		<c:if test="${!empty login && login.gradeNo == 9}">
			
			<c:if test="${vo.id != login.id && login.gradeNo == 9}">
				<a class="btn btn-info pull-right" id="answerBtn" style="font-size: 14px;">답변</a>
			</c:if>
			<c:if test="${vo.id == login.id && login.gradeNo == 9}">
				<a class="btn btn-info pull-right" id="updateBtn" style="font-size: 14px;">수정</a>
				<a class="btn btn-info pull-right" id="deleteBtn" style="font-size: 14px;">삭제</a>
			</c:if>
		</c:if>
				<a class="btn btn-info pull-right" id="listBtn" style="font-size: 14px;">리스트</a>
		
</div>
</body>
</html>