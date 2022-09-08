package com.hallabong.hotelbooking.service;

import java.util.List;

import com.hallabong.hotelbooking.vo.HotelBookingVO;
import com.webjjang.util.PageObject;

public interface HotelBookingService {
	
	public List<HotelBookingVO> list(PageObject pageObject) throws Exception;

	public HotelBookingVO view(long hbno) throws Exception;
	
	public int write(HotelBookingVO vo) throws Exception;
	
	public int update(HotelBookingVO vo) throws Exception;
	
	public int delete(long hbno) throws Exception;
}
