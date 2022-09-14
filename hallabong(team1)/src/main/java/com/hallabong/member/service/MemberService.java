package com.hallabong.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hallabong.member.vo.LoginVO;
import com.hallabong.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public interface MemberService {
	
	// 로그인
	public LoginVO login(LoginVO vo, HttpServletResponse response) throws Exception;
	// 회원가입
	public int sign(MemberVO vo, HttpServletResponse response) throws Exception;
	
	// 아이디 찾기
	public MemberVO findId(HttpServletResponse response, MemberVO vo) throws Exception;
	
	// 비밀번호 변경
	public MemberVO changePw(HttpServletResponse response, MemberVO vo) throws Exception;

	// 비밀번호찾기
	public MemberVO findPw(HttpServletResponse response, MemberVO vo) throws Exception;
	
	// 아이디 중복 체크
	public void check_id(String id, HttpServletResponse response) throws Exception;
	
	// 이메일 중복 체크
	public void check_email(String email, HttpServletResponse response) throws Exception;

	// 전화번호 중복 체크
	public void check_tel(String tel, HttpServletResponse response) throws Exception;
	
	// 회원 정보 보기
	public MemberVO myPage(LoginVO vo) throws Exception;
	
	// 회원 정보 수정
	public int memberUpdate(MemberVO vo) throws Exception;
	
	
	
	// 회원 탈퇴
	public int memberWithdraw(MemberVO vo,HttpServletResponse response, HttpSession session) throws Exception;
	
	/* 관리자 */
	// 회원 리스트
	public List<MemberVO> memberList(PageObject pageObject) throws Exception;
	
	// 회원 등급 수정
	public int gradeModify(MemberVO vo) throws Exception;
	
	// 회원 정보 보기
	public MemberVO view(String id) throws Exception;


}
