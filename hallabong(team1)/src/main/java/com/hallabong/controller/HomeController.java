package com.hallabong.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hallabong.business.service.BusinessService;
import com.hallabong.rentcarboard.service.RentCarBoardService;
import com.hallabong.rentcarboard.util.PageObjectCustom;
import com.webjjang.util.PageObject;

import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Setter(onMethod_ = @Autowired )
	private BusinessService businessServiceImpl;
	@Setter(onMethod_ = @Autowired )
	private RentCarBoardService rentCarBoardServiceImpl;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			PageObject pageObject, PageObjectCustom pageObjectt) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("pageObject", pageObject);
		model.addAttribute("pageObjectt", pageObjectt);
		model.addAttribute("bulist",businessServiceImpl.list(pageObject)) ;
		model.addAttribute("rentlist", rentCarBoardServiceImpl.list(pageObjectt));
		
		return "main";
	}



}
