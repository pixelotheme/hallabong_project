package com.hallabong.rentcarboard.carinsurance.domain;

import lombok.Data;

@Data
public class RentCarBoardCarInsuranceVO {
	private Long carNo;
	private long insuranceNo;
	private String category; //일반자차,고급자차
	private Long insurancePrice; //보험금
	private Long insuranceAge; //보험가입 가능 나이
	private Long insuranceExperience; //보험가입 가능 운전경력
	private Long compensation; //보상 한도(숫자로만)
	private String customerCharge; //사고시 고객 부담금
}
