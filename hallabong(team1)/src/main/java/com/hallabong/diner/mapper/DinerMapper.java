package com.hallabong.diner.mapper;

import java.util.List;

import com.hallabong.diner.vo.DinerVO;
import com.webjjang.util.PageObject;

public interface DinerMapper {

	// list
	public List<DinerVO> list(PageObject pageObject) throws Exception;
	// 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	// view
	public DinerVO view(long no) throws Exception;
	
	// 조회수 
	public int increase(long no) throws Exception;
	
	// write
	public int write(DinerVO vo) throws Exception;
	
	// update 
	public int update(DinerVO vo) throws Exception;
	
	// delete
	public int delete(long no) throws Exception;
	
	
}
