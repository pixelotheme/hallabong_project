package com.hallabong.diner.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.diner.mapper.ReplyMapper;
import com.hallabong.diner.vo.ReplyVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("replyServiceImpl")
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	// 댓글 리스트
	@Override
	public List<ReplyVO> getList(PageObject pageObject, Long no) {
		// TODO Auto-generated method stub
		log.info("get Reply List of a Board - no : " + no);
		pageObject.setTotalRow(mapper.getCountByNo(no));
		return mapper.getListWithPaging(pageObject, no);
	}

	// 댓글 등록
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("register ... vo : " + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("modify ... vo : " + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		log.info("remove ... rno : " + rno);
		
		return mapper.delete(rno);
	}

}
