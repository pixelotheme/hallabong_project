package com.hallabong.rentcarbooking.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Qualifier("rbmimpl")
public class RentCarBookingMailSendServiceImpl implements RentCarBookingMailSendService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Override
	//이메일 보낼 양식! 
	public String joinEmail(String email) throws Exception {
	String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
	String toMail = email;
	String title = "hallabong 제주여행 사이트 렌터카 예약 확인 메일입니다."; // 이메일 제목 
	String content = 
			"렌터카를 예약해주셔서 감사합니다" + 	//html 형식으로 작성 ! 
	        "<br><br>" + 
		    "마이페이지에서 확인해주세요" + 
		    "<br><br>"; //이메일 내용 삽입
	mailSend(setFrom, toMail, title, content);
	return email;
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) throws Exception { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);

	}
}
