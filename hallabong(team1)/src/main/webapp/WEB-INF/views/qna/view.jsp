<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 글 보기</title>
<style type="text/css">
.padding {
padding: 10px;
}
.showContent {
border-bottom-style: solid;
  border-bottom-width: 3px;
  border-bottom-color: #eee;
}
.Btn{
padding: 10px 0px 10px 10px;
}
.Btn1{
 margin-right: 1px;
 margin-left: 1px;
}
.Btn2{
margin-right: 1px;
 margin-left: 1px;
}
.Btn3{
margin-right: 1px;
 margin-left: 1px;
}
.Btn4{
margin-right: 1px;
 margin-left: 1px;
}
.Btn5{
margin-right: 1px;
 margin-left: 1px;
}
.Btn6{
margin-right: 1px;
 margin-left: 1px;
}
.Btn7{
margin-right: 1px;
 margin-left: 1px;
}
.Btn8{
margin-right: 1px;
 margin-left: 1px;
}
.Btn9{
margin-right: 1px;
 margin-left: 1px;
}
</style>
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
	        		    $("#deleteBtn").attr("href","delete.do?no=${vo.no}&perPageNum=${param.perPageNum}")
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
// $().ready(function () {
//     $("#updateBtn").click(function () {
//         Swal.fire({
//             title: '수정창으로 이동할까요?',
//             text: "",
//             icon: 'question',
//             showDenyButton: true,
//             confirmButtonColor: '#3085d6',
//             denyButtonColor: '#d33',
//         }).then((result) => {
//         	  if (result.isConfirmed) {
//         		    $("#updateBtn").attr("href","update.do?no=${vo.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}")
//         		    $("#updateBtn")[0].click()
//         		    Swal.fire('수정창으로 이동합니다.', '', 'success')
//         		  } else if (result.isDenied) { 
//         		    Swal.fire('수정창으로 이동 안 합니다.', '', 'success')
//         		  }
//         })
//     });
// });
//답변 수정으로 이동하기 ---------------------
$(this).ready(function () {
    $(".Btn3").click(function () {
    	var no = $(this).val();
    	var refNo = $(this).val();
    	var parentNo = $(this).val();
        Swal.fire({
            title: '답변 수정으로 이동할까요?',
            text: "",
            icon: 'question',
            showDenyButton: true,
            confirmButtonColor: '#3085d6',
            denyButtonColor: '#d33',
        }).then((result) => {
        	  if (result.isConfirmed) {
          		  var no = $(this).parent().find(".no1").text();
          		  var refNo = $(this).parent().find(".refNo1").text();
          		  var parentNo = $(this).parent().find(".parentNo1").text();
            	  alert(no);
            	  alert(refNo);
            	  alert(parentNo);
					location = "update.do?no="+ no
						+ "&refNo=" + refNo
						+ "&parentNo=" + parentNo
						+ "&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}";
      		   // $(".Btn3").attr("href","update.do?no=${qna.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}")
        		    $(".Btn3")[0].click()
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
        		    $("#answerBtn").attr("href","answer.do?no=${vo.no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}")
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
<c:forEach items="${list }" var="vo">
<c:if test="${vo.levNo == 0 && vo.parentNo == 1}">
<div class="list-group">
			<input type="hidden" name="parentNo" value="${vo.parentNo }">
			<div class="list-group-item row">
				<div class="col-md-3">번호</div>
				<div class="col-md-9">${vo.no }</div>
			</div>
			<div class="list-group-item row">
				<div class="col-md-3">제목</div>
				<div class="col-md-9">${vo.title }</div>
			</div>
			<div class="list-group-item row">
				<div class="col-md-3">내용</div>
				<div class="col-md-9">${vo.content }</div>
			</div>
			<div class="list-group-item row">
				<div class="col-md-3">아이디</div>
				<div class="col-md-9">${vo.id }</div>
			</div>
			<div class="list-group-item row">
				<div class="col-md-3">작성일</div>
				<div class="col-md-9"><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd"/></div>
			</div>
		</div>
</c:if>
</c:forEach>			
						<div class="padding">
					  	<i class="fa fa-comments"></i> 답변
					  	</div>
					  <c:forEach items="${list }" var="qna">
					  <c:if test="${qna.parentNo > 1 }">
<!-- 					  	<ul class="chat"> -->
				     	<li class="list-group-item row title">
				   			
<%-- 				   			<input type="hidden" name="refNo" class="refNo1" value="${qna.refNo }"> --%>
<%-- 				   			<input type="hidden" name="parentNo" class="parentNo1" value="${qna.parentNo }"> --%>
				     		<p class="row" style="padding: 2px 1px 3px 5px;"><strong>Q.</strong><c:out value=" ${qna.title }"/></p>
				     	</li>
				     	<li class="list-group-item row showContent"><p style="white-space: pre-line;">A. ${qna.content }</p>
				     	<p>답변자: ${qna.id }</p>
									<c:if test="${!empty login && login.gradeNo == 9}">
										<c:if test="${vo.id == login.id && login.gradeNo == 9}">
											<a class="btn btn-info pull-right Btn1" id="updateBtn" style="font-size: 14px;">수정</a>
											<a class="btn btn-info pull-right Btn2" id="deleteBtn" style="font-size: 14px;">삭제</a>
										</c:if>
										<a class="btn btn-info pull-right Btn3" id="updateBtn" style="font-size: 14px;">수정</a>
											<a class="btn btn-info pull-right Btn4" id="deleteBtn" style="font-size: 14px;">삭제</a>
									</c:if>
									<span class="no1">${qna.no }<input type="hidden" name="no" ></span>
				   			<span class="refNo1">${qna.refNo }<input type="hidden" name="refNo" ></span>
				   			<span class="parentNo1">${qna.parentNo }<input type="hidden" name="parentNo" ></span>
									</li>
									
<!-- 								</ul> -->
					  	</c:if>
					  	</c:forEach>
					  	<!-- /.chat -->
					  <!-- panel-body의 끝 -->
				  <!-- panel의 끝 -->
				  <div class="" id="footer_pagination">
				  </div>
			  <!-- col의 끝 -->
		
				<div class="Btn">
				<a class="btn btn-info pull-right Btn5" id="listBtn">리스트</a>
				<c:if test="${!empty login && login.gradeNo == 9}">

				<c:if test="${vo.id != login.id && login.gradeNo == 9}">
					<a class="btn btn-info pull-right Btn6" id="answerBtn" style="font-size: 14px;">답변</a>
				</c:if>
				<c:if test="${vo.id == login.id && login.gradeNo == 9}">
					<a class="btn btn-info pull-right Btn7" id="updateBtn" style="font-size: 14px;">수정</a>
					<a class="btn btn-info pull-right Btn8" id="deleteBtn" style="font-size: 14px;">삭제</a>
				</c:if>
					<a class="btn btn-info pull-right Btn8" id="updateBtn" style="font-size: 14px;">수정</a>
					<a class="btn btn-info pull-right Btn9" id="deleteBtn" style="font-size: 14px;">삭제</a>
				</c:if>
				</div>
</div>
</body>
</html>