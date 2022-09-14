package com.hallabong.rentcarboard.rentcarcompany.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hallabong.member.vo.LoginVO;
import com.hallabong.member.vo.MemberVO;
import com.hallabong.rentcarboard.rentcarcompany.domain.RentCarBoardRentCarCompanyVO;
import com.hallabong.rentcarboard.rentcarcompany.service.RentCarBoardRentCarCompanyService;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rentcarcompany")
@Log4j
@Transactional
public class RentCarBoardRentCarCompanyController {

	@Autowired
	@Qualifier("rcc")
	private RentCarBoardRentCarCompanyService service;
	
	//렌트카 회사 리스트
	@GetMapping("/rentCarCompanyList.do")
	public String rentCarCompanyList(PageObjectCustom pageObject,Model model) {
		List<RentCarBoardRentCarCompanyVO> list = service.rentCarCompanyList(pageObject);
		
		log.info("dto : "+ list);
		list.forEach(vo -> vo.setAddress(vo.getAddress().replace("/", "<br>")));
		log.info("dto : "+ list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageObject", pageObject);
		
		log.info("페이지 오브젝트"+pageObject);
		
		return "rentcarcompany/rentCarCompanyList";
	}	
	
	//렌트카 회사 등록
	@GetMapping("/rentCarCompanyWrite.do")
	public String rentCarCompanyWriteForm() {
		

		
		return "rentcarcompany/rentCarCompanyWrite";
	}
	//렌트카 회사 등록
	@PostMapping("/rentCarCompanyWrite.do")
	public String rentCarCompanyWrite(RentCarBoardRentCarCompanyVO vo, long perPageNum,HttpSession session) {
		log.info("vo 찍기"+vo);
		vo.setAddress(vo.getZipcode()+"/"+vo.getStreetAdr()+"/"+vo.getDetailAdr());
		//로그인한 아이디로 지정
		log.info("로그인한 아이디"+session.getAttribute("login"));
		
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		
		vo.setId(loginVO.getId());
		
		service.writeRentCarCompany(vo);
		return "redirect:/rentcarcompany/rentCarCompanyList.do?perPageNum="+perPageNum;
	}
	
	//렌트카 회사 수정
	@GetMapping("/rentCarCompanyUpdate.do")
	public String rentCarCompanyUpdateForm(Model model) {
		//모든 회사 가져오기
		model.addAttribute("companyVO", service.getAllCompany());

		//ajax 로 선택한 회사 정보 가져올 예정
		return "rentcarcompany/rentCarCompanyUpdate";
	}

	@PostMapping("/rentCarCompanyUpdate.do")
	public String rentCarCompanyUpdate(RentCarBoardRentCarCompanyVO vo,PageObjectCustom pageObject) throws Exception {
		log.info("vo 찍기"+vo);
		vo.setAddress(vo.getZipcode()+"/"+vo.getStreetAdr()+"/"+vo.getDetailAdr());
//		vo.setId("admin");
		
		service.updateRentCarCompany(vo);
		pageObject.setKey(URLEncoder.encode(pageObject.getKey(), "UTF-8"));
		pageObject.setWord(URLEncoder.encode(pageObject.getWord(), "UTF-8"));
		
		return "redirect:/rentcarcompany/rentCarCompanyList.do?"
				+"&page="+pageObject.getPage()
				+"&perPageNum="+pageObject.getPerPageNum()
				+"&key="+pageObject.getKey()
				+"&word="+pageObject.getWord();
	}
	
	// 회사 삭제, 사진은 남아있다	
		@GetMapping("/companyDelete.do")
		public String deleteCompany(long companyNo) throws Exception {
			service.deleteCompany(companyNo);
			
			
			return "redirect:/rentcarcompany/rentCarCompanyList.do";
		}
}
