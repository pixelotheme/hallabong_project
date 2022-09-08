package com.hallabong.rentcarboard.carbasicinfo.mapper;

import java.util.List;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardSynthesizeVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardCarBasicInfoMapper {

	//carBasicInfo 
	public List<RentCarBoardSynthesizeVO> carBasicInfoList(PageObjectCustom pageObject);
	//페이징을 위한 전체개수
	public long getTotalRowForcarBasicInfo(PageObjectCustom pageObject);
	
	//추가 차 이름 등
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
