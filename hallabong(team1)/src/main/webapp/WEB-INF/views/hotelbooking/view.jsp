<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔예약 상세보기</title>

<script type="text/javascript" src="/resources/hotelbooking/js/hbookingEvent.js"></script>
<script type="text/javascript">
 var page = "${param.page}";
 var perPageNum = "${param.perPageNum}";
 var key = "${param.key}";
 var word = "${param.word}";
 var hbno = "${vo.hbno }";
</script>

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
						                   <h2 class="mb-3">베니키아호텔 </h2>
						                   <h4 class="mb-4">싱글스탠다드룸</h4>
						               </div>
						              <table class="table table-borderless">
									      <tr>
									        <th style=" width:30%;">체크인-체크아웃</th>
									        <td>2022.09.05~2022.09.07</td>
									      </tr>
									      <tr>
									        <th>인원</th>
									        <td>3명</td>
									      </tr>
									      <tr>
									        <th>금액</th>
									        <td>90,000원</td>
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
<%-- 					 <c:forEach items="${list}" var="vo">  --%>
								<div class="bg-white p-4 row" >
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >성함</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <p class="h5 m-0" >${vo.name}</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >전화번호</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <p class="h5 m-0" >${vo.tel }</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-2">
                                        <h5 class="text-uppercase " >이메일</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <p class="h5 m-0" >${vo.email }</p>
                                    </div>
                                </div>
<%--                                 </c:forEach> --%>
							</div>
							<!--  col-lg-12  끝-->
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
				  <div class="row align-items-center" style="min-height: 60px;">
					 <div class="col-md-12">
						<div class="row">
							<div class="col-lg-12">
								<h5>사용자 정보</h5>
								<div class="bg-white p-4 row" >
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >성함</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <p class="h5 m-0" >${vo.userName }</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >전화번호</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <p class="h5 m-0" >${vo.userTel }</p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-2">
                                        <h5 class="text-uppercase " >이메일</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <p class="h5 m-0" >${vo.userEmail }</p>
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
				<!-- 예약자 정보 끝 -->
				<!-- 접수버튼 -->
				<div class="container pb-5">
				  <div class="text-right">
                     <button class="btn btn-primary py-3 px-4" type="submit" id="updateBtn">예약수정</button>
                     <button class="btn btn-primary py-3 px-4" type="submit" id="deleteBtn">예약취소</button>
                     <button class="btn btn-primary py-3 px-4" type="submit" id="cancelBtn">뒤로가기</button>
                 </div>
                </div>
                <!-- 접수버튼끝 -->
				
	</div>

</body>
</html>