<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/hotelbooking/js/hbookingEvent.js"></script>
<title>호텔예약 수정하기</title>
</head>
<body>


    <!-- Header Start -->
    <div class="container-fluid page-header">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                <h3 class="display-4 text-white text-uppercase">RESERVATION</h3>
                <div class="d-inline-flex text-white">
                    <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                    <i class="fa fa-angle-double-right pt-1 px-3"></i>
                    <p class="m-0 text-uppercase">reservation</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
    	<form method="post">
		<input name="page" value="${param.page }" type="hidden">
		<input name="perPageNum" value="${param.perPageNum }" type="hidden">
    <div class="container-fluid booking mt-5 pb-5">
        <div class="container pb-5">
            <div class="bg-light shadow" style="padding: 30px;">
                <div class="row align-items-center" style="min-height: 60px;">
                    <div class="col-md-10">
						<div class="row">
						     <div class="col-lg-7">
						       <div class="blog-item">
						           <div class="position-relative">
						               <img class="img-fluid w-100" src="/resources/img/blog-1.jpg" alt="">
						               <div class="blog-date">
						               		<small class="text-white text-uppercase">예약번호</small>
						                   <h6 class="font-weight-bold mb-n1">${vo.hbno }</h6>
						               </div>
						           </div>
						      
						       </div>
						     </div> 
							<!--  col-lg-7끝 -->
							 <div class="col-lg-5">
 									<div class="bg-white p-4">
						               <div class="d-flex mb-2">
						                   <h2 class="mb-3">제주신라호텔 </h2>
						                   <h4 class="mb-4">디럭스</h4>
						               </div>
						              <table class="table table-borderless">
									      <tr>
									        <th style=" width:30%;">체크인-체크아웃</th>
									        <td>2022.09.05~2022.09.07</td>
									      </tr>
									      <tr>
									        <th>인원</th>
									        <td>2명</td>
									      </tr>
									      <tr>
									        <th>금액</th>
									        <td>1,250,000원</td>
									      </tr>
									  </table>
						           </div>
						     </div>
						     <!--  col-lg-5끝 -->
						 </div>
						<!-- row의 끝 -->

  					</div>
   				</div>
			</div>
			<!-- bg-light shadow 끝 -->
	
		</div>
		
		<!-- container pb-5끝 -->
												<!-- 예약자 정보 -->
			<div class="container pb-5">
	          <div class="bg-light shadow" style="padding: 30px;">
				  <div class="row align-items-center" style="min-height: 60px;">
					 <div class="col-md-12">
						<div class="row">
							<div class="col-lg-12">
								<h5>예약자 정보</h5>
								<div class="bg-white p-4 row" >
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >성함</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <p class="h5 m-0" >라이언</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >전화번호</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <p class="h5 m-0" >010-1111-2222</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-2">
                                        <h5 class="text-uppercase " >이메일</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <p class="h5 m-0" >lo@naver.com</p>
                                    </div>
                                </div>
							</div>
						</div>
						</div>
						</div>
						<!-- row align-items-center 끝 -->
						</div>
					<!-- bg-light shadow 끝 -->
				</div>
				<!-- 예약자 정보 끝 -->
				
				<!-- 사용자정보 -->
			<div class="container pb-5">
	          <div class="bg-light shadow" style="padding: 30px;">
				  <div class="row align-items-center" style="min-height: 30px;">
					 <div class="col-md-12">
						<div class="row">
							<div class="col-lg-12">
								<h5>사용자 정보</h5>
								<div class="bg-white p-4 row" >
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >성함</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <input type="text" class="form-control p-4" id="userName" 
                                    	name="userName" value="${vo.userName }" >
                                    <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >전화번호</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <input type="text" class="form-control p-4" id="userTel" 
                                    	name="userTel" value="${vo.userTel }" 	>
                                    <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-2">
                                        <h5 class="text-uppercase " >이메일</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <input type="text" class="form-control p-4" id="userEamil" 
                                    	name="userEmail" value="${vo.userEmail }" 	>
                                    <p class="help-block text-danger"></p>
                                    </div>
                                </div>
							</div>
						</div>
						</div>
						</div>
						<!-- row align-items-center 끝 -->
						</div>
					<!-- bg-light shadow 끝 -->
				</div>
				<!-- 사용자 정보 끝 -->
				
							<!-- 결제정보 -->
			<div class="container pb-5">
	          <div class="bg-light shadow" style="padding: 30px;">
				  <div class="row align-items-center" style="min-height: 60px;">
					 <div class="col-md-12">
						<div class="row">
							<div class="col-lg-12">
								<h5>결제 정보</h5>
								<div class="bg-white p-4 row" >
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >결제방법</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <p class="h5 m-0" >${vo.payOption }</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >결제종류</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <p class="h5 m-0" >${vo.payType }</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >결제금</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <p class="h5 m-0" >90,000원</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >결제일</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <p class="h5 m-0" ><fmt:formatDate value="${vo.payDay}" pattern="yyyy-MM-dd"/></p>
                                    </div>
                                </div>
							</div>
						</div>
						</div>
						</div>
						<!-- row align-items-center 끝 -->
						</div>
					<!-- bg-light shadow 끝 -->
				</div>
				<!-- 결제정보 끝 -->
				
								<!-- 수정완료버튼 -->
				<div class="container pb-5">
				  <div class="text-right">
                     <button class="btn btn-default">수정</button>
						<button type="reset" class="btn btn-default">새로입력</button>
						<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
                 </div>
                </div>
                <!-- 수정완료끝 -->
				
	</div>
</form>
</body>
</html>