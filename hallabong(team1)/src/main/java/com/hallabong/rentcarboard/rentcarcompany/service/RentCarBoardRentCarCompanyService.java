package com.hallabong.rentcarboard.rentcarcompany.service;

import java.util.List;

import com.hallabong.rentcarboard.rentcarcompany.domain.RentCarBoardRentCarCompanyVO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardRentCarCompanyService {
	
	//렌트카 회사 리스트
	public List<RentCarBoardRentCarCompanyVO> rentCarCompanyList(PageObjectCustom pageObject);

	//회사내용
	public RentCarBoardRentCarCompanyVO getCompany(long carNo);
	
	//회사 등록
	public int writeRentCarCompany(RentCarBoardRentCarCompanyVO vo);

	//회사 수정 때 선택가능 ( 보기 도 포함 )
	public List<RentCarBoardRentCarCompanyVO> getAllCompany();
	
	//회사 수정
	public int updateRentCarCompany(RentCarBoardRentCarCompanyVO vo);
	
	
	//회사 삭제
	public int deleteCompany(long companyNo);
}
