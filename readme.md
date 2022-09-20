# hallabong_project

## 기술스택
- tomcat - 9.0<br>
- mybatis - 3.4.6<br>
- 형상관리 - svn <br>

- java - 1.8<br>
- oracle - 11g XE<br>
- spring - 5.0.7.RELEASE<br>
- javascript <br>
- jquery <br>
- bootstrap <br>

![download](https://user-images.githubusercontent.com/59018532/191150235-75c29cfd-ef0a-45b8-9e10-9e5e5c385453.jpg)
![download](https://user-images.githubusercontent.com/59018532/191150261-f4805794-4331-4d23-9de2-00910f0208b8.png)
![download](https://user-images.githubusercontent.com/59018532/191150281-939f3379-6f5a-4abd-afbf-18aa6e0ea15f.png)
![download](https://user-images.githubusercontent.com/59018532/191150085-16f2c097-1e44-422a-8290-8b32cc27baad.png)
![download](https://user-images.githubusercontent.com/59018532/191150115-c8f07835-1282-4328-85f1-a6e195864831.png)
![download](https://user-images.githubusercontent.com/59018532/191150482-f88414d9-3986-4519-b838-0036d3678020.png)


## 담당 내용 (렌터카게시판, 회사, 차종, 렌터카예약, 권한처리)
- com.hallabong.rentcarboard<br>
- com.hallabong.rentcarboard.ajax<br>
- com.hallabong.rentcarboard.carbasicinfo<br>
- com.hallabong.rentcarboard.carfileupload<br>
- com.hallabong.rentcarboard.carinsurance<br>
- com.hallabong.rentcarboard.caroption<br>
- com.hallabong.rentcarboard.conpanycars<br>
- com.hallabong.rentcarboard.rentcarcompany<br>
- com.hallabong.rentcarbooking<br>
- com.hallabong.util.intercepter<br>
- view/carbasicinfo/**.jsp<br>
- view/carinsurance/**.jsp<br>
- view/companycars/**.jsp<br>
- view/rentcarboard/**.jsp<br>
- view/rentcarbooking/**.jsp<br>
- view/rentcarcompany/**.jsp<br>

<br><br><br>기본적인 CRUD에 메일보내기, ajax 통신, 파일업로드, 정규표현식, interceptor를 사용하고 BootStrap을 사용하여 디자인을 했습니다 

<br><br>

## 특징적인 기능
- https://blog.naver.com/hoan0418

-  예약시 메일보내기 - rentcarboard.controller<br><br>
-  ajax 이용한 JSON 배열 형식 통신 - ajax.Controller, rentcarboard/rentCarBoardView.jsp <br><br>
-  예약날짜 선택시 java Date 타입을 이용한 날짜 계산(Ajax 사용) - ajax.Controller, rentcarboard/view<br><br>
-  예약시 정규표현식 - rentcarbooking/booking.jsp<br><br>
-  업로드된 파일 서버 외부에 저장 - carfileupload.controller<br><br>
-  Mybatis를 통한 페이징,검색쿼리,selectKey 사용 - rentcarboard/mapper/RentCarBoardMapper.xml<br><br>
-  interceptor를 사용한 권한설정 - com.hallabong.util.intercepter, root-context.xml <br><br>


## 구현
- 담당 db 테이블
<br>![image](https://user-images.githubusercontent.com/59018532/190394549-0b96154e-8327-40ab-b9a5-3dc7dc26820d.png)
- 렌터카보기 - 날짜 선택시 금액변동<br>
<br>![image](https://user-images.githubusercontent.com/59018532/190396069-70088a48-b8cf-4ea9-ba88-dd8a77a4d161.png)
<br>![image](https://user-images.githubusercontent.com/59018532/191150767-49850555-4a7b-4ebf-b4fd-18ed856f5e3d.png)
- 렌터카 예약시 메일발송<br>
<br>![image](https://user-images.githubusercontent.com/59018532/191149725-76c21a0b-31eb-404d-b5e6-745c6ebe5ad8.png)

<br>![image](https://user-images.githubusercontent.com/59018532/190398033-1acd283c-e242-4497-8f86-9f2c77e09b5a.png)


![20220915_203915](https://user-images.githubusercontent.com/59018532/190394345-8b89a8bf-3ec3-4333-8123-a7db4a0c43d5.png)


