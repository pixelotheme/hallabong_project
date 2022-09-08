package com.hallabong.tour.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hallabong.member.vo.LoginVO;
import com.hallabong.tour.controller.TourController;
import com.hallabong.tour.service.TourService;
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
	public String list(TourPageObject pageObject, Model model) throws Exception {
		
		log.info("관광명소 게시판 리스트");
		
		if(pageObject.getPerPageNum() == 10) pageObject.setPerPageNum(9);
		
		model.addAttribute("list", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "tour/list";
	}
	
	// 관광명소 글보기
	@GetMapping("/view.do")
	public String view(long no, Model model, TourVO vo, HttpSession session) throws Exception {
		
		log.info("관광명소 게시판 글보기");
		model.addAttribute("vo", service.view(no));
		
		return "tour/view";
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
			int perPageNum) throws Exception {
		
		// 아이디 가져오기
		String id = ((LoginVO)session.getAttribute("login")).getId();
		vo.setId(id);
		
		// 관광명소 파일명을 찾아서 넣어 주는 것이 필요하다. - 중복이 되지 않는다. - 실제적으로 파일을 올려야 한다.
		vo.setFileName(FileUtil.upload("/upload/image", vo.getImageFile(), request));
		vo.setThumbnail(FileUtil.upload("/upload/thumbnail", vo.getImageFile(), request));
		
		log.info("관광명소 게시판 글쓰기 처리");
		service.write(vo);
		
		// 관광명소가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
		Thread.sleep(2000);
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	// imageChange
	@PostMapping("/imageChange.do")
	public String imageChange(TourPageObject pageObject, TourVO vo, HttpServletRequest request) throws Exception {
		
		// 서버에 파일 업로드
		vo.setFileName(FileUtil.upload("/upload/image", vo.getImageFile(), request));
		
		// DB에 수정한다.
		service.imageChange(vo);
		
		// 관광명소가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
		Thread.sleep(2000);
		
		// 원래 파일은 삭제한다.
		FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
		
		return "redirect:view.do?no=" + vo.getNo()
			+ "&page=" + pageObject.getPage()
			+ "&perPageNum=" + pageObject.getPerPageNum()
			+ "&area=" + pageObject.getArea()
			+ "&theme=" + pageObject.getTheme()
			+ "&word=" + pageObject.getWord();
	}

	// updateForm - g
	@GetMapping("/update.do")
	public String updateForm(long no, Model model) throws Exception {
		
		log.info("관광명소 게시판 글수정 폼");
		model.addAttribute("vo", service.view(no));
		
		return "tour/update";
	}
	
	// update - p
	@PostMapping("/update.do")
	public String update(TourVO vo, TourPageObject pageObject) throws Exception {
		
		log.info("관광명소 게시판 글수정 처리");
		service.update(vo);
		
		log.info(pageObject);
		
		// 검색 처리를 하면서 key, word를 확인해야 한다.
		return "redirect:view.do?no=" + vo.getNo()
			+ "&page=" + pageObject.getPage()
			+ "&perPageNum=" + pageObject.getPerPageNum()
			+ "&area=" + pageObject.getArea()
			+ "&theme=" + pageObject.getTheme()
			+ "&word=" + pageObject.getWord();
	}
	
	// delete - g
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
	@PostMapping(value = {"/like.do"}, 
	consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
	produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> like(@RequestBody TourVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
	
		log.info("like().vo : " + vo);
		
		int result = service.like(vo);
		 
		log.info(result);
		
		 return new ResponseEntity<String>
		 ("좋아요 등록 완료!",HttpStatus.OK);

	}

	// 좋아요 취소
	@PostMapping(value = {"/unlike.do"}, 
			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> unlike(@RequestBody TourVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		log.info("unlike().vo : " + vo);
		
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		
		//id에 로그인한 아이디 담기
		String id = loginVO.getId();
		vo.setId(id);
		
		log.info(id);
		
		
		int result = service.unlike(vo);
		// 전달되는 데이터의 선언
		String msg = "좋아요 취소 되었습니다.";
		HttpStatus status = HttpStatus.OK;
		log.info(result);
		if(result == 0) {
			msg = "좋아요 취소 실패 - 좋아요가 되어있는지 확인해주세요.";
		}
		log.info("unlike().msg: " + msg);
		return new ResponseEntity<String>(msg, status);
	}
}
