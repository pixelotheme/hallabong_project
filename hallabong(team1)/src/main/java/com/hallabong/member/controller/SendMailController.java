package com.hallabong.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hallabong.member.service.MailSendService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mail")
public class SendMailController {
	
	@Autowired
	private MailSendService mailService;
	
	
	//이메일 인증
	@GetMapping("/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		log.info("email 넘긴다" + email);
		
		
		return mailService.joinEmail(email);
		
			
	}

}
