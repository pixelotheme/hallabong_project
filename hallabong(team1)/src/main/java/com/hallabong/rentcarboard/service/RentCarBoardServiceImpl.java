package com.hallabong.rentcarboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.domain.RentCarBoardCarsVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.mapper.RentCarBoardMapper;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("rcbsi")
@Log4j
public class RentCarBoardServiceImpl implements RentCarBoardService {

	@Autowired
	private RentCarBoardMapper mapper;
	
	//리스트 한번에 뽑기
	@Override
	public List<RentCarSynthesizeDTO> list(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("렌트카 리스트...." + pageObject);
		

		List<RentCarSynthesizeDTO> dto = mapper.list(pageObject);
		
		log.info("list dto :" + dto);
		
		return dto;
	}

	@Override
	public RentCarBoardCarsVO getCars(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCars(carNo);
	}

	@Override
	public int writeCarGetCarNo(RentCarBoardCarsVO carsVO) {
		// TODO Auto-generated method stub
		return mapper.writeCarGetCarNo(carsVO);
	}

	@Override
	public int updateCar(RentCarBoardCarsVO carsVO) {
		// TODO Auto-generated method stub
		return mapper.updateCar(carsVO);
	}

	@Override
	public int deleteCar(long carNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCar(carNo);
	}





}
