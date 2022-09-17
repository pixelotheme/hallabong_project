<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link href='/resources/lib/fullcalendar/main.css' rel='stylesheet'>
<script defer src='/resources/lib/fullcalendar/main.js'></script>
<!-- <script defer src ="/resources/js/hotelbooking/fullcalendar.js"></script> -->
<!-- <script defer src ="/resources/js/hotelbooking/calendar.js"></script> -->

	   <div class="row service-item bg-white">
      <table class="table table-bordered table-hover ">
		    <thead>
		      <tr class="text-center">
		        <th class="text-center">번호</th>
		        <th>방번호</th>
		        <th>예약번호</th>
		        <th>체크인</th>
		        <th>체크아웃</th>
		        <th>예약현황</th>
		      </tr>
		    </thead>
		    <tbody  class="chat">
		    </tbody>
		  </table>
		
		</div>
		<div id='calendar-container'>
    		<div id='calendar'>
    		</div>
 		 </div>  
				 
 
          

