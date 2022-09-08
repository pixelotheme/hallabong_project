package com.hallabong.faq.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hallabong.faq.service.FaqService;
import com.hallabong.faq.vo.FaqVO;
import com.hallabong.member.vo.LoginVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/faq")
@Log4j
public class FaqController {

	@Autowired
	@Qualifier("FaqServiceImpl")
	private FaqService service;
	
	// 리스트&보기
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Integer no, Model model) throws Exception {
		
		// 리스트
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		// 보기
		FaqVO vo = service.view(no);
		
		model.addAttribute("vo", vo);
		
		Thread.sleep(1000);
		return "faq/list";
		
	}
	
	// 등록 폼
	@GetMapping("/write.do")
	public String writeForm() throws Exception {
		log.info("이미지 게시판 등록 폼");
		Thread.sleep(1000);
		return "faq/write";
	}
	
	// 등록 처리
	@PostMapping("/write.do")
	public String write(FaqVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		log.info("FAQ 게시판 등록 처리");
		
		// id는 session에서
		String id = ((LoginVO)session.getAttribute("login")).getId();
		vo.setId(id);
		
		service.write(vo);
		
		rttr.addFlashAttribute("write", "write success : bno - " + vo.getNo());

		
		Thread.sleep(1000);
		return "redirect:list.do";
	}
	
	// 수정 Form
	@GetMapping("/update.do")
	public String updateForm(Integer no, Model model) throws Exception {
		
		log.info("FAQ 수정폼");
		
		model.addAttribute("vo", service.view(no));
		
		Thread.sleep(1000);
		return "faq/update";
	}
	
	// 수정 처리
	@PostMapping("/update.do")
	public String update(FaqVO vo) throws Exception {
		log.info("FAQ 게시판 수정 처리");
		
		service.update(vo);
		
		Thread.sleep(1000);
		return "redirect:list.do";
	}
	
	// 삭제
	@GetMapping("/delete.do")
	public String delete(Integer no) throws Exception {
		log.info("FAQ 글 삭제");
		
		service.delete(no);
		
		Thread.sleep(1200);
		return "redirect:list.do";
	}
}
