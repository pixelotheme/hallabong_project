package com.hallabong.hotelbookingdate.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.hotelbookingdate.vo.HotelBookingDateVO;
import com.webjjang.util.PageObject;

public interface HotelBookingDateMapper {
	
	public List<HotelBookingDateVO> list(
			@Param("pageObject") PageObject pageObject,
			@Param("ro_no") Long ro_no) ;
	
	// 전체 댓글 개수 가져오기
	public Long getTotalRow(Long ro_no); 
	 
	// 예약 등록
	public int write(HotelBookingDateVO vo);
	
	// 예약 수정
	public int update(HotelBookingDateVO vo);
	
	



}
