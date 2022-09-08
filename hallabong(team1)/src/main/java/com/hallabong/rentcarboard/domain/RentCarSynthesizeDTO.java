package com.hallabong.rentcarboard.domain;


import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RentCarSynthesizeDTO {

	
	//렌트카 회사
	private long companyNo;
	private String companyName;//회사이름
	private String tel;
	private String address;
	private String id; //등록한 아이디

	
	//cars 테이블 차등록
	private Long carNo;
	//companyNo 중복 - 
//	private String carName;
	private Long price;
	private String gearbox;
	private String insuranceType; //자자포함 미포함 여부
//	private String carTypes; //중형, 대형....
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
	@DateTimeFormat(pattern = "yyyy-MM")
	private Date modelYears;
	//id 중복 
	
	//carBasicInfo 테이블 생성 - 고정된 정보
	private Long carInfoNo;
	private String carName;
	private String carTypes;
	private String carFuel;
	private Long carCapacity;
	
	//회사차량 번호판 추가
	private Long companyCarsNo; //화사 차 번호
//	private Long carNo; 중복
//	private Long carInfoNo; 중복
//	private long companyNo; 중복
	private String licensePlate; //번호판
	private long booking; //예약 - 0 가능, 1 불가
	private String consumerId; //예약자 아이디
	
	
	//차량 옵션
	//carNo 중복
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
//	private List<CarOptionVO> carOptionVO;
	
	
	//보험세부 내용
	//carNo 중복
	private long insuranceNo;
	private String category; //일반자차,고급자차
	private Long insurancePrice; //보험금
	private Long insuranceAge; //보험가입 가능 나이
	private Long insuranceExperience; //보험가입 가능 운전경력
	private Long compensation; //보상 한도(숫자로만)
	private String customerCharge; //사고시 고객 부담금
	
	//fileUpload
//	private Long carInfoNo;// 변경
	private String orgFileName;//처음 파일 제목
	private String fileName; //중복으로 인해 변환된 파일 이름
	private String realSavePath;
	private String fileType; // 이미지인지 확인
}
