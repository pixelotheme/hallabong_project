package com.hallabong.faq.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.faq.mapper.FaqMapper;
import com.hallabong.faq.vo.FaqVO;
import com.webjjang.util.PageObject;

@Service
@Qualifier("FaqServiceImpl")
public class FaqServiceImpl implements FaqService{

	@Inject
	private FaqMapper mapper;
	
	// 리스트
	@Override
	public List<FaqVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}

	// 보기
	@Override
	public FaqVO view(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	// 등록
	@Override
	public int write(FaqVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	// 수정
	@Override
	public int update(FaqVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	// 삭제
	@Override
	public int delete(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

}
