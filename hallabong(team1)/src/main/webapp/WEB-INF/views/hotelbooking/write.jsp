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
    <h2>호텔예약등록</h2>
    <div class="container-fluid booking mt-5 pb-5">
        <div class="container pb-5">
            <div class="bg-light shadow" style="padding: 30px;">
                <div class="row align-items-center" style="min-height: 60px;">
                    <div class="col-md-10">
						<div class="row">
						     <div class="col-lg-7">
						       <div class="blog-item">
						           <div class="position-relative">
						               <img class="img-fluid w-100" src="/resources/img/blog-1.jpg" >
<!-- 						               <div class="blog-date"> -->
<!-- 						               		<small class="text-white text-uppercase">호텔번호</small> -->
<%-- 						                   <h6 class="font-weight-bold mb-n1">${vo.hbno }</h6> --%>
<!-- 						               </div> -->
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
				  <div class="row align-items-center" style="min-height: 30px;">
					 <div class="col-md-12">
						<div class="row">
							<div class="col-lg-12">
								<h5>예약자 정보</h5>
								<div class="bg-white p-4 row" >
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >성함</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <p class="h5 m-0" >${vo.getName }</p>
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
                                    <input type="text" class="form-control p-4" id="name" placeholder="Your Name"
                                        required="required" data-validation-required-message="Please enter your name" />
                                    <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-1">
                                        <h5 class="text-uppercase " >전화번호</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <input type="text" class="form-control p-4" id="name" placeholder="Your Name"
                                        required="required" data-validation-required-message="Please enter your name" />
                                    <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-2">
                                        <h5 class="text-uppercase " >이메일</h5>
                                    </div>
                                    <div class="col-sm-3">
                                    <input type="text" class="form-control p-4" id="name" placeholder="Your Name"
                                        required="required" data-validation-required-message="Please enter your name" />
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
				
				<!-- 이용약관 -->
				<div class="container pb-5">
					
					<div style="overflow: scroll; width: 100%; height: 150px; padding: 10px; background:white;">
						
						<p> <p class="ls2 lh6 bs5 ts4"><em class="emphasis">
						< 한라봉 >('com.hallabong'이하 'hallabong')</em>은(는) 
						「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 
						하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.</p>
						<p class="ls2"></br><p class='sub_p mgt30'>
						<strong>제1조(개인정보의 처리목적)</br></br>
						< 한라봉 >(이)가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.</strong></p>
						<ul class='list_indent2 mgt10'>
						<li class='tt'><b>1. 개인정보 파일명 : 한라봉</b></li>
						<li>개인정보의  처리목적 : 검색</li><li>수집방법 : 홈페이지</li>
						<li>보유근거 : 홈페이지</li><li>보유기간 : 지체없이 파기</li>
						<li>관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년</li>
						</ul><br/><br/>
						<p class="lh6 bs4"><strong>제2조(개인정보 영향평가 수행결과)</strong></p>
						<p class="ls2"><br/><br/></p></br></br><p class='lh6 bs4'>
						<strong>제3조(개인정보의 제3자 제공에 관한 사항)</strong></br></br>
						 ① <em class="emphasis">< 한라봉 >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 
						 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>
						 <p class="sub_p mgt10">②  <span class="colorLightBlue">< 한라봉 ></span>은(는) 
						 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</p>
						 <ul class="list_indent2 mgt10">
						 <li class="tt">1. < 한라봉 ></li>
						 <li>개인정보를 제공받는 자 : 한라봉</li>
						 <li>제공받는 자의 개인정보 이용목적 : 접속 IP 정보</li>
						 <li>제공받는 자의 보유.이용기간: 지체없이 파기</li>
						 </ul></br></br>
						 <p class='lh6 bs4'><strong>제4조(개인정보처리의 위탁에 관한 사항)</strong></br></br>
						  ① <em class="emphasis">< 한라봉 ></em>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보
						   처리업무를 위탁하고 있습니다.</p><p class='sub_p mgt10'>
						   ②  <span class='colorLightBlue'>< 한라봉 ></span>은(는) 위탁계약 체결시
						    「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 
						    재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고,
						     수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</p><p class='sub_p mgt10'>
						     ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>
						 </br></br><p class='lh6 bs4'><strong>제5조(개인정보의 파기절차 및 파기방법)<em class="emphasis"></strong></p>
						 <p class='ls2'></br>
						 ① < 한라봉 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이
						  해당 개인정보를 파기합니다.</br></br>
						② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 
						보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</br>
						1. 법령 근거 :</br>2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜</br></br>
						③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.</br>1. 파기절차</br> < 한라봉 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, 
						< 한라봉 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</br></p>
						<p class='sub_p mgt10'>2. 파기방법</p>
						<p class='sub_p'>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다</p><br/><br/>
						<p class="lh6 bs4"><strong>제6조(정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)</strong></p>
						<p class="ls2"><br/><br/>① 정보주체는 한라봉에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
						</p>
						<p class='sub_p'>② 제1항에 따른 권리 행사는한라봉에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 
						모사전송(FAX) 등을 통하여 하실 수 있으며 한라봉은(는) 이에 대해 지체 없이 조치하겠습니다.</p>
						<p class='sub_p'>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.
						이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p>
						<p class='sub_p'>④ 개인정보 열람 및 처리정지 요구는  「개인정보 보호법」  제35조 제4항, 제37조 제2항에 의하여 
						정보주체의 권리가 제한 될 수 있습니다.</p><p class='sub_p'>
						⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</p>
						<p class='sub_p'>⑥ 한라봉은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 
						열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</p></br></br><p class='lh6 bs4'>
						<strong>제7조(개인정보의 안전성 확보조치에 관한 사항)<em class="emphasis"></br></br>
						< 한라봉 ></em>은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.</strong></p>
						<p class='sub_p mgt10'>1. 정기적인 자체 감사 실시</br> 
						개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.</br></br>
						2. 개인정보 취급 직원의 최소화 및 교육</br> 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 
						개인정보를 관리하는 대책을 시행하고 있습니다.</br></br>3. 내부관리계획의 수립 및 시행</br> 
						개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</br></br>4. 해킹 등에 대비한 기술적 대책</br> 
						<<em class="emphasis">한라봉</em>>('<em class="emphasis">hallabong</em>')은 해킹이나 컴퓨터 바이러스 
						등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 
						통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</br></br>
						5. 개인정보의 암호화</br> 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 
						데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</br></br>
						6. 접속기록의 보관 및 위변조 방지</br> 개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 
						5만명 이상의 정보주체에 관하여 개인정보를 추가하거나, 고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 
						보관, 관리하고 있습니다.<br/>또한, 접속기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.</br></br>
						7. 개인정보에 대한 접근 제한</br> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 
						개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</br>
						</br>8. 문서보안을 위한 잠금장치 사용</br> 개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 
						안전한 장소에 보관하고 있습니다.</br></br>
						9. 비인가자에 대한 출입 통제</br> 
						개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</br></br></p>
						</br></br><p class="lh6 bs4"><strong>제8조(개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)</strong>
						</p><p class="ls2"><br/><br/>한라봉 은(는) 
						정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.</br></br>
						<p class='lh6 bs4'><strong>제9조(가명정보를 처리하는 경우 가명정보 처리에 관한 사항)<em class="emphasis"></br></br>
						< 한라봉 > 은(는) 다음과 같은 목적으로 가명정보를 처리하고 있습니다.</p>
						<p class='sub_p'></p><p class='sub_p'>▶ 가명정보의 처리 목적</p><p class='sub_p'>- 직접작성 가능합니다. </p>
						<p class='sub_p'></p><p class='sub_p'>▶ 가명정보의 처리 및 보유기간</p>
						<p class='sub_p'>- 직접작성 가능합니다. </p><p class='sub_p'></p>
						<p class='sub_p'>▶ 가명정보의 제3자 제공에 관한 사항(해당되는 경우에만 작성)</p>
						<p class='sub_p'>- 직접작성 가능합니다. </p>
						<p class='sub_p'></p><p class='sub_p'>▶ 가명정보 처리의 위탁에 관한 사항(해당되는 경우에만 작성)</p>
						<p class='sub_p'>- 직접작성 가능합니다. </p><p class='sub_p'></p>
						<p class='sub_p'>▶ 가명처리하는 개인정보의 항목</p><p class='sub_p'>- 직접작성 가능합니다. </p>
						<p class='sub_p'></p>
						<p class='sub_p'>▶ 법 제28조의4(가명정보에 대한 안전조치 의무 등)에 따른 가명정보의 안전성 확보조치에 관한 사항</p>
						<p class='sub_p'>- 직접작성 가능합니다. </p><p class='sub_p'></p>
						<p class='sub_p'></p><p class='sub_p mgt30'><strong>제10조 (개인정보 보호책임자에 관한 사항) </strong></p>
						<p class='sub_p mgt10'> ①  <span class='colorLightBlue'>한라봉</span> 
						은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 
						위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p>
						<ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 보호책임자 </li><li>성명 :성유진</li>
						<li>직책 :성유진</li><li>직급 :성유진</li><li>연락처 :01094674916, supiaeugene@nate.com, </li></ul>
						<p class='sub_p'>※ 개인정보 보호 담당부서로 연결됩니다.<p/> 
						<ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 보호 담당부서</li>
						<li>부서명 :</li><li>담당자 :</li><li>연락처 :, , </li></ul>
						<p class='sub_p'>② 정보주체께서는 한라봉 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 
						불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 한라봉 은(는) 정보주체의 
						문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p>
						<p class='sub_p mgt30'><strong>제11조(개인정보의 열람청구를 접수·처리하는 부서)</br> 
						정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.<br/>< 한라봉 ></span>
						은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다. </strong></p>
						<ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 열람청구 접수·처리 부서 </li>
						<li>부서명 : 한라봉</li><li>담당자 : 성유진</li><li>연락처 : 01094674916, , </li></ul></br></br>
						<p class='lh6 bs4'><strong>제12조(정보주체의 권익침해에 대한 구제방법)<em class="emphasis"></em></strong></p>
						<br/><br/>정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 
						한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 
						상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br/><br/>
						
						  1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)<br/>
						
						  2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)<br/>
						
						  3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br/>
						
						  4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)<br/><br/>
						
						
						
						「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 
						의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 
						행정심판을 청구할 수 있습니다.<br/><br/>
						
						
						
						※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.</br></br>
						<p class='lh6 bs4'><strong>제13조(영상정보처리기기 운영·관리에 관한 사항)</br>①  <em class='emphasis'>< 한라봉 >
						</em>은(는) 아래와 같이 영상정보처리기기를 설치·운영하고 있습니다.</strong></p><p class='sub_p mgt30'>1.영상정보처리기기 설치근거·목적 :
						 <span class='colorLightBlue'>< 한라봉 ></span>의 </p><ul class='list_indent2 mgt10'>
						 <li class='tt'>2.설치 대수, 설치 위치, 촬영 범위 :</li><li>설치대수 : 2 대</li><li>설치위치 : 성유진</li>
						 <li>촬영범위 : 성유진</li></ul><p class='sub_p mgt10'>3.관리책임자, 담당부서 및 영상정보에 대한 접근권한자 : 성유진</p>
						 <ul class='list_indent2 mgt10'><li class='tt'>4.영상정보 촬영시간, 보관기간, 보관장소, 처리방법 </li>
						 <li>촬영시간 :  시간</li><li>보관기간 : 촬영시부터 </li><li>보관장소 및 처리방법 : </li></ul>
						 <p class='sub_p mgt10'>5.영상정보 확인 방법 및 장소 : </p><p class='sub_p mgt10'>
						 6.정보주체의 영상정보 열람 등 요구에 대한 조치 : 개인영상정보 열람.존재확인 청구서로 신청하여야 하며, 
						 정보주체 자신이 촬영된 경우 또는 명백히 정보주체의 생명.신체.재산 이익을 위해 필요한 경우에 한해 열람을 허용함</p>
						 <p class='sub_p mgt10'>7.영상정보 보호를 위한 기술적.관리적.물리적 조치 : </p></br></br><p class='lh6 bs4'>
						 <strong>제14조(개인정보 처리방침 변경)<em class="emphasis"></em></strong></p><br/></p><p class='sub_p'>
						 ① 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.</p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>
						 ② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다. </p><p class='sub_p'></p>
						 <p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭) </p><p class='sub_p'></p>
						 <p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭) </p><p class='sub_p'></p>
						 <p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭)</p></p>
					<!-- 스크롤 끝 -->
					
					</div>
					<form style="heigth:20px;">
					  <div class="custom-control custom-radio custom-control-inline">
					    <input type="radio" class="custom-control-input" id="customRadio" name="example" value="customEx">
					    <label class="custom-control-label" for="customRadio">동의합니다.</label>
					  </div>
					  <div class="custom-control custom-radio custom-control-inline">
					    <input type="radio" class="custom-control-input" id="customRadio2" name="example" value="customEx">
					    <label class="custom-control-label" for="customRadio2">동의하지 않습니다.</label>
					  </div>
					</form>
					</div>
				<!-- 이용약관 끝 -->
				
				<!-- 결제정보 -->
			<div class="container pb-5">
	          <div class="bg-light shadow" style="padding: 30px;">
				  <div class="row align-items-center" style="min-height: 30px;">
					 <div class="col-md-12">
						<div class="row">
							<div class="col-lg-12">
								<h5>결제 정보</h5>
								<div class="bg-white p-4 row" >
                                    <div class="d-flex mb-2 col-sm-2">
                                        <h5 class="text-uppercase " >결제방법</h5>
                                    </div>
                                    <div class="col-sm-2">
	                                    <select class="custom-select px-4" style="height: 47px;">
	                                        <option selected="">신용카드</option>
	                                        <option value="2">무통장입금</option>
	                                    </select>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-2">
                                        <h5 class="text-uppercase " >종류</h5>
                                    </div>
                                    <div class="col-sm-2">
                                   		<select class="custom-select px-4" style="height: 47px;">
	                                        <option selected="">국민카드</option>
	                                        <option value="1">롯데카드</option>
	                                        <option value="1">현대카드</option>
	                                        <option value="1">삼성카드</option>
	                                        <option value="1">기타</option>
	                                    </select>
                                   		<select class="custom-select px-4" style="height: 47px;">
	                                        <option selected="">국민은행</option>
	                                        <option value="2">우리은행</option>
	                                        <option value="2">농협은행</option>
	                                        <option value="2">신한은행</option>
	                                    </select>
                                    </div>
                                    <div class="d-flex mb-2 col-sm-2">
                                        <h5 class="text-uppercase " >승인번호</h5>
                                    </div>
                                    <div class="col-sm-2">
                                    <input type="text" class="form-control p-4" id="name" placeholder="Your Name"
                                        required="required" data-validation-required-message="Please enter your name" />
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
				
				<!-- 결제정보끝 -->
				<div class="container pb-5">
				  <div class="text-right">
                     <button class="btn btn-primary py-3 px-4" type="submit" id="writeButton">예약접수</button>
                 </div>
                </div>
	</div>

</body>
</html>