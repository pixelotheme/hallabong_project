package com.hallabong.rentcarboard.companycars.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.companycars.domain.RentCarBoardCompanyCarsSynthesizeVO;
import com.hallabong.rentcarboard.companycars.domain.RentCarBoardCompanyCarsVO;
import com.hallabong.rentcarboard.companycars.mapper.RentCarBoardCompanyCarsMapper;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("ccs")
@Log4j
public class RentCarBoardCompanyCarsServiceImpl implements RentCarBoardCompanyCarsService {
	

	@Autowired
	private RentCarBoardCompanyCarsMapper mapper;
	
	
	@Override
	public List<RentCarBoardCompanyCarsSynthesizeVO> getCompanyCarsList(PageObjectCustom pageObject, long carNo,
			long companyNo) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRowForCompanyCars(pageObject, carNo, companyNo));
		
		return mapper.getCompanyCarsList(pageObject, carNo, companyNo);
	}
	@Override
	public long getTotalRowForCompanyCars(PageObjectCustom pageObject, long carNo, long companyNo) {
		// TODO Auto-generated method stub
		return mapper.getTotalRowForCompanyCars(pageObject, carNo, companyNo);
	}

	@Override
	public int writeCompanyCars(RentCarBoardCompanyCarsVO companyCarsVO) {
		// TODO Auto-generated method stub
		return mapper.writeCompanyCars(companyCarsVO);
	}

	@Override
	public RentCarBoardCompanyCarsVO viewCompanyCars(long companyCarsNo) {
		// TODO Auto-generated method stub
		return mapper.viewCompanyCars(companyCarsNo);
	}

	@Override
	public int updateCompanyCars(RentCarBoardCompanyCarsVO companyCarsVO) {
		// TODO Auto-generated method stub
		return mapper.updateCompanyCars(companyCarsVO);
	}

	@Override
	public int deleteCompanyCars(long companyCarsNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCompanyCars(companyCarsNo);
	}




}
