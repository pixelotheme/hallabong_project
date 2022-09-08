package com.hallabong.rentcarbooking.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class RentCarBookingVO {

	private Long bookingNo;
	private String bookingStatus;
	private String consumerId;
	private String userName;
	private String userEmail;
	private String userTel;
	private Long totalPrice;
	private String paymentType;
	private String paymentCompany;
	private String paymentAccount;
	private String drivingLicense;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date rentalDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date returnDate;
	
	private Long prePrice;
	
	private Long companyCarsNo;
	private Long carNo;
	private Long companyNo;
	private Long carInfoNo;
	private String companyName;
	private String carName;
	private String carFuel;
	private String insuranceType;
	
}
