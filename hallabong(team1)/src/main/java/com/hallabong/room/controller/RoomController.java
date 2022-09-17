package com.hallabong.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.business.vo.BusinessVO;
import com.hallabong.room.service.RoomService;
import com.hallabong.room.vo.RoomVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/room")
@Log4j
public class RoomController {

	@Autowired
	@Qualifier("roomServiceImpl")
	private RoomService service;
	
	
	
	// 객실list
	@GetMapping("/list.do")
		public String list(PageObject pageObject, Model model, HttpServletRequest request, Long no) throws Exception {
		
		log.info("호텔 리스트");
		
		if(pageObject.getPerPageNum() == 10)
			pageObject.setPerPageNum(8);
		
		model.addAttribute("list", service.list(pageObject,no));
		model.addAttribute("pageObject", pageObject);
		
		return "room/list";
	}
		//view
		@GetMapping("/view.do")
		public String view(long ro_no, Model model) throws Exception {
		
		log.info("객실 보기");
	
		model.addAttribute("vo", service.view(ro_no));
		
		return "room/view";
	}
	
		
		// write
		@GetMapping("/write.do")
		public String writeForm() throws Exception{

			log.info("객실 등록폼");

			return "room/write";
		}
		// 등록 처리
		@PostMapping("/write.do")
		public String write(RoomVO vo, HttpServletRequest request, int perPageNum, Long no) throws Exception {
			
			log.info("호텔 등록 처리 -------");
			
			log.info(request);
			
			log.info(vo);	
			
			vo.setId("admin");
			vo.setNo(no);
			
			vo.setFileName(FileUtil.upload("/upload/roomimage", vo.getImageFile(), request)); 
			
			log.info("파일 등록 처리 ----------");
			
			
			service.write(vo);
					
			return "redirect:list.do?perPageNum="  + perPageNum
					+"&no="+no;

		}
		
		
		// imageChange
		@PostMapping("/imageChange.do")
		public String imageChange(PageObject pageObject, RoomVO vo, HttpServletRequest request) throws Exception  {
			
			// 서버에 파일 업로드
			vo.setFileName(FileUtil.upload("/upload/roomimage", vo.getImageFile(), request));
			
			// DB에 수정한다.
			service.imageChange(vo);
			// 원래 파일은 지운다.
			FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));

			// 이미지가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
			Thread.sleep(2000);
			
			return "redirect:view.do?ro_no=" + vo.getRo_no()
			+ "&page=" + pageObject.getPage()
			+ "&perPageNum=" + pageObject.getPerPageNum()
			+ "&key=" + pageObject.getKey()
			+ "&word=" + pageObject.getWord();
}

		
			// update
		@GetMapping("/update.do")
		public String updateForm(long ro_no, Model model) throws Exception {
			log.info("이미지 게시판 수정폼");

			model.addAttribute("vo", service.view(ro_no));
			
			
			return "room/update";
		}
		
		// 수정 처리
		@PostMapping("/update.do")
		public String update(RoomVO vo, PageObject pageObject, HttpServletRequest request,Long no) throws Exception{
			
			log.info("호텔 수정 처리");
			
			vo.setFileName(FileUtil.upload("/upload/roomimage", vo.getImageFile(), request)); 

			vo.setNo(no);
			service.update(vo);
			
			log.info(pageObject);
			
			return "redirect:view.do?ro_no=" + vo.getRo_no() 
			+ "&page=" + pageObject.getPage()
			+ "&perPageNum=" + pageObject.getPerPageNum()
			+ "&key=" + pageObject.getKey()
			+ "&word=" + pageObject.getWord()
			+ "&no="+no
			;
		}
		// delete
			@GetMapping("/delete.do")
			public String delete(RoomVO vo, HttpServletRequest request, int perPageNum, Long no) throws Exception {
				log.info("이미지 게시판 삭제");

				//DB에서 데이터에서 데이터 삭제
				service.delete(vo.getNo());
				vo.setNo(no);
				// 파일 삭제
				FileUtil.remove(FileUtil.getRealPath("", vo.getDeleteName(), request));
				
				return "redirect:list.do?perPageNum="  + perPageNum
						+"&no="+no;

		}
		
		
	}
