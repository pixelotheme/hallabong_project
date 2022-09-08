package com.hallabong.rentcarboard.caroption.mapper;

import com.hallabong.rentcarboard.caroption.domain.RentCarBoardCarOptionVO;

public interface RentCarBoardCarOptionMapper {

	public RentCarBoardCarOptionVO getCarOption(long carNo);
	
	public int writeCarOption(RentCarBoardCarOptionVO rentCarBoardCarOptionVO);
	//차량 옵션 수정
	public int updateCarOption(RentCarBoardCarOptionVO carOptionVO);
	
	
}
