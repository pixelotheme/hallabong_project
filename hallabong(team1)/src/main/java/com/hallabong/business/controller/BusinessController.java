package com.hallabong.business.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.business.service.BusinessService;
import com.hallabong.business.vo.BusinessVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/business")
@Log4j
public class BusinessController {

//	@Autowired
	@Setter(onMethod_ = {@Autowired})
	private BusinessService businessServiceImpl;
	
	// list - g
	@GetMapping("/list.do")
	public String list(PageObject pageObject, Model model) throws Exception {
		log.info("사업장(호텔) 리스트");
		
		if(pageObject.getPerPageNum() == 10) pageObject.setPerPageNum(8);
		
		model.addAttribute("list", businessServiceImpl.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		return "business/list";
	}
	
	// view - g
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		log.info("사업장(호텔) 보기");
		
		model.addAttribute("vo", businessServiceImpl.view(no));
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

		//  session에서 받아서 쓴다. - 
		vo.setBus_name("베니키아 호텔");
		// 이미지 파일명을 찾아서 넣어 주는 것이 필요하다. - 중복이 되지 않는다. - 실제적으로 파일 올리기
		vo.setFileName(FileUtil.upload("/upload/image", vo.getImageFile(), request));  
		businessServiceImpl.write(vo);
		// 이미지가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
		Thread.sleep(2000);
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// imageChange
	@PostMapping("/imageChange.do")
	public String imageChange(PageObject pageObject, BusinessVO vo, HttpServletRequest request) throws Exception {
		
		// 서버에 파일 업로드
		vo.setFileName(FileUtil.upload("/upload/image", vo.getImageFile(), request));
		
		// DB에 수정한다.
		businessServiceImpl.imageChange(vo);
		
		// 원래 파일은 지운다.
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));

		// 이미지가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
		Thread.sleep(2000);
		
		return "redirect:view.do?no=" + vo.getBus_no() 
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord();
	}
	
	// updateForm - g
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		log.info("사업장  수정폼");

		model.addAttribute("vo", businessServiceImpl.view(no));
		return "business/update";
	}
	
	// update - p
	@PostMapping("/update.do")
	public String update(BusinessVO vo, PageObject pageObject) throws Exception {
		log.info("사업장(호텔)  수정 처리");

		businessServiceImpl.update(vo);
		
		log.info(pageObject);
		
		// 검색처리를 하면서 key와 word를 확인해야 합니다.
		return "redirect:view.do?no=" + vo.getBus_no()
				+ "&page=" + pageObject.getPage()
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				+ "&word=" + pageObject.getWord()
				;
	}
	
	// delete - g
	@GetMapping("/delete.do")
	public String delete(BusinessVO vo, HttpServletRequest request, int perPageNum) throws Exception {
		log.info("사업장 삭제");

		//DB에서 데이터에서 데이터 삭제
		businessServiceImpl.delete(vo.getBus_no());
		
		// 파일 삭제
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
}
