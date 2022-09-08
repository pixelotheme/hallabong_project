package com.hallabong.rentcarbooking.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.rentcarboard.util.PageObjectCustom;
import com.hallabong.rentcarbooking.domain.RentCarBookingVO;

public interface RentCarBookingMapper {

	//예약 리스트
	public List<RentCarBookingVO> list(PageObjectCustom pageObject) throws Exception;
	public long getTotalRow(PageObjectCustom pageObject) throws Exception;

	
	//예약 글보기
	public RentCarBookingVO view(long bookingNo) throws Exception;
	
	//예약 등록
	public Long write(RentCarBookingVO vo) throws Exception;
	//예약 등록을 위한 필수 정보 가져오기
	public RentCarBookingVO getInfoForBooking(RentCarBookingVO vo) throws Exception;
	//해당 차량의 회사차량번호 가져오기
	public RentCarBookingVO getCompanyCarsNo(Long carNo) throws Exception;
	//등록시 번호판 예약상황 업데이트
	public int updateCompanyCars(@Param("vo") RentCarBookingVO vo,@Param("booking") long booking)throws Exception;
	//차량 등록후 결제 정보 업데이트
	public int writePayment(RentCarBookingVO vo) throws Exception;
	
	
	
	//예약 수정
	public int update(RentCarBookingVO vo) throws Exception;
	//payment 수정
	public int updatePayment(RentCarBookingVO vo)throws Exception;
	
	//예약 삭제
	public int delete(long nbookingNo) throws Exception;
	
	
}
