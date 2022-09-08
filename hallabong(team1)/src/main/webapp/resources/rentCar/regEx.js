/**
 * 정규 표현식 저장
 */
 
 var reg_title = /^.{3,100}$/;
 var reg_title_msg = "3자 이상 100자 이내";
 var reg_content = /^(.|\n){3,670}$/;
 var reg_content_msg = "3자 이상 670자 이내";
 var reg_name_kr = /[가-힣]{2,10}/;
 var reg_name_kr_msg = "한글 2자 이상 10자 이내, 공백문자 제외";
 var reg_date = /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
 var reg_date_msg = "yyyy-mm-dd 형식"
 var reg_id = /^.{3,20}$/;
 var reg_id_msg = "3자 이상 20자 이내";
 var reg_pw = /^.{3,20}$/;
 var reg_pw_msg = "3자 이상 20자 이내";