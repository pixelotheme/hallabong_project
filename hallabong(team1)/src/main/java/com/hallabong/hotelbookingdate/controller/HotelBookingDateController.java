package com.hallabong.hotelbookingdate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hallabong.hotelbookingdate.service.HotelBookingDateService;
import com.hallabong.hotelbookingdate.vo.HotelBookingDateVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;



@RestController
@Log4j
@RequestMapping("/hotelbookingdate")

public class HotelBookingDateController {
	
	@Autowired
	@Qualifier("hotelBookingDateServiceImpl")
	private HotelBookingDateService service;

	@GetMapping(value = "/list.do", 
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> list(PageObject pageObject, Long  ro_no){
		
		List<HotelBookingDateVO> list = service.list(pageObject, ro_no);
		 
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pageObject", pageObject);
		map.put("list", list);
		log.info("+++++++"+map);
		log.info("호텔예약날짜 리스트 ------------------------"+list);
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
		//write
		@PostMapping(value = "/write.do",
					consumes = "application/json",
					produces = {MediaType.TEXT_PLAIN_VALUE}
				)
		public ResponseEntity<String> write(@RequestBody HotelBookingDateVO vo){
			
			log.info(vo);
			service.write(vo);
			
			return new ResponseEntity<>("write success",HttpStatus.OK);
		}

}
