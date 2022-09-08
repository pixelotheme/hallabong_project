package com.hallabong.room.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RoomVO {

	private int ro_no; //숙박 (객실)번호 
	private int bus_no; // 사업장 번호 
	private String ro_name; // 객실 명 
	private String ro_price; // 객실 가격
	private Date ro_date; // 등록일
	private Date ro_update; // 수정일
	private String ro_people; // 인원
	private String ro_state; // 삭제 여부 (Y/N)
	private MultipartFile roomimageFile;
	// DB에 저장된 첨부파일명 -> image table의 컬럼 이름이 fileName : select ... fileName
	private String fileName;
	private Date writeDate;
	// 삭제할 이미지 파일명 전달 받아서
	private String deleteName;

}
