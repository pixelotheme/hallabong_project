package com.hallabong.rentcarboard.controller;

import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.service.RentCarBoardCarBasicInfoService;
import com.hallabong.rentcarboard.carfileupload.service.RentCarBoardCarFileUploadService;
import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.carinsurance.service.RentCarBoardCarInsuranceService;
import com.hallabong.rentcarboard.caroption.domain.RentCarBoardCarOptionVO;
import com.hallabong.rentcarboard.caroption.service.RentCarBoardCarOptionService;
import com.hallabong.rentcarboard.companycars.service.RentCarBoardCompanyCarsService;
import com.hallabong.rentcarboard.domain.RentCarBoardCarsVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.rentcarcompany.domain.RentCarBoardRentCarCompanyVO;
import com.hallabong.rentcarboard.rentcarcompany.service.RentCarBoardRentCarCompanyService;
import com.hallabong.rentcarboard.service.RentCarBoardService;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rentcarboard")
@Log4j
@Transactional
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
		
		//????????? ?????? ???????????? ?????????????????? 
		model.addAttribute("companys", rccService.getAllCompany());
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		log.info("????????? ????????????"+pageObject);
		
		return "rentcarboard/rentCarBoardList";
	}
	
	//????????? ?????? // ??????, ??????, ??????????????? ?????? ????????? ????????????
	@GetMapping("rentCarBoardView.do")
	public String view(Model model, long carNo, long carInfoNo, long companyNo) {
		
		log.info("view ..... : "+carNo);
		RentCarBoardRentCarCompanyVO rccVO = rccService.getCompany(carNo);
		
		rccVO.setAddress(rccVO.getAddress().replace("/", ","));
		
		model.addAttribute("companyVO", rccVO); //??????
		
		RentCarBoardCarsVO rcbcVO = service.getCars(carNo);
		log.info("carVO : " + rcbcVO);
		if(rcbcVO.getCancelAndRefund() == null || rcbcVO.getCancelAndRefund().equals("")) {
			rcbcVO.setCancelAndRefund("????????? ????????? ????????????");
		}else {
			rcbcVO.setCancelAndRefund(rcbcVO.getCancelAndRefund().replace("\n", "<br>").replace(" ", "&nbsp;"));
		}
		
		if(rcbcVO.getInsuranceInfo() == null || rcbcVO.getInsuranceInfo().equals("")) {
			rcbcVO.setInsuranceInfo("????????? ????????? ????????????");
		}else {
			rcbcVO.setInsuranceInfo(rcbcVO.getInsuranceInfo().replace("\n", "<br>").replace(" ", "&nbsp;"));
		}
		
		if(rcbcVO.getRentCarNote() == null || rcbcVO.getRentCarNote().equals("")) {
			
			rcbcVO.setRentCarNote("????????? ????????? ????????????");
		}else {
			rcbcVO.setRentCarNote(rcbcVO.getRentCarNote().replace("\n", "<br>").replace(" ", "&nbsp;"));
		}
				
		model.addAttribute("carsVO", rcbcVO);
		
		//??????????????? carInfoNo ??? ?????? ?????????
		model.addAttribute("carBasicInfoVO", cbiService.getCarBasicInfo(carInfoNo)); // ??????
		model.addAttribute("carOptionVO", copService.getCarOption(carNo)); //??????
		
		List<RentCarBoardCarInsuranceVO> rcbiVO =  cisService.getCarInsurance(carNo);
		for(RentCarBoardCarInsuranceVO vo : rcbiVO) {
			if(vo.getCustomerCharge() == null || vo.getCustomerCharge().equals("")) {
				vo.setCustomerCharge("????????? ????????? ????????????");
			}
			else {
				vo.setCustomerCharge(vo.getCustomerCharge().replace("\n", "<br>").replace(" ", "&nbsp;"));
				
			}
			
			
		}
		model.addAttribute("carInsuranceVO", rcbiVO); //??????
		
		model.addAttribute("carFileUploadVO", cfupService.getCarFileUpload(carInfoNo)); //??????
		
		PageObjectCustom pageObject = new PageObjectCustom();
		//?????????????????? ?????? ????????????
		pageObject.setKey("B");
		model.addAttribute("totalCompanyCars", cssService.getTotalRowForCompanyCars(pageObject, carNo, companyNo));
		
		//?????? ?????? ?????? ???????????? 
		return "rentcarboard/rentCarBoardView";
	}
	
	
	@GetMapping("/rentCarBoardWrite.do")
	public String rentCarwriteForm(Model model) {
		
		model.addAttribute("companys", rccService.getAllCompany());
		model.addAttribute("allCarBasicInfo", cbiService.getAllCarBasicInfo());
		return "rentcarboard/rentCarBoardWrite";
	}
	//?????? 
	@PostMapping("/rentCarBoardWrite.do")
	public String rentCarwrite(RentCarBoardCarsVO carsVO, RentCarBoardCarOptionVO carOptionVO,RentCarBoardCarBasicInfoVO carBasicInfoVO, long perPageNum) throws Exception {
		log.info("rentCarWrite"+carsVO);
		carsVO.setCarInfoNo(carBasicInfoVO.getCarInfoNo());
		log.info("rentCarWrite"+carsVO);
		//???????????? ???????????? ??????
		carsVO.setId("admin");
		
		
		int result = service.writeCarGetCarNo(carsVO);
		log.info("result" + result);
		long carInfoNo = carsVO.getCarInfoNo();
		long carNo = carsVO.getCarNo();
		
		//????????? ??????
		log.info(carOptionVO);
		copService.writeCarOption(carOptionVO, carNo);
		
		return "redirect:/carinsurance/carInsuranceWrite.do?carNo="+carNo+"&perPageNum="+perPageNum;
	}		
	
	//????????? ??????
	@GetMapping("/rentCarBoardUpdate.do")
	public String rentCarUpdateForm(Model model, long carNo) {
		//?????? ?????? ????????????
		model.addAttribute("companys", rccService.getAllCompany());
		//?????? ?????? ?????? ????????????
		model.addAttribute("allCarBasicInfo", cbiService.getAllCarBasicInfo());
		
		model.addAttribute("carsVO", service.getCars(carNo));
		model.addAttribute("carOptionVO", copService.getCarOption(carNo));
		model.addAttribute("carFileUploadVO",  cfupService.getCarFileUpload(carNo));
		return "rentcarboard/rentCarBoardUpdate";
	}

	@PostMapping("/rentCarBoardUpdate.do")
	public String rentCarUpdate(RentCarBoardCarsVO carsVO, RentCarBoardCarOptionVO carOptionVO,RentCarBoardCarBasicInfoVO carBasicInfoVO, PageObjectCustom pageObject) throws Exception {
		//??? ??????, ????????? ??????
		log.info(carsVO );
		carsVO.setId("admin");
		carsVO.setCarInfoNo(carBasicInfoVO.getCarInfoNo());
		log.info(carsVO );
		log.info(carOptionVO);
		log.info(carBasicInfoVO );
		
		//??? ????????????
		int updateResult = service.updateCar(carsVO);
		log.info(updateResult+"carOptionVO" + carOptionVO);
		//??? ?????? ????????????
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
