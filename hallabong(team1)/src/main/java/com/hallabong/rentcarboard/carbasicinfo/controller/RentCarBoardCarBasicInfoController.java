package com.hallabong.rentcarboard.carbasicinfo.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardSynthesizeVO;
import com.hallabong.rentcarboard.carbasicinfo.service.RentCarBoardCarBasicInfoService;
import com.hallabong.rentcarboard.carfileupload.controller.RentCarBoardCarFileUploadController;
import com.hallabong.rentcarboard.carfileupload.domain.RentCarBoardCarFileUploadVO;
import com.hallabong.rentcarboard.carfileupload.service.RentCarBoardCarFileUploadService;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/carbasicinfo")
@Log4j
public class RentCarBoardCarBasicInfoController {

	@Autowired
	@Qualifier("cbi")
	private RentCarBoardCarBasicInfoService service;

	@Autowired
	@Qualifier("cfup")
	private RentCarBoardCarFileUploadService cfupService;
	
	//차량 기본정보
	@GetMapping("/carBasicInfoList.do")
	public String carBasicInfoList(PageObjectCustom pageObject,Model model) throws Exception {
		
		List<RentCarBoardSynthesizeVO> dto = service.carBasicInfoList(pageObject);
		//
		
		log.info("dto : "+ dto);
		
		
		model.addAttribute("list", dto);
		model.addAttribute("pageObject", pageObject);
		
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "carbasicinfo/carBasicInfoList";
	}
	
	@GetMapping("/carBasicInfoWrite.do")
	public String carBasicInfoWriteForm() {
		
		
		
		return "carbasicinfo/carBasicInfoWrite";
	}
	//등록 
	@PostMapping("/carBasicInfoWrite.do")
		public String carBasicInfoWrite(RentCarBoardCarBasicInfoVO carBasicInfoVO, MultipartFile[] uploadFile,long perPageNum) throws Exception {
		
		service.writeCarBasicInfoGetCarInfoNo(carBasicInfoVO);
		
		log.info("carBasicInfoWrite"+carBasicInfoVO);
		carBasicInfoVO.setCarInfoNo(carBasicInfoVO.getCarInfoNo());
		log.info("rentCarWrite"+carBasicInfoVO);
		long carInfoNo = carBasicInfoVO.getCarInfoNo();
		
		
		log.info(uploadFile);
		RentCarBoardCarFileUploadController fileUploadController = new RentCarBoardCarFileUploadController();
		List<RentCarBoardCarFileUploadVO> list = fileUploadController.uploadFormPost(uploadFile, carInfoNo);
		
		log.info(list);
		list.forEach(vo -> cfupService.writeCarFileUpload(vo));
		
		
		
		return "redirect:/carbasicinfo/carBasicInfoList.do?perPageNum="+perPageNum;
	}
	
	//차량  기본정보 수정
	@GetMapping("/carBasicInfoUpdate.do")
	public String carBasicInfoUpdateForm(Model model, long carInfoNo) {
		model.addAttribute("CarBasicInfo", service.getCarBasicInfo(carInfoNo));
		
		model.addAttribute("carFileUploadVO",  cfupService.getCarFileUpload(carInfoNo));
		return "carbasicinfo/carBasicInfoUpdate";
	}

	//수정처리 진행 작업해야함
	@PostMapping("/carBasicInfoUpdate.do")
	public String carBasicInfoUpdate(@RequestParam(defaultValue = "0") String del,RentCarBoardCarBasicInfoVO carBasicInfoVO, MultipartFile[] uploadFile, PageObjectCustom pageObject) throws Exception {
		
		service.updateCarBasicInfo(carBasicInfoVO);
		
		log.info("파일 넘어온값 확인" + uploadFile[uploadFile.length-1].isEmpty());
		if(!uploadFile[uploadFile.length-1].isEmpty()) {
	
			// 파일 업로드 수정
			RentCarBoardCarFileUploadController fileUploadController = new RentCarBoardCarFileUploadController();
			
			boolean fileCheck = false;
			//write + del 서비스 2개가 되어야함 del먼저 만들자
			//배열이 있으면 기존 db 정보삭제, 실제파일 삭제 + 파일업로드
			//없으면(기존에 파일이 없다는뜻 ) 파일 업로드만 
			//하나가 있다면 디폴트는 무조건 안들어감, 없다면 디폴트가 0일것
			if(del != "0") {
				fileCheck = true;
			}
			
			if(fileCheck) {
				RentCarBoardCarFileUploadVO fileList = (cfupService.getCarFileUpload(carBasicInfoVO.getCarInfoNo()));
					
					fileUploadController.delete(fileList);
				cfupService.deleteCarFileUpload(carBasicInfoVO.getCarInfoNo());
				
			}
			List<RentCarBoardCarFileUploadVO> list = fileUploadController.uploadFormPost(uploadFile,carBasicInfoVO.getCarInfoNo());
			
			log.info(list);
			list.forEach(vo -> cfupService.writeCarFileUpload(vo));
		}//파일이 넘어온 값이 있으면 수정해라
		
		pageObject.setKey(URLEncoder.encode(pageObject.getKey(), "UTF-8"));
		pageObject.setWord(URLEncoder.encode(pageObject.getWord(), "UTF-8"));
		
		return "redirect:/carbasicinfo/carBasicInfoView.do?carInfoNo="+carBasicInfoVO.getCarInfoNo()
		+"&page="+pageObject.getPage()
		+"&perPageNum="+pageObject.getPerPageNum()
		+"&key="+pageObject.getKey()
		+"&word="+pageObject.getWord()
		;
	}
	
	//챠량 기본 정보 보기
	@GetMapping("carBasicInfoView.do")
	public String carBasicInfoView(Model model,  long carInfoNo) {
		
		log.info("view ..... : "+carInfoNo);
		
		model.addAttribute("carBasicInfoVO", service.getCarBasicInfo(carInfoNo));
		
		model.addAttribute("carFileUploadVO", cfupService.getCarFileUpload(carInfoNo));
		
		return "carbasicinfo/carBasicInfoView";
	}
	
	
	//렌트카 사진 삭제
	@PostMapping("/carBasicInfoImageDelete.do")
	public String carBasicInfoImageDelete(@RequestParam(defaultValue = "0") String del,long carInfoNo, MultipartFile[] uploadFile,PageObjectCustom pageObject) throws Exception {
		
		//
		log.info("carInfo"+carInfoNo);
		RentCarBoardCarFileUploadController fileUploadController = new RentCarBoardCarFileUploadController();
		
		boolean fileCheck = false;
		if(del != "0") {
			fileCheck = true;
		}
		
		if(fileCheck) {
			RentCarBoardCarFileUploadVO fileList = (cfupService.getCarFileUpload(carInfoNo));
			
			fileUploadController.delete(fileList);
			cfupService.updateFileUploadForNull(carInfoNo);
			log.info("durl");
		}
		log.info(pageObject);
		pageObject.setKey(URLEncoder.encode(pageObject.getKey(), "UTF-8"));
		pageObject.setWord(URLEncoder.encode(pageObject.getWord(), "UTF-8"));
		
		return "redirect:/carbasicinfo/carBasicInfoView.do?carInfoNo="+carInfoNo
				+"&page="+pageObject.getPage()
				+"&perPageNum="+pageObject.getPerPageNum()
				+"&key="+pageObject.getKey()
				+"&word="+pageObject.getWord();
	}	

	@GetMapping("/carBasicInfoDelete.do")
	public String carBasicInfoDelete(long carInfoNo,long perPageNum) throws Exception {
		RentCarBoardCarFileUploadController fileUploadController = new RentCarBoardCarFileUploadController();
		
		RentCarBoardCarFileUploadVO fileList = (cfupService.getCarFileUpload(carInfoNo));
		fileUploadController.delete(fileList);
		service.deleteCarBasicInfo(carInfoNo);
		
		
		return "redirect:/carbasicinfo/carBasicInfoList.do?perPageNum"+perPageNum;
	}
	
	
}
