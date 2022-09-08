package com.hallabong.rentcarboard.carbasicinfo.service;

import java.util.List;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardSynthesizeVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardCarBasicInfoService {
	//carBasicInfo 
	public List<RentCarBoardSynthesizeVO> carBasicInfoList(PageObjectCustom pageObject);
	
	public RentCarBoardCarBasicInfoVO getCarBasicInfo(long carInfoNo);
	
	
	//write
	public int writeCarBasicInfoGetCarInfoNo(RentCarBoardCarBasicInfoVO carBasicInfoVO);
	
	//update
	public int updateCarBasicInfo(RentCarBoardCarBasicInfoVO carBasicInfoVO);
	//delete
	public int deleteCarBasicInfo(long carInfoNo);
	
	//차량 등록시 기본 차량정보 선택
	public List<RentCarBoardCarBasicInfoVO> getAllCarBasicInfo();
}
