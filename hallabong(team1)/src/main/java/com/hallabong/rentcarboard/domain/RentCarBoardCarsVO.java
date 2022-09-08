package com.hallabong.rentcarboard.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class RentCarBoardCarsVO {
	//cars 테이블 차등록
	private Long carNo;
	private Long carInfoNo;
	private long companyNo;
	//companyNo 중복 - 각자 테이블 입력으로 변경
//	private String carName;
	private Long price;
	private String gearbox;
	private String insuranceType;
//	private String carTypes;
	private Long rentAge; //차량 대여 가능 나이
	private Long rentExperience; //차량 대여 가능 운전경력
//	private String carFuel; // 차 연료 종류
//	private Long carCapacity; // 승차정원
	private String license; //면허종류
	private String insuranceInfo; //보험안내
	private String rentCarNote; // 참고사항
	private String cancelAndRefund; // 취소,환불
	private Date writeDate;
	private Date updateDate;
	private String modelYears; //date 로 변경 -> 다시 string으로 설정
//	@DateTimeFormat(pattern = "yyyy-MM")
//	private Date modelYears; //date 로 변경 -> 다시 string으로 설정
	private String id;//id 중복 
}
