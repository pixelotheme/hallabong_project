package com.hallabong.room.vo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RoomVO {

	private long ro_no;//숙박 (객실)번호 
	private Long no;  // 사업장 번호 
	//private Long no; 
	private String ro_name; // 객실 명 
	private String id; // 아이디
	private String ro_price; // 객실 가격
	private String ro_people; // 인원
	private String ro_info; // 객실 기본 정보
	private String ro_state; // 삭제 여부 (Y/N)
	private MultipartFile imageFile;
	// DB에 저장된 첨부파일명 -> image table의 컬럼 이름이 fileName : select ... fileName
	private String fileName;
	// 삭제할 이미지 파일명 전달 받아서
	private String deleteName;

}
