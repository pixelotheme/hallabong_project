# hallabong_project

tomcat - 9.0<br>
java - 1.8<br>
oracle - 11g XE<br>
spring - 5.0.7.RELEASE<br>
servlet - 3.1.0<br>
mybatis - 3.4.6<br>
sts - 4.7.0.RELEASE<br>

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

https://blog.naver.com/hoan0418

1. 예약시 메일보내기 - rentcarboard.controller<br><br>
2. ajax 이용한 JSON 배열 형식 통신 - ajax.Controller <br><br>
3. 예약날짜 선택시 java Date 타입을 이용한 날짜 계산 - ajax.Controller, rentcarboard/view<br><br>
4. 예약시 정규표현식 - rentcarbooking/booking.jsp<br><br>
5. 업로드된 파일 서버 외부에 저장 - carfileupload.controller<br><br>
6. Mybatis를 통한 페이징,검색쿼리,selectKey 사용 - rentcarboard/mapper/RentCarBoardMapper.xml<br><br>


**root-context.xml, servlet-context.xml 은 개인정보가 포함되어 올리지 않음


![image](https://user-images.githubusercontent.com/59018532/190394549-0b96154e-8327-40ab-b9a5-3dc7dc26820d.png)
![image](https://user-images.githubusercontent.com/59018532/190396069-70088a48-b8cf-4ea9-ba88-dd8a77a4d161.png)
![image](https://user-images.githubusercontent.com/59018532/190398033-1acd283c-e242-4497-8f86-9f2c77e09b5a.png)


![20220915_203915](https://user-images.githubusercontent.com/59018532/190394345-8b89a8bf-3ec3-4333-8123-a7db4a0c43d5.png)


