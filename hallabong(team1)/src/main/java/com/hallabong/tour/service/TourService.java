package com.hallabong.tour.service;

import java.util.List;

import com.hallabong.tour.vo.TourVO;
import com.hallabong.util.pageobject.TourPageObject;

public interface TourService {
	
	// list
	public List<TourVO> list(TourPageObject pageObject) throws Exception;
	
	// view
	public TourVO view(long no) throws Exception;
	
	// imageChange 처리
	public int imageChange(TourVO vo) throws Exception;
	
	// write 처리
	public int write(TourVO vo) throws Exception;
	
	// update 처리
	public int update(TourVO vo) throws Exception;
	
	// delete 처리
	public int delete(long no) throws Exception;
	
	
	public int like(TourVO vo) throws Exception;
	
	public int unlike(TourVO vo)throws Exception;

}
