package com.hallabong.rentcarboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.rentcarboard.domain.RentCarBoardCarsVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardMapper {

	
	//전체 데이터 가져오기
	public List<RentCarSynthesizeDTO> list(PageObjectCustom pageObject);
	//페이징 위해 전체 데이터 가져와야함
	public long getTotalRow(PageObjectCustom pageObject);
	
	//차내용
	public RentCarBoardCarsVO getCars(long carNo);
	
	//차량 
	public int writeCarGetCarNo(RentCarBoardCarsVO carsVO);

	//차량 수정
	public int updateCar(RentCarBoardCarsVO carsVO);
	
	public int deleteCar(long carNo);
	
}
