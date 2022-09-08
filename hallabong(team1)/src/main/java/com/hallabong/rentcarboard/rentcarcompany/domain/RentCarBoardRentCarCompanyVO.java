package com.hallabong.rentcarboard.rentcarcompany.domain;

import lombok.Data;

@Data
public class RentCarBoardRentCarCompanyVO {

	//렌트카 회사
	private long companyNo;
	private String companyName;//회사이름
	private String tel;
	private String address;
	private String id; //등록한 아이디
	
	//주소 합치기위한 변수선언
	private String zipcode; // 우편번호
	private String streetAdr; //도로명
	private String detailAdr;// 상세주소
	
		
}
