package com.hallabong.rentcarbooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.util.PageObjectCustom;
import com.hallabong.rentcarbooking.domain.RentCarBookingVO;
import com.hallabong.rentcarbooking.mapper.RentCarBookingMapper;

import lombok.extern.log4j.Log4j;

@Qualifier("bookingService")
@Log4j
@Service
public class RentCarBookingServiceImpl implements RentCarBookingService {

	@Autowired
	private RentCarBookingMapper mapper;
	
	@Override
	public List<RentCarBookingVO> list(PageObjectCustom pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		return mapper.list(pageObject);
	}

	@Override
	public RentCarBookingVO view(long bookingNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(bookingNo);
	}

	//예약등록
	@Override
	public Long write(RentCarBookingVO vo) throws Exception {
		// TODO Auto-generated method stub
		log.info("서비스들어옴");
		
		return mapper.write(vo);
	}
	@Override
	public RentCarBookingVO getInfoForBooking(RentCarBookingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getInfoForBooking(vo);
	}
	@Override
	public RentCarBookingVO getCompanyCarsNo(Long carNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getCompanyCarsNo(carNo);
	}
	@Override
	public int updateCompanyCars(RentCarBookingVO vo, long booking) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateCompanyCars(vo, booking);
	}
	@Override
	public int writePayment(RentCarBookingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.writePayment(vo);
	}
	
	//예약수정
	@Override
	public int update(RentCarBookingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}
	@Override
	public int updatePayment(RentCarBookingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updatePayment(vo);
	}
	
	
	@Override
	public int delete(long bookingNoo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(bookingNoo);
	}











}
