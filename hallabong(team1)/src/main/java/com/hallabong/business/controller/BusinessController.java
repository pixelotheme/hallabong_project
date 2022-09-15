package com.hallabong.business.controller;

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
import com.hallabong.business.vo.BusinessVO;
import com.hallabong.member.vo.LoginVO;
import com.hallabong.util.businesspageobject.BusinessPageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/business")
@Log4j
public class BusinessController {

	@Autowired
	@Qualifier("businessServiceImpl")
	private BusinessService service;
	
	// list - g
	@GetMapping("/list.do")
	public String list(BusinessPageObject pageObject, Model model) throws Exception {
		log.info("사업장(호텔) 리스트");
		
		if(pageObject.getPerPageNum() == 10) pageObject.setPerPageNum(9);
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return "business/list";
	}
	
	// view - g
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		log.info("사업장(호텔) 보기");
		
		model.addAttribute("vo", service.view(no));
		
		return "business/view";
	}
	
	// write Form - g
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("사업장(호텔)  등록 폼");
	
		return "business/write";
	}
	
	
	// write - p
	@PostMapping("/write.do")
	public String write(BusinessVO vo, HttpSession session, HttpServletRequest request,
			int perPageNum) throws Exception {
		log.info("사업장(호텔)  등록 처리");

		// 아이디 가져오기
				String id = ((LoginVO)session.getAttribute("login")).getId();
				vo.setId(id);
		//  session에서 받아서 쓴다. - 
		// 이미지 파일명을 찾아서 넣어 주는 것이 필요하다. - 중복이 되지 않는다. - 실제적으로 파일 올리기
		vo.setFileName(FileUtil.upload("/upload/business", vo.getImageFile(), request));  
		service.write(vo);
		// 이미지가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
		Thread.sleep(2000);
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// imageChange
	@PostMapping("/imageChange.do")
	public String imageChange(BusinessPageObject pageObject, BusinessVO vo, HttpServletRequest request) throws Exception {
		
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
				+ "&area=" + pageObject.getArea()
				+ "&word=" + pageObject.getWord();
	}
	
	// updateForm - g
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		log.info("사업장  수정폼");

		model.addAttribute("vo", service.view(no));
		return "business/update";
	}
	
	// update - p
	@PostMapping("/update.do")
	public String update(BusinessVO vo, BusinessPageObject pageObject) throws Exception {
		log.info("사업장(호텔)  수정 처리");

		service.update(vo);
		
		log.info(pageObject);
		
		// 검색처리를 하면서 key와 word를 확인해야 합니다.
		return "redirect:view.do?no=" + vo.getNo()
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&area=" + pageObject.getArea()
				+ "&word=" + pageObject.getWord()
				;
	}
	
	// delete - g
	@GetMapping("/delete.do")
	public String delete(BusinessVO vo, HttpServletRequest request, int perPageNum) throws Exception {
		log.info("사업장 삭제");

		//DB에서 데이터에서 데이터 삭제
		service.delete(vo.getNo());
		
		// 파일 삭제
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
}
