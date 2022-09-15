<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link href='/resources/lib/fullcalendar/main.css' rel='stylesheet'>
<script defer src='/resources/lib/fullcalendar/main.js'></script>
<script defer src ="/resources/js/hotelbooking/fullcalendar.js"></script>
<!-- <script defer src ="/resources/js/hotelbooking/calendar.js"></script> -->

	   <div class="row service-item bg-white">
      <table class="table table-bordered table-hover ">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>방번호</th>
		        <th>예약번호</th>
		        <th>체크인</th>
		        <th>체크아웃</th>
		        <th>예약현황</th>
		      </tr>
		    </thead>
		    <tbody >
		      <tr class="dataRow chat"> 
<%-- 		        <td >${vo.ro_no }</td> --%>
<!-- 		        <td class="no">1</td> -->
<%-- 			        <td>${list.hbno }</td> --%>
<%-- 			        <td><fmt:formatDate value="${list.checkin}" pattern="yyyy-MM-dd" /></td> --%>
<%-- 			        <td><fmt:formatDate value="${list.checkout}" pattern="yyyy-MM-dd" /></td> --%>
<%-- 		       		<td>${list.booking_state }</td>  --%>
		      </tr>
		    </tbody>
		  </table>
		
		</div>
		<div id='calendar-container'>
    		<div id='calendar'></div>
 		 </div>  
		<div id="footer_pagination">
					  	</div>
					  <!-- panel-footer의 끝 : 페이지 네이션을 작성해서 넣는다.(JS) -->		  	
				 
 
          

