package com.hallabong.rentcarbooking.controller;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hallabong.member.service.MemberService;
import com.hallabong.member.vo.LoginVO;
import com.hallabong.member.vo.MemberVO;
import com.hallabong.rentcarboard.util.PageObjectCustom;
import com.hallabong.rentcarbooking.domain.RentCarBookingVO;
import com.hallabong.rentcarbooking.service.RentCarBookingService;

import lombok.Builder.Default;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rentcarbooking")
@Log4j
@Transactional
public class RentCarBookingController {

	@Autowired
	@Qualifier("bookingService")
	private RentCarBookingService service;

	@Autowired
	@Qualifier("msi")
	private MemberService msiService;
	
	
	//예약 리스트
	@GetMapping("list.do")
	public String list(PageObjectCustom pageObject, Model model) throws Exception {

		log.info("list controller "+pageObject);
		
		model.addAttribute("rbList", service.list(pageObject));
		model.addAttribute("pageObject", pageObject);
		
		return "rentcarbooking/list";
	}
	
	//뷰
	@GetMapping("/view.do")
	public String view(long bookingNo, Model model) throws Exception{
		
		log.info("예약 보기-----------------");
		model.addAttribute("vo", service.view(bookingNo));
		
		
		return "rentcarbooking/view";
		
	}	
	
	//상세정보등록 - 결제전이니 예약 으로 등록
	@GetMapping("/booking.do")
	public String writeForm(RentCarBookingVO vo, Model model,HttpSession session) throws Exception{
		
		log.info("예약 등록 폼 ------------------" + vo);
		
		RentCarBookingVO basicVO = new RentCarBookingVO();
		basicVO = service.getInfoForBooking(vo);
		basicVO.setTotalPrice(vo.getTotalPrice());
		basicVO.setCarNo(vo.getCarNo());
		basicVO.setCompanyNo(vo.getCompanyNo());
		basicVO.setCarInfoNo(vo.getCarInfoNo());
		basicVO.setRentalDate(vo.getRentalDate());
		basicVO.setReturnDate(vo.getReturnDate());

		model.addAttribute("vo", basicVO);
		
		model.addAttribute("companyCarsNo", service.getCompanyCarsNo(basicVO.getCarNo()));
		//가져올정보 추가로 회원 id 에 맞는 이름,이메일, 휴대폰 - id 값을 넣어줘야함
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		
		model.addAttribute("loginVO", msiService.view(loginVO.getId()));
		
		return "rentcarbooking/booking";
		
	}
	//상세정보등록
	@PostMapping("/booking.do")
	public String write(RentCarBookingVO vo) throws Exception{
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		log.info("예약 등록------------------"+ vo);
			

		log.info(vo);
		Long result = 0L;
		result = service.write(vo);
		log.info("여기"+vo+ "result : "+ result);
		String companyName = java.net.URLEncoder.encode(vo.getCompanyName(), "utf-8");
		//회사차 번호판 에 예약현황 업데이트 시킨다(booking,cunsumerId)
		service.updateCompanyCars(vo, 1);
		log.info(vo);
		
		return "redirect:payment.do?bookingNo="+vo.getBookingNo()+"&companyName="+companyName;
		
	}	
	
	//상세정보 등록후 결제창 
	@GetMapping("/payment.do")
	public String paymentForm(RentCarBookingVO vo,Model model) {
		
		if(vo.getPaymentType() == null || !(vo.getPaymentType()).equals("") ) {
			
		int min = 100000000;
		int max = 999999999;
		int random = (int) ((Math.random() * (max - min)) + min);
		System.out.println(random);
		
		model.addAttribute("random", random);
		model.addAttribute("vo", vo);
		}else {
			model.addAttribute("vo", vo);
		}
		
		
		return "rentcarbooking/payment";
	}
	
	@PostMapping("/payment.do")
	public String payment(RentCarBookingVO vo) throws Exception {
		log.info(vo);
		service.writePayment(vo);
		
		
		return "redirect:/rentcarboard/rentCarBoardList.do";
	}
	
	
	//상세정보 수정(결제부분은 수정 안된다 , 관리자일때 예약상태 변경 가능)
	@GetMapping("/update.do")
	public String updateForm(RentCarBookingVO vo, Model model,HttpSession session) throws Exception{
		
		log.info("예약 등록 폼 ------------------" + vo);
		
		RentCarBookingVO basicVO = new RentCarBookingVO();
		basicVO = service.getInfoForBooking(vo);
		basicVO.setTotalPrice(vo.getTotalPrice());
		basicVO.setCarNo(vo.getCarNo());
		basicVO.setCompanyNo(vo.getCompanyNo());
		basicVO.setCarInfoNo(vo.getCarInfoNo());
		basicVO.setRentalDate(vo.getRentalDate());
		basicVO.setReturnDate(vo.getReturnDate());
		//대여일, 반납일, 종합가격 - vo에 담겨있다
		//회사이름,차량이름, , 연료 ,보험종류, 기존가격(prePrice 로 들어온다) - db에서 가져오기로 vo에 각 no 담아둠
		model.addAttribute("vo", basicVO);
		
		//가져올정보 추가로 회원 id 에 맞는 이름,이메일, 휴대폰 - id 값을 넣어줘야함
		LoginVO loginVO = (LoginVO) session.getAttribute("login");		
		//가져올정보 추가로 회원 id 에 맞는 이름,이메일, 휴대폰
		
		//예약한 정보 가져오기
		model.addAttribute("bookingVO", service.view(vo.getBookingNo()));
		model.addAttribute("loginVO", msiService.view(loginVO.getId()));
		
		return "rentcarbooking/update";
		
	}
	//예약 보기 수정 처리
	@PostMapping("/update.do")
	public String update(RentCarBookingVO vo, PageObjectCustom pageObject,@RequestParam(value = "mypage", defaultValue = "0") int mypage) throws Exception{
		
		log.info("예약 수정 처리------------------"+vo);
		
		service.update(vo);
		
		//반납이면 booking 상태 0 으로  - 아이디도 지워줘야함
		if(vo.getBookingStatus() == "반납" || vo.getBookingStatus().equals("반납")) {
			vo.setConsumerId("");
			log.info("아이디 null" + vo);
			service.updateCompanyCars(vo, 0);
		}else {
			service.updateCompanyCars(vo, 1);
		}
		pageObject.setKey(URLEncoder.encode(pageObject.getKey(), "UTF-8"));
		pageObject.setWord(URLEncoder.encode(pageObject.getWord(), "UTF-8"));		
		return "redirect:updatePayment.do?bookingNo="+vo.getBookingNo()
		+"&page="+pageObject.getPage()
		+"&perPageNum="+pageObject.getPerPageNum()
		+"&key="+pageObject.getKey()
		+"&word="+pageObject.getWord()
		+"&mypage="+mypage
		;
		
	}	
	//상세정보 등록후 결제창 - 상세정보 db 올릴때 key도 같이 넘겨줘야함, 등록되면 결제 로 update 시켜줘야함 
	@GetMapping("/updatePayment.do")
	public String updatePaymentForm(RentCarBookingVO vo,Model model) throws Exception {
		
			log.info(vo);
			model.addAttribute("vo", service.view(vo.getBookingNo()));
		
		
		return "rentcarbooking/updatePayment";
	}
	
	@PostMapping("/updatePayment.do")
	public String updatePayment(RentCarBookingVO vo, PageObjectCustom pageObject, @RequestParam(value = "mypage", defaultValue = "0")int mypage) throws Exception {
		log.info(vo);
		service.updatePayment(vo);
		
		
		return "redirect:view.do?bookingNo="+vo.getBookingNo()
				+"&page="+pageObject.getPage()
				+"&perPageNum="+pageObject.getPerPageNum()
				+"&key="+pageObject.getKey()
				+"&word="+pageObject.getWord()
				+"&mypage="+mypage
				;
	}
		
	
	//예약 삭제
	@GetMapping("/delete.do")
	public String delete(RentCarBookingVO vo) throws Exception{
		
		log.info("예약 삭제------------------");
		service.delete(vo.getBookingNo());
		
		//회사차량 예약,아이디0으로
		service.updateCompanyCars(vo, 0);
		return "redirect:list.do";
		
	}	
	 
}
