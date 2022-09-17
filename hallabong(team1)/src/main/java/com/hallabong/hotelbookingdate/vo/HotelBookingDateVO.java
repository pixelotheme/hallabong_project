package com.hallabong.hotelbookingdate.vo;

import java.util.Date;

import lombok.Data;

@Data
public class HotelBookingDateVO {
	
	private long bono;
	private Date checkin, checkout;
	private long ro_no;
	private long hbno;

}
