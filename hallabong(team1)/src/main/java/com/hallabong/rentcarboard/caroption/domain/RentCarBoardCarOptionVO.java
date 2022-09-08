package com.hallabong.rentcarboard.caroption.domain;

import lombok.Data;

@Data
public class RentCarBoardCarOptionVO {
	//차량 옵션
	//carNo 중복
	private Long carNo;
	private String smoking;
	private String navigation;
	private String blackbox;
	private String rearCamera;//전방카메라
	private String rearSensor;//후방센서
	private String frontSensor; 
	private String sunroof;
	private String bluetooth;
	private String heatingSheet; //열선시트
	private String heatingHandle; //열선핸들
	private String leatherSheet; //가죽시트
	private String ventilationSheet;//통풍시트
	private String carSeatPay;//유아용의자
	private String carSeatFree;
	private String driverAirbag;
	private String passengerAirbag;
	private String fourWheel;//4륜구동
	private String smartKey;
	private String rearAutomaticDoor;//후방 자동문
	private String freeCharge;//전기차 충전
	private String usb;
	private String aux;
	private String dmb;
	private String camping;
}
