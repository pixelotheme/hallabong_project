package com.hallabong.tour.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hallabong.member.vo.LoginVO;
import com.hallabong.tour.controller.TourController;
import com.hallabong.tour.service.TourService;
import com.hallabong.tour.vo.TourAttachVO;
import com.hallabong.tour.vo.TourVO;
import com.hallabong.util.pageobject.TourPageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/tour")
public class TourController {
	
	@Autowired
	@Qualifier("tourServiceImpl")
	private TourService service;
	
	// 관광명소 리스트
	@GetMapping("/list.do")
	public String list(TourPageObject pageObject, Model model, HttpServletRequest request) throws Exception {
		
		log.info("관광명소 게시판 리스트");
		
		if(pageObject.getPerPageNum() == 10) pageObject.setPerPageNum(9);
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "tour/list";
	}
	
	// 관광명소 글보기, 글수정 폼
	@GetMapping("/view.do")
	public String view(long no, Model model) throws Exception {
		
		log.info("관광명소 게시판 글보기");
		model.addAttribute("vo", service.view(no));
		
		return "tour/view";
	}
	
	// 글보기 첨부파일 확인
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<TourAttachVO>> getAttachList(Long no) throws Exception {
		ResponseEntity<List<TourAttachVO>> entity = null;
		
		entity = new ResponseEntity<List<TourAttachVO>>(service.agetAttachList(no), HttpStatus.OK);
		
		return entity;
	}
	
	// 관광명소 글쓰기 폼
	@GetMapping("/write.do")
	public String writeForm() {
		
		log.info("관광명소 게시판 글쓰기 폼");
		
		return "tour/write";
	}
	
	// 관광명소 글쓰기 처리
	@PostMapping("/write.do")
	public String write(TourVO vo, HttpSession session, HttpServletRequest request,
			int perPageNum, RedirectAttributes rttr) throws Exception {
		
		// 아이디 가져오기
		String id = ((LoginVO)session.getAttribute("login")).getId();
		vo.setId(id);
		
		// 썸넬 이미지
		vo.setThumbnail(FileUtil.upload("/upload/tour", vo.getImageFile(), request));

		log.info("관광명소 게시판 글쓰기 처리");
		service.write(vo);
		
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		Thread.sleep(2000);
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}

	// 관광명소 글수정 폼
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		
		log.info("관광명소 게시판 글수정 폼");
		model.addAttribute("vo", service.view(no));
		
		return "tour/update";
	}
	
	// 관광명소 글수정 처리
	@PostMapping("/update.do")
	public String update(TourVO vo, TourPageObject pageObject, HttpServletRequest request, int areaUrl, int themeUrl) throws Exception {
		
		// 썸넬 이미지
		vo.setThumbnail(FileUtil.upload("/upload/tour", vo.getImageFile(), request));

		log.info("관광명소 게시판 글수정 처리");
		service.update(vo);
		
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		Thread.sleep(2000);
		
		pageObject.setWord(URLEncoder.encode(pageObject.getWord(), "UTF-8"));
		
		return "redirect:view.do?no=" + vo.getNo()
			+ "&page=" + pageObject.getPage()
			+ "&perPageNum=" + pageObject.getPerPageNum()
			+ "&area=" + areaUrl
			+ "&theme=" + themeUrl
			+ "&word=" + pageObject.getWord();
	}
	
	// 관광명소 글삭제
	@GetMapping("/delete.do")
	public String delete(TourVO vo, HttpServletRequest request, int perPageNum) throws Exception {
		
		log.info("관광명소 게시판 글삭제");
		
		// DB 데이터에서 데이터 삭제
		service.delete(vo.getNo());
		
		// 파일 삭제
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}

	
	// 좋아요 처리
	@RequestMapping(value = {"/like.do"}, method = {RequestMethod.GET, RequestMethod.POST},
		consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
		produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> like(@RequestBody TourVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
	
		log.info("like().vo : " + vo);
		
		int result = service.like(vo);
		 
		log.info(result);
		
		 return new ResponseEntity<String>
		 ("좋아요!",HttpStatus.OK);

	}

	// 좋아요 취소
	@RequestMapping(value = {"/unlike.do"}, method = {RequestMethod.GET, RequestMethod.POST},
			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> unlike(@RequestBody TourVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		log.info("unlike().vo : " + vo);
		
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		
		//id에 로그인한 아이디 담기
		String id = loginVO.getId();
		vo.setId(id);
		
		log.info(id);
		
		
		int result =  service.unlike(vo);
		// 전달되는 데이터의 선언
		String msg = "좋아요가 취소 되었습니다.";
		HttpStatus status = HttpStatus.OK;
		log.info(result);
		if(result == 0) {
			msg = "좋아요 처리 실패";
		}
		log.info("unlike().msg: " + msg);
		return new ResponseEntity<String>(msg, status);
		
		
	}
}
