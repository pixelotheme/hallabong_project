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
		// TODO Auto-generated method stub
		return mapper.write(vo);
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
