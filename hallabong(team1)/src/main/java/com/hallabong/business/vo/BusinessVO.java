package com.hallabong.business.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BusinessVO {

	private long no; // 사업장 (호텔) 번호 
	private String id; // 아이디
	private String area; // 사업장 이름
	private String name; // 사업장 이름
	private String content; // 소개글 
	private String bus_tel; // 전화번호 
	private String bus_mail; // 이메일
	private String bus_address; // 주소 
	private MultipartFile imageFile;

	

	// DB에 저장된 첨부파일명 -> image table의 컬럼 이름이 fileName : select ... fileName
	private String fileName;
	// 삭제할 이미지 파일명 전달 받아서처리ㅏ
	private String deleteName;
}
