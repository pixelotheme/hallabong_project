# hallabong_project

<h5>담당 내용 (렌터카게시판, 회사, 차종, 렌터카예약, 권한처리)</h5>
com.hallabong.rentcarboard<br>
com.hallabong.rentcarboard.ajax<br>
com.hallabong.rentcarboard.carbasicinfo<br>
com.hallabong.rentcarboard.carfileupload<br>
com.hallabong.rentcarboard.carinsurance<br>
com.hallabong.rentcarboard.caroption<br>
com.hallabong.rentcarboard.conpanycars<br>
com.hallabong.rentcarboard.rentcarcompany<br>
com.hallabong.rentcarbooking<br>
com.hallabong.util.intercepter<br>
- view/carbasicinfo/**.jsp<br>
- view/carinsurance/**.jsp<br>
- view/companycars/**.jsp<br>
- view/rentcarboard/**.jsp<br>
- view/rentcarbooking/**.jsp<br>
- view/rentcarcompany/**.jsp<br>

<h5>특징적인 기능</h5>

예약시 메일보내기 - rentcarboard.controller<br>
ajax 이용한 JSON 배열 형식 통신 - ajax.Controller, <br>
java Date 타입을 이용한 날짜 계산 - ajax.Controller, rentcarboard/view<br>
예약시 정규표현식 - rentcarbooking/booking.jsp<br>
업로드된 파일 서버 외부에 저장 - carfileupload.controller<br>
Mybatis를 통한 페이징,검색쿼리,selectKey 사용 - rentcarboard/mapper/RentCarBoardMapper.xml<br>


**root-context.xml, servlet-context.xml 은 개인정보가 포함되어 올리지 않음
