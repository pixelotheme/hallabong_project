package com.hallabong.diner.service;

import java.util.List;

import com.hallabong.diner.vo.DinerVO;
import com.webjjang.util.PageObject;

public interface DinerService {

	// list
	public List<DinerVO> list(PageObject pageObject) throws Exception;
	
	// view
	public DinerVO view(long no, int inc) throws Exception;
	
	// write
	public int write(DinerVO vo) throws Exception;
	
	// update 
	public int update(DinerVO vo) throws Exception;
	
	// delete
	public int delete(long no) throws Exception;
	
}
