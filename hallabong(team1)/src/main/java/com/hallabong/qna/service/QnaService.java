package com.hallabong.qna.service;

import java.util.List;

import com.hallabong.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public interface QnaService {

	// 리스트
	public List<QnaVO> list(PageObject pageObject) throws Exception;
	
	// 질문하기(write)
	public int write(QnaVO vo) throws Exception;
	
	// QNA 글 보기
	public List<QnaVO> view(Integer no, Integer refNo) throws Exception;
	
	// 답변하기
	public int answer(QnaVO vo) throws Exception;
	
	// 수정하기
	public List<QnaVO> update(QnaVO vo) throws Exception;
	
	// 삭제하기
	public int delete(Integer no) throws Exception;
	
}
