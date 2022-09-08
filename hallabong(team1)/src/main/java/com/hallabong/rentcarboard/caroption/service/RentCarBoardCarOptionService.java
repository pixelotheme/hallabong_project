package com.hallabong.rentcarboard.caroption.service;

import com.hallabong.rentcarboard.caroption.domain.RentCarBoardCarOptionVO;

public interface RentCarBoardCarOptionService {
	
	public RentCarBoardCarOptionVO getCarOption(long carNo);
	
	public int writeCarOption(RentCarBoardCarOptionVO carOptionVO, long carNo);
	//차량 옵션 수정
	public int updateCarOption(RentCarBoardCarOptionVO carOptionVO);
	
}
