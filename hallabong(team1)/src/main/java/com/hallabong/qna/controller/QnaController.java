package com.hallabong.qna.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.member.vo.LoginVO;
import com.hallabong.qna.service.QnaService;
import com.hallabong.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna")
@Log4j
public class QnaController {

	@Autowired
	@Qualifier("QnaServiceImpl")
	private QnaService service;
	
	// 리스트
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception{
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		Thread.sleep(1000);
		return "qna/list";
	}
	
	// 질문하기 폼(writeForm)
	@GetMapping("/write.do")
	public String writeForm() throws Exception{
		
		Thread.sleep(1000);
		return "qna/write";
	}
	
	// 질문하기(wirte) 처리
	@PostMapping("/write.do")
	public String write(QnaVO vo, HttpSession session, int perPageNum) throws Exception{
		
		String id = ((LoginVO)session.getAttribute("login")).getId();
		vo.setId(id);
		
		// DB에 넣기
		service.write(vo);
		
		Thread.sleep(1000);
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// 질문 / 답변 보기(QNA 글 보기)
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception{
		
		QnaVO vo = service.view(no);
		vo.setContent(vo.getContent().replace("\n", "<br>"));
		
		model.addAttribute("vo", vo);
		
		Thread.sleep(1000);
		return "qna/view";
	}
	
	// 답변하기 폼
	@GetMapping("/answer.do")
	public String answerForm(long no, Model model) throws Exception {
		
		model.addAttribute("vo", service.view(no));
		
		Thread.sleep(1000);
		return "qna/answer";
	}
	
	// 답변하기 처리
	@PostMapping("/answer")
	public String answer(PageObject pageObject, QnaVO vo, HttpSession session) throws Exception{
		
		// id는 session에서
		String id = ((LoginVO)session.getAttribute("login")).getId();
		vo.setId(id);
		
		// DB 처리
		service.answer(vo);
		
		Thread.sleep(1000);
		return "redirect:list.do?page=" + pageObject.getPage()
		+ "&perPageNum=" + pageObject.getPerPageNum()
		+ "&key=" + pageObject.getKey()
		+ "&word=" + pageObject.getWord();
	}
	
	// 수정 폼
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		
		// DB에서 데이터 가져오기
		model.addAttribute("vo", service.view(no));
		
		Thread.sleep(1000);
		return "qna/update";
	}
	
	// 수정 처리
	@PostMapping("/update.do")
	public String update(QnaVO vo, PageObject pageObject) throws Exception {
		
		// DB 처리
		service.update(vo);
		
		Thread.sleep(1000);
		return "redirect:view.do?no=" + vo.getNo()
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// 삭제처리
	@GetMapping("/delete.do")
	public String delete(long no, int perPageNum) throws Exception{
		
		// DB 처리
		service.delete(no);
		
		Thread.sleep(1000);
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
}
