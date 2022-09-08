package com.hallabong.rentcarboard.carinsurance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.carbasicinfo.controller.RentCarBoardCarBasicInfoController;
import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.carinsurance.service.RentCarBoardCarInsuranceService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/carinsurance")
@Log4j
public class RentCarBoardCarInsuranceController {

	@Autowired
	@Qualifier("cis")
	private RentCarBoardCarInsuranceService service;
	
	@GetMapping("/carInsuranceWrite.do")
	public String carInsurancewriteForm() {
		
		
		
		return "carinsurance/carInsuranceWrite";
	}
	// 차 보험 상세 수정
	@GetMapping("/carInsuranceUpdate.do")
	public String carInsuranceUpdateForm(Model model, long carNo) {
		
		
		List<RentCarBoardCarInsuranceVO> carInsuranceVO = service.getCarInsurance(carNo);

		log.info("여기"+carInsuranceVO.get(0));
		
		if(carInsuranceVO.size() == 1) {
			log.info("size 가  1 이다");
			RentCarBoardCarInsuranceVO vo = new RentCarBoardCarInsuranceVO();
			vo.setInsuranceNo(0);
			
			carInsuranceVO.add(vo);
			log.info("두번째 값이 없을때 0 으로 세팅" + carInsuranceVO.get(1));
		}
		
		model.addAttribute("carInsuranceVO", carInsuranceVO);
		
		return "carinsurance/carInsuranceUpdate";
	}
}
