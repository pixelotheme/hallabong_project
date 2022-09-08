package com.hallabong.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommanExceptionAdvice {
	
	//Exception 예외가 발생되면 가져와서 처리해 준다 
	@ExceptionHandler(Exception.class)
	public String except (Exception ex, Model model) {
		
		log.error("///////////////////////예외처리/////////////");
		log.error("* 에러 메세지 : " + ex.getMessage());
		
		//JSP 페이지로 예외를 전달하기 위해 model 에 담는다.
		model.addAttribute("exception" , ex);
		// model 출력
		log.error(model);
		
		// JSP 로 이동 
		return "error/error_404";
		
	}
	
//	//Exception 예외가 발생되면 가져와서 처리해 준다 
//		@ExceptionHandler(Exception.class)
//		public String except1(Exception ex, Model model) {
//			
//			log.error("///////////////////////예외처리/////////////");
//			log.error("* 에러 메세지 : " + ex.getMessage());
//			
//			//JSP 페이지로 예외를 전달하기 위해 model 에 담는다.
//			model.addAttribute("exception" , ex);
//			// model 출력
//			log.error(model);
//			
//			// JSP 로 이동 
//			return "error/error_404";
//	
//
//
// }
}
