package com.hallabong.qna.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.qna.mapper.QnaMapper;
import com.hallabong.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

@Service
@Qualifier("QnaServiceImpl")
public class QnaServiceImpl implements QnaService{

	@Inject
	private QnaMapper mapper;
	
	// 리스트
	@Override
	public List<QnaVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}

	// 질문(write)
	@Override
	public int write(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	// QNA 보기
	@Override
	public List<QnaVO> view(long no, long refNo) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.view(no, refNo);
	}
	
	// 답변하기
	@Override
	public int answer(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		vo.setOrdNo(vo.getOrdNo() + 1);
		vo.setLevNo(vo.getLevNo() + 1);
		vo.setParentNo(vo.getParentNo() + 1);
		
		// 순서 번호 1증가
		mapper.increaseOrdNo(vo);
		
		return mapper.answer(vo);
	}

	// 수정
	@Override
	public int update(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	// 삭제
	@Override
	public int delete(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}


}
