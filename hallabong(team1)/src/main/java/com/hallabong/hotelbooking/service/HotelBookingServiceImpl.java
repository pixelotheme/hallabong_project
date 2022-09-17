package com.hallabong.hotelbooking.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.hotelbooking.mapper.HotelBookingMapper;
import com.hallabong.hotelbooking.vo.HotelBookingVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@Qualifier("hotelBookingServiceImpl")
public class HotelBookingServiceImpl implements HotelBookingService {
	
	@Setter(onMethod_ = {@Autowired})
	private HotelBookingMapper mapper; 

	@Override
	public List<HotelBookingVO> list(PageObject pageObject) throws Exception {
		
	pageObject.setTotalRow(mapper.getTotalRow(pageObject));;
		
		return mapper.list(pageObject); 
	}

	@Override
	public HotelBookingVO view(long hbno) throws Exception {
		
		
		return mapper.view(hbno);
	}

	@Override
	public int write(HotelBookingVO vo) throws Exception {
		log.info("예약 등록 - vo : " + vo);
		//게시판 테이블 글등록 - board의 bno가 세팅되서 나온다.
		int result = mapper.insertSelectKey(vo);
		
		log.info("예약 등록 -result : " + result);
	
		return result;
	}

	@Override
	public int update(HotelBookingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long hbno) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(hbno);
	}

}
