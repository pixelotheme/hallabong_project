package com.hallabong.rentcarboard.service;

import java.util.List;

import com.hallabong.rentcarboard.domain.RentCarBoardCarsVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardService {
	//리스트가져오기
	public List<RentCarSynthesizeDTO> list(PageObjectCustom pageObject);
	
	//차내용
	public RentCarBoardCarsVO getCars(long carNo);
	
	//차량(등록후 바로 가장큰 번호 가져오기) ,차옵션, 보험, 사진 등록
	public int writeCarGetCarNo(RentCarBoardCarsVO carsVO);

	//차량 수정
	public int updateCar(RentCarBoardCarsVO carsVO);
	
	////차량삭제 -> 차옵션,보험,파일db 같이 자동삭제된다
	public int deleteCar(long carNo);
}


