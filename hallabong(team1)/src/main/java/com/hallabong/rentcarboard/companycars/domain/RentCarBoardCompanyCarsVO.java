package com.hallabong.rentcarboard.companycars.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RentCarBoardCompanyCarsVO {

	private Long companyCarsNo;
	private Long carNo;
	private Long companyNo;
	private String licensePlate; // 번호판
	private Long booking; //예약 상황 1이면 예약중
	private String consumerId; //예약자 아이디
	private Date writeDate;
	private Date updateDate;
	private String id;
}
