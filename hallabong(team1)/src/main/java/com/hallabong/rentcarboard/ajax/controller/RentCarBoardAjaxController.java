package com.hallabong.rentcarboard.ajax.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hallabong.rentcarboard.ajax.service.RentCarBoardAjaxService;
import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.rentcarcompany.domain.RentCarBoardRentCarCompanyVO;
import com.hallabong.rentcarbooking.domain.RentCarBookingVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rentcarboardajaxcontroller")
@Log4j
public class RentCarBoardAjaxController {

	@Autowired
	@Qualifier("rcbasi")
	private RentCarBoardAjaxService service;
	
	//회사 수정,보기
	@GetMapping(value = "/companyView.do",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<Map<String, Object>> companyView(long companyNo){
		log.info(companyNo);
		Map<String, Object> map = new HashMap<String, Object>();
		
		// "/" 를 기준으로 분리해서 넣기

		RentCarBoardRentCarCompanyVO companyVO =service.getCompany(companyNo);

		String straddress = companyVO.getAddress();

		String[] addressArray = straddress.split("/");
		log.info(Arrays.toString(addressArray));
		if(addressArray.length > 1) {
			
		companyVO.setZipcode(addressArray[0]);
		companyVO.setStreetAdr(addressArray[1]);
		companyVO.setDetailAdr(addressArray[2]);
		
		}
		log.info(companyVO);
		
		map.put("companyView",companyVO);
		
		//map 자체를 넘겨준다
		return new ResponseEntity<>(map, HttpStatus.OK);
		
	}
	@PostMapping(value = "/writeCarInsurance.do", consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> writeCarInsurance(@RequestBody List<RentCarBoardCarInsuranceVO> carInsuranceVO){
		log.info("ajax : =" +carInsuranceVO);

		int result = 0;
		for(RentCarBoardCarInsuranceVO vo : carInsuranceVO) {

			if(vo.getInsuranceExperience() != null) {
				//2번값이 있을떄만 실행한다
				log.info("ajax if문 : =" +vo);
				result = service.writeCarInsurance(vo);
			}
			
		}
		log.info("result" + result);
		return	result == 1 ?
				new ResponseEntity<String>("write success",HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//차량 보험 업데이트
		@PostMapping(value = "/updateCarInsurance.do", consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> updateCarInsurance(@RequestBody List<RentCarBoardCarInsuranceVO> carInsuranceVO){
			log.info("ajax : =" +carInsuranceVO);

			int result = 0;
			for(RentCarBoardCarInsuranceVO vo : carInsuranceVO) {

				if(vo.getInsuranceExperience() != null) {
					//2번값이 있을떄만 실행한다
					log.info("ajax if문 : =" +vo);
		
					if(vo.getInsuranceNo() != 0) {
						
						result = service.updateCarInsurance(vo);
					}else {
						service.writeCarInsurance(vo);
					}
					
					
				}
				
			}
			System.out.println(result);
			return	new ResponseEntity<String>("update success",HttpStatus.OK);
		}
	//차량 보험 업데이트
		@PostMapping(value = "/deleteCarInsurance.do", consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> deleteCarInsurance(@RequestBody List<RentCarBoardCarInsuranceVO> carInsuranceVO){
			log.info("ajax : =" +carInsuranceVO);
			
			for(RentCarBoardCarInsuranceVO vo : carInsuranceVO) {
				
				if(vo.getInsuranceNo() != 0) {
						service.deleteCarInsurance(vo.getInsuranceNo());
				}
					
				
			}
			return	new ResponseEntity<String>("delete success",HttpStatus.OK);
		}
	
		
		@PostMapping(value = "/totalPrice.do", consumes = "application/json",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<Map<String, Object>> totalPrice(@RequestBody RentCarBookingVO bookingVO, Model model){
			log.info("ajax : =" +bookingVO);
			Date rentalDate = bookingVO.getRentalDate();
			Date returnDate = bookingVO.getReturnDate();
			int result = 0;
			long calDate = 0L;
			long calDateDays = 0L;
			long totalPrice = 0L;
			Map<String, Object> map = new HashMap<String, Object>();
			
			if(rentalDate.compareTo(returnDate) > 0) {
				System.out.println(rentalDate.compareTo(returnDate));
				System.out.println("잘못된 선택");
				
				map.put("totalPrice", bookingVO.getPrePrice());
				
				return new ResponseEntity<Map<String, Object>>(map ,HttpStatus.OK);
				
			}else {
				calDate = rentalDate.getTime() - returnDate.getTime();
				calDateDays = calDate / (24*60*60*1000);
				
				calDateDays = Math.abs(calDateDays);
				System.out.println("두 날짜의 날짜 차이: "+calDateDays);
				result = 1;
				
				totalPrice = calDateDays * bookingVO.getPrePrice();
			}
			
			
			log.info(totalPrice);
			String strPrice = Long.toString(totalPrice);

			map.put("totalPrice", totalPrice);
			return	result == 1 ?
					new ResponseEntity<Map<String, Object>>(map ,HttpStatus.OK)
					: new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
}
