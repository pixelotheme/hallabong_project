package com.hallabong.diner.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.diner.vo.ReplyVO;
import com.webjjang.util.PageObject;

public interface ReplyMapper {

	// 댓글 목록
	public List<ReplyVO> getListWithPaging(
			@Param("pageObject") PageObject pageObject,
			@Param("no") Long no
	);
	
	// 해당 글번호 댓글의 전체 데이터 개수 가져오기
	public Long getCountByNo(Long no);
	
	// 댓글 등록
	public int insert(ReplyVO vo);
	
	// 댓글 수정
	public int update(ReplyVO vo);
	
	// 댓글 삭제
	public int delete(Long rno);
	
}
