package com.hallabong.hotelbooking.vo;

import java.util.Date;

import lombok.Data;

@Data 
public class HotelBookingVO {
	
	private long hbno;
	private String id;
	private String name, tel, email;
	private String userName, userTel, userEmail;
	private String payOption, payType;
	private long confirmNo;
	private Date payDay, bookingDate;
	private String progress;
	private long ro_no;

}
