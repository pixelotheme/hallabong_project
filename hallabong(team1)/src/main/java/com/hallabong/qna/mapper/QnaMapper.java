package com.hallabong.qna.mapper;

import java.util.List;

import com.hallabong.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public interface QnaMapper {

		// 리스트
		public List<QnaVO> list(PageObject pageObject) throws Exception;
		// 전체 데이터 개수
		public long getTotalRow(PageObject pageObject) throws Exception;
		
		// 질문하기(write)
		public int write(QnaVO vo) throws Exception;
		
		// QNA 글 보기
		public QnaVO view(long no) throws Exception;
		
		// 답변하기
		public int answer(QnaVO vo) throws Exception;
		// 순서 번호 증가
		public int increaseOrdNo(QnaVO vo) throws Exception;
		
		// 수정하기
		public int update(QnaVO vo) throws Exception;
		
		// 삭제하기
		public int delete(long no) throws Exception;
	
}
