package com.hallabong.member.mapper;

import java.util.List;

import com.hallabong.member.vo.LoginVO;
import com.hallabong.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {
	
	// 로그인
	public LoginVO login(LoginVO vo);
	
	// 회원가입
	public int sign(MemberVO vo);
	
	// 중복검사 조회 리스트 갯수
	
	// 아이디
	public int check_Id(String id);
	// 이메일
	public int check_Email(String email);
	// 휴대폰번호
	public int check_Tel(String Tel);
	
	// 찐 중복 검사
	
	// 아이디
	public MemberVO checkId(String id);
	// 이메일
	public MemberVO checkEmail(MemberVO vo);
	// 휴대폰
	public MemberVO checkTel(MemberVO vo);
	
	// id , pw 찾기
	// 아이디
	public MemberVO findId(MemberVO vo);
	
	// 비밀번호 찾기
	public MemberVO findPw(MemberVO vo);
	
	// 비밀번호 변경
	public int changePw(MemberVO vo);
	
	// 내정보 보기
	public MemberVO myPage(LoginVO vo);
	
	// 회원정보 수정
	public int memberUpdate(MemberVO vo);
	
	
	// 회원 탈퇴
	public int memberWithdraw(MemberVO vo);
	
	
	
	
	// ******************************* 관리자  *****************************************
	
	//  회원 리스트
	public List<MemberVO> memberList(PageObject pageObject);
	
	//  회원 수
	public Long getTotalRow(PageObject pageObject);
	
	// 회원 등급 변경
	public int gradeModify(MemberVO vo);
	
	// 회원 보기
	public MemberVO view(String id);	
	
	
	
}
