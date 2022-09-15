package com.hallabong.diner.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hallabong.diner.service.ReplyService;
import com.hallabong.diner.vo.ReplyVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies")
@Log4j
public class DinerReplyRestController {

	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService service;
	
	// 댓글 리스트
	@GetMapping(
			value = "/pages/{no}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
			}
	)
//	public ResponseEntity<List<ReplyVO>> getList(
	public ResponseEntity<Map<String, Object>> getList(
			@PathVariable("page") int page,
			@PathVariable("no") Long no
	){
		log.info("getList(Reply) .................");
		PageObject pageObject = new PageObject(page, 10);
		log.info(pageObject);
		
		// 실행 결과 찍어보기
		List<ReplyVO> list = service.getList(pageObject, no);
		for(ReplyVO vo : list) {
			vo.setReply(vo.getReply().replace("\n", "<br>"));
		}
		log.info(list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageObject", pageObject);
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	// 댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
		log.info(vo);
		
		int insertCount = service.register(vo);
		
		log.info(insertCount);
		
		return insertCount == 1 // 정상 등록이 되었나?
				? new ResponseEntity<String>("register success!", HttpStatus.OK) // true
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); // false
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rno}", // url - /replies/1
			consumes = "application/json", // 넘어오는 데이터가 json
			produces = {MediaType.TEXT_PLAIN_VALUE} // 넘겨 주는 데이터 -> 순수 text 문자열 데이터
			)
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno){
		
		// path에서 받아 놓은 rno를 vo 객체에 넣는다.
		vo.setRno(rno);
		
		log.info("modify ......... vo : " + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<String>("update success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.NOT_MODIFIED);
	}
	
	@DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		
		log.info("remove - rno : " + rno);
		
		return service.remove(rno) == 1
			? new ResponseEntity<String>("remove success~", HttpStatus.OK)
			: new ResponseEntity<String>(HttpStatus.NOT_FOUND);
	}

	
}
