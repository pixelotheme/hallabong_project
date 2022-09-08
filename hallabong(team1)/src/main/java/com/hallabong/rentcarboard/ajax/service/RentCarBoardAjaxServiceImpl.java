package com.hallabong.rentcarboard.ajax.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.ajax.mapper.RentCarBoardAjaxMapper;
import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.mapper.RentCarBoardMapper;
import com.hallabong.rentcarboard.rentcarcompany.domain.RentCarBoardRentCarCompanyVO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("rcbasi")
@Log4j
public class RentCarBoardAjaxServiceImpl implements RentCarBoardAjaxService {

	@Autowired
	private RentCarBoardAjaxMapper mapper;
	
	//차보험
	@Override
	public int writeCarInsurance(RentCarBoardCarInsuranceVO vo) {
		// TODO Auto-generated method stub
		return mapper.writeCarInsurance(vo);
	}

	@Override
	public RentCarBoardRentCarCompanyVO getCompany(long companyNo) {
		// TODO Auto-generated method stub
		return mapper.getCompany(companyNo);
	}

	@Override
	public int updateCarInsurance(RentCarBoardCarInsuranceVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateCarInsurance(vo);
	}

	@Override
	public int deleteCarInsurance(long insuranceNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCarInsurance(insuranceNo);
	}

}
