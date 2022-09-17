package com.hallabong.hotelbookingdate.service;

import java.util.List;

import com.hallabong.hotelbookingdate.vo.HotelBookingDateVO;
import com.webjjang.util.PageObject;

public interface HotelBookingDateService { 
	
	
	//list
	public List<HotelBookingDateVO> list(PageObject pageObject, Long ro_no);

	// write
	public int write(HotelBookingDateVO vo);
	
	// update
	public int update(HotelBookingDateVO vo);
	

}


