package com.hallabong.business.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.business.service.BusinessService;
import com.hallabong.business.service.BusinessServiceImpl;
import com.hallabong.business.vo.BusinessVO;
import com.hallabong.member.vo.LoginVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/business")
@Log4j
public class BusinessController {
	
	@Setter(onMethod_ = {@Autowired})
	@Qualifier("businessServiceImpl")
	private BusinessService service;
	
	// 리스트
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception {
		
		log.info("호텔 리스트");
		
		if(pageObject.getPerPageNum() == 10)
			pageObject.setPerPageNum(8);
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "business/list";
	}
	
	
	// 보기
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		
	log.info("호텔 보기");
	

		model.addAttribute("vo", service.view(no));
		
		return "business/view";
	}
	
	// 등록 폼
	@GetMapping("/write.do")
	public String writeForm() throws Exception{

		log.info("객실 등록폼");

		return "business/write";
	}
	
	// 등록 처리
	@PostMapping("/write.do")
	public String write(BusinessVO vo, HttpServletRequest request, int perPageNum ) throws Exception {
		
		log.info("호텔 등록 처리 -------");
		
		log.info(request);
		
		log.info(vo);		
		
		vo.setId("admin");
		
		vo.setFileName(FileUtil.upload("/upload/business", vo.getImageFile(), request)); 
		
		log.info("파일 등록 처리 ----------");
		
		
		service.write(vo);
				
		return "redirect:list.do?perPageNum=" + perPageNum;

	}
	
	// 수정 폼
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		
		log.info("호텔 수정폼");
		
		model.addAttribute("vo", service.view(no));
		
		return "business/update";
	}
	
	// 수정 처리
	@PostMapping("/update.do")
	public String update(BusinessVO vo, PageObject pageObject, HttpServletRequest request) throws Exception{
		
		log.info("호텔 수정 처리");
		
		vo.setFileName(FileUtil.upload("/upload/business", vo.getImageFile(), request)); 

		vo.setId("admin");
		
		service.update(vo);
		
		log.info(pageObject);
		
		return "redirect:view.do?no=" + vo.getNo() 
		+ "&page=" + pageObject.getPage()
		+ "&perPageNum=" + pageObject.getPerPageNum()
		+ "&key=" + pageObject.getKey()
		+ "&word=" + pageObject.getWord()
		;
	}
	// imageChange
		@PostMapping("/imageChange.do")
		public String imageChange(PageObject pageObject, BusinessVO vo, HttpServletRequest request) throws Exception {
			
			// 서버에 파일 업로드
			vo.setFileName(FileUtil.upload("/upload/business", vo.getImageFile(), request));
			
			// DB에 수정한다.
			service.imageChange(vo);
			
			// 원래 파일은 지운다.
			FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));

			// 이미지가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
			Thread.sleep(2000);
			
			return "redirect:view.do?no=" + vo.getNo() 
					+ "&page=" + pageObject.getPage()
					+ "&perPageNum=" + pageObject.getPerPageNum()
					+ "&key=" + pageObject.getKey()
					+ "&word=" + pageObject.getWord();
		}
	
	// 삭제
	@GetMapping("/delete.do")
	public String delete(long no, int perPageNum) throws Exception{
		
		log.info("호텔 삭제");
		
		int result = service.delete(no);
		
		if(result == 1) log.info("삭제 완료");
		else log.info("게시판 삭제 실패 - 게시판 글번호를 확인해주세요.");
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	
}
}
