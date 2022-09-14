package com.hallabong.rentcarbooking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hallabong.member.controller.SendMailController;
import com.hallabong.rentcarbooking.service.RentCarBookingMailSendService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/bookingMail")
public class SendBookingMailController {

	@Autowired
	@Qualifier("rbmimpl")
	private RentCarBookingMailSendService service;
	
	//이메일 인증
	@GetMapping("/mailCheck.do")
	@ResponseBody
	public String mailCheck(String email) throws Exception {
		System.out.println("예약시 메일발송");
		System.out.println("예약자 이메일 : " + email);
		log.info("email 넘긴다" + email);
		
		
		return service.joinEmail(email);
		
			
	}	
}
