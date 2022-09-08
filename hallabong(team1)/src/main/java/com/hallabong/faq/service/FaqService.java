package com.hallabong.faq.service;

import java.util.List;

import com.hallabong.faq.vo.FaqVO;
import com.webjjang.util.PageObject;

public interface FaqService {

	// 리스트&보기
	public List<FaqVO> list(PageObject pageObject) throws Exception;
	public FaqVO view(Integer no) throws Exception;
	
	// 등록
	public int write(FaqVO vo) throws Exception;
	
	// 수정
	public int update(FaqVO vo) throws Exception;
	
	// 삭제
	public int delete(Integer no) throws Exception;
	
}
