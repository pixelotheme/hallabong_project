package com.hallabong.member.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hallabong.member.service.MailSendService;
import com.hallabong.member.service.MemberService;
import com.hallabong.member.vo.LoginVO;
import com.hallabong.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberController {
	
	// 추 후 타 프로젝트 시 변경하여 사용할 수 있도록 모듈 설정
	private final String MODULE = "member";
	
	
	
	// 의존성 주입
	@Autowired
	@Qualifier("msi")
	private MemberService service;
	

	// 로그인 폼
	@GetMapping("/loginForm.do")
	public String loginForm() {
		// 데이터 찍기
		log.info("로그인 폼으로 이동");
		
		return MODULE + "/login";
	}
	
	
	// 로그인 vo를 session에 담아 불러오기 response를 통해 serviceimpl에서 메시지 출력
	@PostMapping("/login.do")
	public String login(LoginVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		
		log.info("login vo()" + vo);
	
		// 세션에 로그인 정보 담기
		session.setAttribute("login", service.login(vo, response));
		
		LoginVO vo1 = (LoginVO) session.getAttribute(vo.getId());
		
		log.info("login vo1 " + vo1);
		
		if(vo1 == null) {
			return MODULE + "/loginError";			
		}
		
		else {			
			return "redirect:../main.do";			
		}
				
	}
	
	// 로그인 에러
	@GetMapping("/loginError.do")
	public String loginError() throws Exception {
		
		return MODULE + "/loginError";
}
	
	// 로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) throws Exception{
		
		log.info("로그아웃");
		
		// 세션에서 로그인 정보 지우기
		session.removeAttribute("login");
		
		return "redirect:../main.do";
	}
	
	@GetMapping("/signForm.do")
	public String signForm() {
		
		log.info("회원 가입 폼");
		
		return MODULE + "/sign";
	}
	
	@PostMapping("/sign.do")
	public String sign(MemberVO vo, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
	
		log.info("로그인 중    vo : " + vo);
		
		// 회원 가입 정보 넣기
		rttr.addFlashAttribute("result", service.sign(vo, response));
		
		return "redirect:/member/loginForm.do";	
	}
	
		// 아이디 중복 검사(AJAX)
		@PostMapping("/check_id.do")
		public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
			service.check_id(id, response);
	}
		
		// 이메일 중복 검사(AJAX)
		@PostMapping("/check_email.do")
		public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
			service.check_email(email, response);
	}
		// 전화번호 중복 검사(AJAX)
		@PostMapping("/check_tel.do")
		public void check_tel(@RequestParam("tel") String tel, HttpServletResponse response) throws Exception{
			service.check_tel(tel, response);
	}
		
		// 이용약관
		@GetMapping("/readme.do")
		public String readme() throws Exception {
			
			return MODULE + "/readme";
	}
		
		// 아이디 찾기 폼
		@GetMapping("/findIdForm.do")
		public String findIdForm() throws Exception {
			
			return MODULE + "/findIdForm";
	}
		
		// 아이디 찾기
		@PostMapping("/findId.do")
		public String findId(HttpServletResponse response, Model model, MemberVO vo) throws Exception {
			
			model.addAttribute("vo", service.findId(response, vo));
			
			return MODULE + "/findId";
	}
		
		// 비밀번호 찾기 폼
		@GetMapping("/findPwForm.do")
		public String findPwForm() throws Exception{
			return MODULE + "/findPwForm";
	}
		
		//비밀번호 찾기
		@PostMapping("/findPw.do")
		public String findPw(HttpServletResponse response, Model model, MemberVO vo) throws Exception{
			
			model.addAttribute("vo", service.findPw(response, vo));
			
			return MODULE + "/findPw";
			
		}
		

		


	
		
		
		// 마이페이지
		@GetMapping("/myPage.do")
		public String myPage(HttpServletRequest request, Model model) throws Exception {
			
			// 세션에서 로그인 가져오기
			HttpSession session = request.getSession();
			log.info("로그인 정보 " + session.getAttribute("login"));
			LoginVO id = (LoginVO) session.getAttribute("login");
			
			// 로그인이 되어 있지 않으면 로그인 폼으로 이동
			if(id == null) {
				return "redirect:/member/loginForm.do";
	}
			
			// 아이디가 있는 경우 회원정보 가져오기
			MemberVO vo = service.myPage(id);
			log.info("myPage.MemberVO : " + vo);
			
			// vo 에 담아 호출
			model.addAttribute("vo", vo);
			
			return MODULE + "/myPage";
	}
		// 멤버 수정 폼
		@GetMapping("/memberUpdateForm.do")
		public String memberUpdateForm(Model model, HttpServletRequest request) throws Exception {
			
			// 세션 로그인  정보 가져오기
			HttpSession session = request.getSession();
			LoginVO id = (LoginVO) session.getAttribute("login");
			
			if(id == null) {
				return "redirect:/member/loginForm.do";
			}
			
			MemberVO vo = service.myPage(id);
			log.info("myPage.MemberVO : " + vo);
			
			model.addAttribute("vo", vo);
			
			
			return MODULE + "/memberUpdate";
	}
		// 멤버 수정
		@PostMapping("/memberUpdate.do")
		public String memberUpdate(MemberVO vo, Model model) throws Exception {
			
			log.info("회원정보수정 : " + vo);
			model.addAttribute("vo", service.memberUpdate(vo));
			
			return "redirect:/member/myPage.do";
	}
		
		
		
		
		
		// 회원탈퇴 폼
		@GetMapping("/memberWithdrawForm.do")
		public String memberWithdrawForm(Model model, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			LoginVO id = (LoginVO) session.getAttribute("login");
			
			// 로그인이 안되어 있으면 로그인폼으로 이동시킨다.
			if(id == null) {
				return "redirect:/member/loginForm.do";
			}
			
			MemberVO vo = service.myPage(id);
			log.info("myPage.MemberVO : " + vo);
			
			model.addAttribute("vo", vo);

			
			return MODULE + "/memberWithdrawForm";
			
		}
		// 회원 탈퇴
		@PostMapping("/memberWithdraw.do")
		public String memberWithdraw(MemberVO vo, Model model, HttpSession session, HttpServletResponse response) throws Exception {
			
			log.info("memberWithdrawController : " + vo);
			
			model.addAttribute("vo", service.memberWithdraw(vo,response, session)); 
			
			
			return MODULE + "/memberWithdraw";
		}
		
		/* 관리자 페이지   */
		
		// 멤버 리스트
		@GetMapping("/memberList.do")
		public String memberList(Model model, @ModelAttribute PageObject pageObject) throws Exception {
			
			log.info("list().pageObject : " + pageObject + " ..........");
			model.addAttribute("list", service.memberList(pageObject));
			
			return MODULE + "/memberList";
		}
		
		// 등급 변경
		@PostMapping("/gradeModify.do")
		public String gradeModify(MemberVO vo, Model model) throws Exception {
			model.addAttribute("vo", service.gradeModify(vo));
			return "redirect:/member/memberList.do";
			
		}
		// 회원 보기
		@GetMapping("/view.do")
		public String view(Model model, String id, @ModelAttribute PageObject pageObject ) throws Exception {
			
			model.addAttribute("vo", service.view(id));
			
			return MODULE + "/view";
		}
		
		@GetMapping("/testmain.do")
		public String testmain() {
			
			
			return MODULE + "/testmain";
		}
	

}
