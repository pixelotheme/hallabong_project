package com.hallabong.rentcarboard.rentcarcompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.rentcarcompany.domain.RentCarBoardRentCarCompanyVO;
import com.hallabong.rentcarboard.rentcarcompany.mapper.RentCarBoardRentCarCompanyMapper;
import com.hallabong.rentcarboard.util.PageObjectCustom;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("rcc")
@Log4j
public class RentCarBoardRentCarCompanyServiceImpl implements RentCarBoardRentCarCompanyService {

	@Autowired
	private RentCarBoardRentCarCompanyMapper mapper;
	
	@Override
	public List<RentCarBoardRentCarCompanyVO> rentCarCompanyList(PageObjectCustom pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRowRentCarCompany(pageObject));
		
		return mapper.rentCarCompanyList(pageObject);
	}

	@Override
	public RentCarBoardRentCarCompanyVO getCompany(long carNo) {
		// TODO Auto-generated method stub
		return mapper.getCompany(carNo);
	}
	@Override
	public int writeRentCarCompany(RentCarBoardRentCarCompanyVO vo) {
		// TODO Auto-generated method stub
		return mapper.writeRentCarCompany(vo);
	}

	@Override
	public List<RentCarBoardRentCarCompanyVO> getAllCompany() {
		// TODO Auto-generated method stub
		return mapper.getAllCompany();
	}

	@Override
	public int deleteCompany(long companyNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCompany(companyNo);
	}

	@Override
	public int updateRentCarCompany(RentCarBoardRentCarCompanyVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateRentCarCompany(vo);
	}


}
