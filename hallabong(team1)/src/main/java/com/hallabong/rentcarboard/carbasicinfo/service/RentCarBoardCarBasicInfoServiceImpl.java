package com.hallabong.rentcarboard.carbasicinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardCarBasicInfoVO;
import com.hallabong.rentcarboard.carbasicinfo.domain.RentCarBoardSynthesizeVO;
import com.hallabong.rentcarboard.carbasicinfo.mapper.RentCarBoardCarBasicInfoMapper;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

@Service
@Qualifier("cbi")
public class RentCarBoardCarBasicInfoServiceImpl implements RentCarBoardCarBasicInfoService {

	@Autowired
	private RentCarBoardCarBasicInfoMapper mapper;
	
	@Override
	public List<RentCarBoardSynthesizeVO> carBasicInfoList(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRowForcarBasicInfo(pageObject));
		
		return mapper.carBasicInfoList(pageObject);
	}
	//추가
	@Override
	public RentCarBoardCarBasicInfoVO getCarBasicInfo(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.getCarBasicInfo(carInfoNo);
	}
	
	@Override
	public int writeCarBasicInfoGetCarInfoNo(RentCarBoardCarBasicInfoVO carBasicInfoVO) {
		// TODO Auto-generated method stub
		return mapper.writeCarBasicInfoGetCarInfoNo(carBasicInfoVO);
	}

	@Override
	public int updateCarBasicInfo(RentCarBoardCarBasicInfoVO carBasicInfoVO) {
		// TODO Auto-generated method stub
		return mapper.updateCarBasicInfo(carBasicInfoVO);
	}

	@Override
	public int deleteCarBasicInfo(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCarBasicInfo(carInfoNo);
	}
	@Override
	public List<RentCarBoardCarBasicInfoVO> getAllCarBasicInfo() {
		// TODO Auto-generated method stub
		
		
		return mapper.getAllCarBasicInfo();
	}

}
