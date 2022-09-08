<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>FAQ</title>
<!-- a태그 강제 클릭 이벤트를 하기 위한 라이브러리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- alert창 디자인 바꾸기 위한 라이브러리 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">

 .showContent{ 
 	display: none; 
 }
.showContent{
background-color: #cceeff;
}
li {
list-style-type: none;
}
.no{
	display: none;
}

</style>
<script type="text/javascript">
  $(document).ready(function() {
	$("li.title").click(function(){
			$(this).next().toggle("fast");
	});
});
//수정으로 이동하기 ---------------------
  $(this).ready(function () {
      $(".updateBtn").click(function () {
    	  var no = $(this).val();
          Swal.fire({
              title: '수정창으로 이동할까요?',
              text: "",
              icon: 'question',
              showDenyButton: true,
              confirmButtonColor: '#3085d6',
              denyButtonColor: '#d33',
          }).then((result) => {
          	  if (result.isConfirmed) {

          		  var no = $(this).parent().find(".no").text();
          		  location = "update.do?no="+no;
          		//    $(".updateBtn").attr("href","update.do?no=${vo.no }")
          		    $(".updateBtn")[0].click()
          		    Swal.fire('수정창으로 이동합니다.', '', 'success')
          		  } else if (result.isDenied) { 
          		    Swal.fire('수정창으로 이동 안 합니다.', '', 'success')
          		  }
          })
      });
  });
//등록 창 이동 ---------------------
  $().ready(function () {
      $("#write").click(function () {
          Swal.fire({
              title: '등록 창으로 이동할까요?',
              text: "",
              icon: 'question',
              showDenyButton: true,
              confirmButtonColor: '#3085d6',
              denyButtonColor: '#d33',
          }).then((result) => {
          	  if (result.isConfirmed) {
          		    $("#write").attr("href","write.do")
          		    $("#write")[0].click()
          		    Swal.fire('등록 창으로 이동합니다.', '', 'success')
          		  } else if (result.isDenied) { 
          		    Swal.fire('등록 창으로 이동 안 합니다.', '', 'success')
          		  }
          })
      });
  });
</script>
</head>
<body>
<div class="container">
	<h1 style="font-size: 35px;">FAQ</h1>
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
		<c:forEach items="${list }" var="vo">
		     	<div class="divClass">
				     <ul class="list-group">
				     	<li class="list-group-item row title">
				   			<span class="no">${vo.no }<input type="hidden" name="no"></span>
				     	<a class="btn btn-info updateBtn" style="font-size: 14px;">수정</a>
				     		<strong style="font-size: 14px;">Q. ${vo.title }</strong>
				     		<i class='fas fa-angle-down pull-right down'></i>
				     	</li>
				     	<li class="list-group-item row showContent" style="font-size: 14px;"><p style="white-space: pre-line;">A. ${vo.content }</p>
				     	<input type="hidden" name="id" value="${vo.id }"></li>
				     </ul>
			</div>
		</c:forEach>
		<div class="row">
			<div class="col-md-3 pull-light">
				<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
			</div>
			<div class="col-md-9 pull-right" style="padding: 20px;">
				<a class="btn btn-info pull-right" id="write" style="font-size: 14px;">등록</a>
		    </div>
		</div>
</div>
</body>
</html>