<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실  리스트</title>
<style type="text/css">
.dataRow:hover {
	background : #eee;
	cursor:pointer;

}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript">
	$(function(){
		$(".dataRow").on("click", function(){
			// alert("보기로 이동");
				var ro_no = $(this).data("ro_no");
					location = "view.do?ro_no=" + ro_no + "&page=${pageObject.page}"
 							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}"
				});

			var key = "${pageObject.key}";
			if(!key) key = "rkn";
			$("#key").val(key);

	});
</script>
</head>
<body>
	<div class="container">
		<div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">HOTEL LIST</h6>
            </div>
		<div class="row">
			<c:forEach items="${list }" var="vo" varStatus="vs">
				<!--  이미지 데이터 한개 표시 시작 -->
				<div class="col-md-3">
					<div class="thumbnail dataRow" data-ro_no = "${vo.ro_no }">
						<img src="${vo.fileName }" alt="${vo.ro_name}" style="width: 100%">
						<div class="caption">
							<div>${vo.ro_name }</div>
							<div>${vo.ro_info }</div>
							<br>
						</div>

					</div>
				</div>
				<!-- 이미지 데이터 한개 표시 끝 -->
				<c:if test="${vs.count % 4 == 0 && vs.count != pageObject.perPageNum }">
					${"</div>" }
					${"<div class='row'>" }
		</c:if>
			</c:forEach>
		</div>
		<!--  이미지 한줄 끝 -->
		<div>
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>

			<a href="write.do?perPageNum=${pageObject.perPageNum }&no=${param.no}"
				class="btn btn-default">등록</a>
		</div>



</body>
</html>