<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔예약 리스트</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->

<script type="text/javascript">
 var page = "${pageObject.page}";
 var perPageNum = "${pageObject.perPageNum}";
 var key = "${pageObject.key}";
 var word = "${pageObject.word}";

</script>

<script type="text/javascript" src="/resources/hotelbooking/js/hbookingEvent.js"></script>

</head>
<body>

   <!-- Service Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
        <h2>호텔예약리스트</h2>
        
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">HOTEL BOOKING</h6>
                <h1>나의 예약 리스트</h1>
            </div>
     
     <div class="row service-item bg-white">
      <table class="table table-bordered table-hover ">
		    <thead>
		      <tr>
		        <th>예약번호</th>
		        <th>호텔</th>
		        <th>인원수</th>
		        <th>체크인/체크아웃</th>
		        <th>예약현황</th>
		        <th>아이디</th>
		      </tr>
		    </thead>
		   <c:forEach items="${list }" var="vo">
		    <tbody >
		      <tr class="dataRow"> 
		        <td class="hbno">${vo.hbno }</td>
		        <td>제주신라호텔-디럭스</td>
		        <td>3명</td>
		        <td>2022.09.05~2022.09.08</td>
		        <td>${vo.progress }
		        <img class="img-fluid mx-auto"  
		        src="/resources/img/hotelbooking/check.png" style="width: 30px; height: 30px;"> 
		        </td> 
		        <td>${vo.id }</td> 
		      </tr>
		    </tbody>
		    </c:forEach>
		  </table>
		 
		  </div>
      </div> 
      <div><a href="write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-default">등록</a></div>       
    </div>
    <!-- Service End -->


</body>
</html>