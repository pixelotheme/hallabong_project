<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!-- 댓글의 시작 -->
            <div class="row">
            	<div class = "col-lg-12">
	            	<div class="panel panel-default">
					  <div class="panel-heading">
					  	<i class="fa fa-comments fa-fw"></i> 리뷰 목록
					  		<c:if test="${!empty login.id }">
					  	<button id="addReplyBtn" class="btn btn-success btn-xs pull-right">리뷰 등록</button>
					  	</c:if>
					  </div>
					  <div class="panel-body">
					  	<ul class="chat">
					  		<!-- ajax로 데이터를 가져와서 chat에 empty()를 이용해서 비운 다음 append로 추가시킨다. -->
					  	</ul>
					  	<!-- /.chat -->
					  </div>
					  <!-- panel-body의 끝 -->
					  <div class="panel-footer" id="footer_pagination">
					  </div>
					  <!-- panel-footer의 끝 : 페이지 네이션을 작성해서 넣는다.(JS) -->
					</div>
				  <!-- panel의 끝 -->
            	</div>
			  <!-- col의 끝 -->
            </div>
            <!-- /.row 댓글의 끝-->
          
<!-- 댓글 등록 수정 삭제를 위한 모달 창 만들기 : 맨 처음에는 안보이게 한다. -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">리뷰 등록창</h4>
      </div>
      <div class="modal-body">
      	<div class="form-group">
      		<label>리뷰</label>
      		<textarea style = "resize: none" rows="3" name="reply" class="form-control" id="modalReply"
      		></textarea>
      	</div>
      	<div class="form-group">
      		<label>작성자</label>
      		<input name = "id" class="form-control" id="modalId" value="${login.id }" readonly = "readonly">
      	</div>
      

</div>


      <div class="modal-footer">
		<c:if test="${!empty login && vo.id == login.id}">
      	<button class="btn btn-warning" id="modalUpdateBtn">수정</button>
      	<button class="btn btn-danger" id="modalDeleteBtn">삭제</button>
      </c:if>
      	<button class="btn btn-success" id="modalRegisterBtn">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
<!-- 댓글처리를 위한 모달의 끝 -->

    