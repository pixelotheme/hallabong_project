package com.hallabong.rentcarboard.caroption.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.caroption.domain.RentCarBoardCarOptionVO;
import com.hallabong.rentcarboard.caroption.mapper.RentCarBoardCarOptionMapper;

@Service
@Qualifier("cop")
public class RentCarBoardCarOptionServiceImpl implements RentCarBoardCarOptionService{

	@Autowired
	private RentCarBoardCarOptionMapper mapper;

	@Override
	public RentCarBoardCarOptionVO getCarOption(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCarOption(carNo);
	}

	@Override
	public int writeCarOption(RentCarBoardCarOptionVO rentCarBoardCarOptionVO, long carNo) {
		// TODO Auto-generated method stub
		rentCarBoardCarOptionVO.setCarNo(carNo);
		
		return mapper.writeCarOption(rentCarBoardCarOptionVO);
	}

	@Override
	public int updateCarOption(RentCarBoardCarOptionVO carOptionVO) {
		// TODO Auto-generated method stub
		return mapper.updateCarOption(carOptionVO);
	}
	
	
}
