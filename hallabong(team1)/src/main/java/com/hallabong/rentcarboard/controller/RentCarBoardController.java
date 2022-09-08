package com.hallabong.rentcarboard.controller;

import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.service.RentCarBoardCarBasicInfoService;
import com.hallabong.rentcarboard.carfileupload.service.RentCarBoardCarFileUploadService;
import com.hallabong.rentcarboard.carinsurance.service.RentCarBoardCarInsuranceService;
import com.hallabong.rentcarboard.caroption.domain.RentCarBoardCarOptionVO;
import com.hallabong.rentcarboard.caroption.service.RentCarBoardCarOptionService;
import com.hallabong.rentcarboard.companycars.service.RentCarBoardCompanyCarsService;
import com.hallabong.rentcarboard.domain.RentCarBoardCarsVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.rentcarcompany.service.RentCarBoardRentCarCompanyService;
import com.hallabong.rentcarboard.service.RentCarBoardService;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rentcarboard")
@Log4j
public class RentCarBoardController {

	@Autowired
	@Qualifier("rcbsi")
	private RentCarBoardService service;
	
	@Autowired
	@Qualifier("rcc")
	private RentCarBoardRentCarCompanyService rccService;
	
	@Autowired
	@Qualifier("cbi")
	private RentCarBoardCarBasicInfoService cbiService;

	@Autowired
	@Qualifier("cop")
	private RentCarBoardCarOptionService copService;

	@Autowired
	@Qualifier("cis")
	private RentCarBoardCarInsuranceService cisService;
	
	@Autowired
	@Qualifier("cfup")
	private RentCarBoardCarFileUploadService cfupService;
	
	@Autowired
	@Qualifier("ccs")
	private RentCarBoardCompanyCarsService cssService;
	
	
	
	
	@GetMapping("/rentCarBoardList.do")
	public String list(PageObjectCustom pageObject,Model model) {
		List<RentCarSynthesizeDTO> dto = service.list(pageObject);
		log.info("dto : "+ dto);
		
		//검색을 위한 전체회사 정보가져오기 
		model.addAttribute("companys", rccService.getAllCompany());
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "rentcarboard/rentCarBoardList";
	}
	//렌트카 보기 // 옵션, 보험, 파일업로드 까지 끝내고 마지막에
	@GetMapping("rentCarBoardView.do")
	public String view(Model model, long carNo, long carInfoNo, long companyNo) {
		
		log.info("view ..... : "+carNo);
		model.addAttribute("companyVO", rccService.getCompany(carNo)); //완료
		model.addAttribute("carsVO", service.getCars(carNo));
		
		//리스트에서 carInfoNo 도 같이 뽑아둠
		model.addAttribute("carBasicInfoVO", cbiService.getCarBasicInfo(carInfoNo)); // 완료
		
		model.addAttribute("carOptionVO", copService.getCarOption(carNo)); //완료
		model.addAttribute("carInsuranceVO", cisService.getCarInsurance(carNo)); //완료
		model.addAttribute("carFileUploadVO", cfupService.getCarFileUpload(carInfoNo)); //완료
		
		PageObjectCustom pageObject = new PageObjectCustom();
		pageObject.setKey("B");
		model.addAttribute("totalCompanyCars", cssService.getTotalRowForCompanyCars(pageObject, carNo, companyNo));
		
		//차량 이름 등등 있어야함 
		return "rentcarboard/rentCarBoardView";
	}
	
	
	@GetMapping("/rentCarBoardWrite.do")
	public String rentCarwriteForm(Model model) {
		
		model.addAttribute("companys", rccService.getAllCompany());
		model.addAttribute("allCarBasicInfo", cbiService.getAllCarBasicInfo());
		return "rentcarboard/rentCarBoardWrite";
	}
	//등록 
	@PostMapping("/rentCarBoardWrite.do")
		public String rentCarwrite(RentCarBoardCarsVO carsVO, RentCarBoardCarOptionVO carOptionVO,RentCarBoardCarBasicInfoVO carBasicInfoVO, long perPageNum) throws Exception {
		log.info("rentCarWrite"+carsVO);
		carsVO.setCarInfoNo(carBasicInfoVO.getCarInfoNo());
		log.info("rentCarWrite"+carsVO);
		//로그인한 아이디로 지정
		carsVO.setId("admin");
		
		int result = service.writeCarGetCarNo(carsVO);
		log.info("result" + result);
		long carInfoNo = carsVO.getCarInfoNo();
		long carNo = carsVO.getCarNo();
		
		//차옵션 등록
		log.info(carOptionVO);
		copService.writeCarOption(carOptionVO, carNo);
		
		return "redirect:/carinsurance/carInsuranceWrite.do?carNo="+carNo+"&perPageNum="+perPageNum;
	}		
	
	//렌트카 수정
	@GetMapping("/rentCarBoardUpdate.do")
	public String rentCarUpdateForm(Model model, long carNo) {
		//모든 회사 가져오기
		model.addAttribute("companys", rccService.getAllCompany());
		//모든 차량 정보 가져오기
		model.addAttribute("allCarBasicInfo", cbiService.getAllCarBasicInfo());
		
		model.addAttribute("carsVO", service.getCars(carNo));
		model.addAttribute("carOptionVO", copService.getCarOption(carNo));
		model.addAttribute("carFileUploadVO",  cfupService.getCarFileUpload(carNo));
		return "rentcarboard/rentCarBoardUpdate";
	}

	@PostMapping("/rentCarBoardUpdate.do")
	public String rentCarUpdate(RentCarBoardCarsVO carsVO, RentCarBoardCarOptionVO carOptionVO,RentCarBoardCarBasicInfoVO carBasicInfoVO, PageObjectCustom pageObject) throws Exception {
		//차 수정, 차옵션 수정
		log.info(carsVO );
		carsVO.setId("admin");
		carsVO.setCarInfoNo(carBasicInfoVO.getCarInfoNo());
		log.info(carsVO );
		log.info(carOptionVO);
		log.info(carBasicInfoVO );
		
		//차 업데이트
		int updateResult = service.updateCar(carsVO);
		log.info(updateResult+"carOptionVO" + carOptionVO);
		//차 옵션 업데이트
		updateResult += copService.updateCarOption(carOptionVO);
		log.info(updateResult);
		pageObject.setKey(URLEncoder.encode(pageObject.getKey(), "UTF-8"));
		pageObject.setWord(URLEncoder.encode(pageObject.getWord(), "UTF-8"));
				
		
		
		return "redirect:/rentcarboard/rentCarBoardView.do?carNo="+carsVO.getCarNo()
		+"&carInfoNo="+carBasicInfoVO.getCarInfoNo()
		+"&companyNo="+carsVO.getCompanyNo()
		+"&page="+pageObject.getPage()
		+"&perPageNum="+pageObject.getPerPageNum()
		+"&key="+pageObject.getKey()
		+"&word="+pageObject.getWord()
		;
	}
	
	@GetMapping("/rentCarBoardDelete.do")
	public String deleteCar(long carNo) throws Exception {
		service.deleteCar(carNo);
		
		
		return "redirect:/rentcarboard/rentCarBoardList.do";
	}
	
}
