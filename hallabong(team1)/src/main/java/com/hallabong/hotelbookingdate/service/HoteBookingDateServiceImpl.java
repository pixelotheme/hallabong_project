package com.hallabong.hotelbookingdate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.hotelbookingdate.mapper.HotelBookingDateMapper;
import com.hallabong.hotelbookingdate.vo.HotelBookingDateVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
@Qualifier("hotelBookingDateServiceImpl")
public class HoteBookingDateServiceImpl implements HotelBookingDateService{
	
	private HotelBookingDateMapper mapper;

	@Override
	public List<HotelBookingDateVO> list(PageObject pageObject, Long ro_no) {
		// 이미지 번호에 맞는 전체 데이터 개수 처리 -> 안하면 데이터 안나옴.
		pageObject.setTotalRow(mapper.getTotalRow(ro_no));
		
		return mapper.list(pageObject, ro_no);
	}

	@Override
	public int write(HotelBookingDateVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(HotelBookingDateVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}


	
	

}
