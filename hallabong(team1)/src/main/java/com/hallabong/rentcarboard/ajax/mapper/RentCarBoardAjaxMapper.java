package com.hallabong.rentcarboard.ajax.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.domain.RentCarSynthesizeDTO;
import com.hallabong.rentcarboard.rentcarcompany.domain.RentCarBoardRentCarCompanyVO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardAjaxMapper {

	//보험내용 등록
	public int writeCarInsurance(RentCarBoardCarInsuranceVO vo);
	
	//회사 정보 가져오기
	public RentCarBoardRentCarCompanyVO getCompany(long companyNo);
	
	//차량 보험 수정 ajax
	public int updateCarInsurance(RentCarBoardCarInsuranceVO vo);
	
	//차량 보험 삭제 ajax
	public int deleteCarInsurance(long insuranceNo);
}
