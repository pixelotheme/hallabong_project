package com.hallabong.member.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.member.mapper.MemberMapper;
import com.hallabong.member.vo.LoginVO;
import com.hallabong.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

// 자동 생성
@Service
@Log4j
@Qualifier("msi")
public class MemberServiceImpl implements MemberService {

	// 자동 DI- Mapper
	@Inject
	private MemberMapper mapper;
	
	@Override
	public LoginVO login(LoginVO vo, HttpServletResponse response) throws Exception {
		
		// out.println을 쓰기 위한 선언
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		LoginVO data = mapper.login(vo);
		
		log.info("login().vo : " + vo);
		log.info("login().data : " + data);
		
		if(data == null) {
			System.out.println("아니 이게 왜 안돼냐고");
			out.println("<script>");
			out.println("alert('가입된 정보가 없습니다.');");
			out.println("location.href='/member/loginError.do'");
			out.println("</script>");
			out.close();

		}else {
			
			out.println("<script>");
			out.println("location.href='/main.do'");
			out.println("</script>");
			out.close();
			
		}
		return mapper.login(vo);
	}
	// 회원 가입
	@Override
	public int sign(MemberVO vo, HttpServletResponse response) throws Exception {
		// 출력 형식 선언
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (mapper.check_Id(vo.getId()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (mapper.check_Email(vo.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			mapper.sign(vo);
			return 1;
		}
	}
	
	// 아이디 중복 조회
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(mapper.check_Id(id));
		out.close();
		
	}
	// 이메일 중복 조회
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(mapper.check_Email(email));
		out.close();
	}
	// 휴대폰 중복 조회
	@Override
	public void check_tel(String tel, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(mapper.check_Tel(tel));
		out.close();
	}

	// 아이디 찾기
	@Override
	public MemberVO findId(HttpServletResponse response, MemberVO vo) throws Exception {
		
		// out.println을 쓰기 위한 선언
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberVO id = mapper.findId(vo);


		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	// 비밀번호 찾기
	@Override
	public MemberVO findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		
		// out.println을 쓰기 위한 선언
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberVO pw = mapper.findPw(vo);


			return pw;
	}
	
//	@Override
//	public void sendEmail(MemberVO vo, String div) throws Exception {
//		// Mail Server 설정
//		String charSet = "utf-8";
//		String hostSMTP = "smtp.gmail.com";
//		String hostSMTPid = "JejuMaster@gmail.com";
//		String hostSMTPpwd = "hallabong123";
//
//		// 보내는 사람 EMail, 제목, 내용
//		String fromEmail = "JejuMaster@gmail.com";
//		String fromName = "Halabong";
//		String subject = "";
//		String msg = "";
//
//		if(div.equals("findPw")) {
//			subject = "hallabong 임시 비밀번호 입니다.";
//			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
//			msg += "<h3 style='color: blue;'>";
//			msg += vo.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
//			msg += "<p>임시 비밀번호 : ";
//			msg += vo.getPw() + "</p></div>";
//		}
//
//		// 받는 사람 E-Mail 주소
//		String mail = vo.getEmail();
//		try {
//			HtmlEmail email = new HtmlEmail();
//			email.setDebug(true);
//			email.setCharset(charSet);
//			email.setSSL(true);
//			email.setHostName(hostSMTP);
//			email.setSmtpPort(465); //네이버 이용시 587
//
//			email.setAuthentication(hostSMTPid, hostSMTPpwd);
//			email.setTLS(true);
//			email.addTo(mail, charSet);
//			email.setFrom(fromEmail, fromName, charSet);
//			email.setSubject(subject);
//			email.setHtmlMsg(msg);
//			email.send();
//		} catch (Exception e) {
//			System.out.println("메일발송 실패 : " + e);
//		}
//	}

	@Override
	public MemberVO changePw(HttpServletResponse response, MemberVO vo) throws Exception {
		
		log.info("비밀번호 변경 ServiceImpl : " + vo);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 아이디가 없으면
		if(mapper.checkId(vo.getId()) == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			log.info("비밀번호 변경 ServiceImpl getid : " + vo.getId());
			return null;
		}
		else if(mapper.checkEmail(vo) == null) {
				log.info("비밀번호 변경 ServiceImpl vo : " + vo);
				log.info("비밀번호 변경 ServiceImpl getEmail : " + vo.getEmail());
				out.println("<script>");
				out.println("alert('등록되지 않은 이메일 입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPw(pw);
			// 비밀번호 변경
			mapper.updatePw(vo);
			// 비밀번호 변경 메일 발송
//			sendEmail(vo, "findPw");
//			log.info("비밀번호 변경 ServiceImpl : " + vo);
			
			return vo;
		}
	}

	@Override
	public MemberVO myPage(LoginVO vo) throws Exception {
		
		return mapper.myPage(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) throws Exception {
		
		return mapper.updateMember(vo);
	}
	
	@Override
	public int exMemberUpdate(MemberVO vo) throws Exception {
		
		return mapper.exUpdateMember(vo);
	}

	@Override
	public int memberWithdraw(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberVO data = mapper.findPw(vo);
		
		log.info("memberWithdraw().vo : " + vo);
		log.info("memberWithdraw().data : " + data);
		
		if(data == null) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			//탈퇴하면 로그아웃 시킨다.
			session.removeAttribute("login");
		}
		return mapper.memberWithdraw(vo);
	}
	
	
	
	
	
	/* 관리자 */
	@Override
	public List<MemberVO> memberList(PageObject pageObject) throws Exception {

		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("pageObject : " + pageObject);
		
		return mapper.memberList(pageObject);
	}

	@Override
	public int gradeModify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.grade(vo);
	}

	@Override
	public MemberVO view(String id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(id);
	}
	




}
 