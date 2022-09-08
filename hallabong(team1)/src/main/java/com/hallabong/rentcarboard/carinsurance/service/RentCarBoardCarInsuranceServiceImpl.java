package com.hallabong.rentcarboard.carinsurance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.carinsurance.mapper.RentCarBoardCarInsuranceMapper;

@Service
@Qualifier("cis")
public class RentCarBoardCarInsuranceServiceImpl implements RentCarBoardCarInsuranceService {

	@Autowired
	private RentCarBoardCarInsuranceMapper mapper;
	
	@Override
	public List<RentCarBoardCarInsuranceVO> getCarInsurance(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCarInsurance(carNo);
	}

}
