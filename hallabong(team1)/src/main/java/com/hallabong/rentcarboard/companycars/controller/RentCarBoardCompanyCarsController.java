package com.hallabong.rentcarboard.companycars.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.companycars.domain.RentCarBoardCompanyCarsSynthesizeVO;
import com.hallabong.rentcarboard.companycars.domain.RentCarBoardCompanyCarsVO;
import com.hallabong.rentcarboard.companycars.service.RentCarBoardCompanyCarsService;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/companycars")
@Log4j
public class RentCarBoardCompanyCarsController {

	@Autowired
	@Qualifier("ccs")
	private RentCarBoardCompanyCarsService service;
	
	//회사 차량 리스트
	
	@GetMapping("/companyCarsList.do")
	public String companyCarslist(PageObjectCustom pageObject, long carNo,  long companyNo,Model model) {
		
		List<RentCarBoardCompanyCarsSynthesizeVO> dto = service.getCompanyCarsList(pageObject, carNo, companyNo);
		log.info("dto : "+ dto);
		
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "companycars/companyCarsList";
	}
	
	
	//렌트카 회사 등록
	@GetMapping("/companyCarsWrite.do")
	public String companyCarsWriteForm() {
		
		
		
		return "companycars/companyCarsWrite";
	}
	// 번호판 등록
	@PostMapping("/companyCarsWrite.do")
	public String companyCarsWrite(long carNo, long companyNo,long carInfoNo, String[] licensePlate) {
		log.info(carNo);
		log.info(companyNo);
		log.info("번호반 배열 길이"+licensePlate.length+"번호판 배열"+licensePlate.toString());
		String id = "admin";
		
		
		for(String strLicensePlate : licensePlate) {
			RentCarBoardCompanyCarsVO vo = new RentCarBoardCompanyCarsVO();
			log.info(strLicensePlate);
			if(strLicensePlate != null && !strLicensePlate.equals("")) {
				
				vo.setCarNo(carNo);
				vo.setCompanyNo(companyNo);
				vo.setLicensePlate(strLicensePlate);
				vo.setId(id);
				log.info("서비스 시작"+vo);
				service.writeCompanyCars(vo);
				log.info("서비스 끝");
			}
			
		}
		
		log.info("for 끝");
		
		return "redirect:/companycars/companyCarsList.do?carNo="+carNo
				+"&companyNo="+companyNo
				+"&carInfoNo="+carInfoNo;
	}
	
	//view
	@GetMapping("companyCarsView.do")
	public String companyCarsView(Model model, long companyCarsNo) {
		
		log.info("view ..... : "+ companyCarsNo);
		
		model.addAttribute("companyCarsVO", service.viewCompanyCars(companyCarsNo));
		
		
		
		return "companycars/companyCarsView";
	}
	
	//update
	@GetMapping("companyCarsUpdate.do")
	public String companyCarsUpdateForm(Model model,long companyCarsNo) {
		log.info("update ..... : "+ companyCarsNo);
		
		model.addAttribute("companyCarsVO", service.viewCompanyCars(companyCarsNo));
		
		return "companycars/companyCarsUpdate";
	}
	//update
	@PostMapping("companyCarsUpdate.do")
	public String companyCarsUpdate(RentCarBoardCompanyCarsVO companyCarsVO,long carInfoNo, PageObjectCustom pageObject) throws Exception {
		log.info("update ..... : "+ companyCarsVO);
		service.updateCompanyCars(companyCarsVO);
		log.info(" 11 : "+pageObject);
		pageObject.setWord(URLEncoder.encode(pageObject.getWord(), "UTF-8"));
		
		return "redirect:/companycars/companyCarsView.do?companyCarsNo="+companyCarsVO.getCompanyCarsNo()+"&carNo="+companyCarsVO.getCarNo()
		+"&companyNo="+companyCarsVO.getCompanyNo()+"&carInfoNo="+carInfoNo
		+"&page="+pageObject.getPage()
		+"&perPageNum="+pageObject.getPerPageNum()
		+"&key="+pageObject.getKey()
		+"&word="+pageObject.getWord()
		;
	}
	// 번호판 삭제
	@GetMapping("/companyCarsDelete.do")
	public String companyCarsDelete(long carNo, long companyNo,long carInfoNo,long companyCarsNo ) {
		
		service.deleteCompanyCars(companyCarsNo);
		
		return "redirect:/companycars/companyCarsList.do?carNo="+carNo
				+"&companyNo="+companyNo
				+"&carInfoNo="+carInfoNo;
	}
}
