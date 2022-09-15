package com.hallabong.diner.service;

import java.util.List;

import com.hallabong.diner.vo.ReplyVO;
import com.webjjang.util.PageObject;

public interface ReplyService {

	// 댓글 리스트
	public List<ReplyVO> getList(PageObject pageObject, Long no);
	
	// 댓글 등록
	public int register(ReplyVO vo);
	
	// 댓글 수정
	public int modify(ReplyVO vo);
	
	// 댓글 삭제
	public int remove(Long rno);
}
