package com.hallabong.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMethod;

import com.hallabong.business.vo.BusinessVO;
import com.hallabong.room.service.RoomService;
import com.hallabong.room.service.RoomServiceImpl;
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
		@GetMapping(value = "/list.do",
//				consumes = "application/json",
				produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<Map<String, Object>> list(PageObject pageObject, Long ro_no) throws Exception{
			// 페이지에 맞는 list 데이터 가져오기
			List<RoomVO> list = (List<RoomVO>) service.list(ro_no);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pageObject", pageObject);
			map.put("list", list);
			
			log.info(map);
			
			return new ResponseEntity<>(map, HttpStatus.OK);
		}
		
		// write
		@PostMapping(value = "/write.do", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> write(@RequestBody RoomVO vo) throws Exception {
			log.info(vo);
			service.write(vo);
			return new ResponseEntity<>("write success~!", HttpStatus.OK);
		}
		
		// roomimageChange
		@PostMapping("/roomimageChange.do")
		public String roomimageChange(PageObject pageObject, RoomVO vo, HttpServletRequest request) throws Exception  {
			
			// 서버에 파일 업로드
			vo.setFileName(FileUtil.upload("/upload/roomimage", vo.getRoomimageFile(), request));
			
			// DB에 수정한다.
			service.roomimageChange(vo);
			
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

		
			// update
			@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
					value = "/update.do", consumes = "application/json",
					produces = {MediaType.TEXT_PLAIN_VALUE})
			public ResponseEntity<String> update(@RequestBody RoomVO vo) throws Exception{
				log.info(vo);
				int result = service.update(vo);
				return (result == 1)
						? new ResponseEntity<>("update success~!", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR)
						;
			}
		
		// delete
		@RequestMapping(method = {RequestMethod.DELETE},
				value = "/delete.do",
				produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> delete(Long bus_no) throws Exception{
			log.info(bus_no);
			int result = service.delete(bus_no);
//			int result = 1;
			return (result == 1)
					? new ResponseEntity<>("delete success~!", HttpStatus.OK)
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR)
							;
		}
		
		
	}
