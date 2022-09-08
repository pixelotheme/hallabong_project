package com.hallabong.rentcarboard.companycars.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.rentcarboard.carinsurance.domain.RentCarBoardCarInsuranceVO;
import com.hallabong.rentcarboard.companycars.domain.RentCarBoardCompanyCarsSynthesizeVO;
import com.hallabong.rentcarboard.companycars.domain.RentCarBoardCompanyCarsVO;
import com.hallabong.rentcarboard.util.PageObjectCustom;

public interface RentCarBoardCompanyCarsService {
	//회사 차량 번호판 리스트 
	public List<RentCarBoardCompanyCarsSynthesizeVO> getCompanyCarsList(@Param("pageObject") PageObjectCustom pageObject ,@Param("carNo")long carNo,@Param("companyNo") long companyNo);
	public long getTotalRowForCompanyCars(PageObjectCustom pageObject ,long carNo,long companyNo);
	
	//화사 차량 번호판 등록
	public int writeCompanyCars(RentCarBoardCompanyCarsVO companyCarsVO);
	//회사 차량 번호판 보기
	public RentCarBoardCompanyCarsVO viewCompanyCars(long companyCarsNo);
	//회사 차량 번호판 수정
	public int updateCompanyCars(RentCarBoardCompanyCarsVO companyCarsVO);
	//회사 차량 번호판 삭제
	public int deleteCompanyCars(long companyCarsNo);
}
