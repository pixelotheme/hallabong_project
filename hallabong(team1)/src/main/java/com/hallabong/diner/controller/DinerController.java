package com.hallabong.diner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.hallabong.diner.service.DinerService;
import com.hallabong.diner.vo.DinerVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/diner")
@Log4j
public class DinerController {
	
	@Setter(onMethod_ = {@Autowired})
	@Qualifier("dinerServiceImpl")
	private DinerService service;
	
	// 리스트
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception {
		
		log.info("맛집 리스트");
		
		if(pageObject.getPerPageNum() == 10)
			pageObject.setPerPageNum(8);
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "diner/list";
	}
	
	
	// 보기
//	public String view(long no, int inc, Model model) throws Exception {
//		
//		log.info("맛집 게시판 보기");
//		
//		model.addAttribute("vo", service.view(no, inc));
//		
//		return 
//	}
//	
	// 등록 폼
	@GetMapping("/write.do")
	public String writeForm() throws Exception{

		log.info("맛집 게시판 등록폼");

		return "diner/write";
	}
	
	// 등록 처리
	@PostMapping("/write.do")
	public String write(DinerVO vo, int perPageNum) throws Exception {
		
		log.info("맛집 게시판 글 등록 처리 -------");
		
		service.write(vo);
		
		return "redirect:list.do?perPageNum=" + perPageNum;

	}
	

}
