package com.hallabong.tour.mapper;

import java.util.List;

import com.hallabong.tour.vo.TourVO;
import com.hallabong.util.pageobject.TourPageObject;

public interface TourMapper {
	
	// list
	public List<TourVO> list(TourPageObject pageObject) throws Exception;
	// 전체 데이터 개수 가져오기
	public long getTotalRow(TourPageObject pageObject) throws Exception;
	
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
	
	public int unlike(TourVO vo) throws Exception;

}
