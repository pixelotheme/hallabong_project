package com.hallabong.hotelbooking.mapper;

import java.util.List;


import com.hallabong.hotelbooking.vo.HotelBookingVO;
import com.webjjang.util.PageObject;

public interface HotelBookingMapper {
	
	public List<HotelBookingVO> list(PageObject pageObject) throws Exception;
	
	public long getTotalRow(PageObject pageObject) throws Exception;

	
	public HotelBookingVO view(long hbno) throws Exception;
	
	public int insertSelectKey(HotelBookingVO board);
		
	public int write(HotelBookingVO vo) throws Exception;
	
	
	public int update(HotelBookingVO vo) throws Exception;
	
	public int delete(long hbno) throws Exception;


}
