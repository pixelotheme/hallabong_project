package com.hallabong.rentcarboard.carinsurance.mapper;

import java.util.List;

import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;


public interface RentCarBoardCarInsuranceMapper {
	//보험
	public List<RentCarBoardCarInsuranceVO> getCarInsurance(long carNo);
}
