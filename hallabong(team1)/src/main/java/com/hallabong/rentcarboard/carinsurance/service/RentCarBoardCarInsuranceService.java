package com.hallabong.rentcarboard.carinsurance.service;

import java.util.List;

import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;

public interface RentCarBoardCarInsuranceService {
	//보험
	public List<RentCarBoardCarInsuranceVO> getCarInsurance(long carNo);
}
