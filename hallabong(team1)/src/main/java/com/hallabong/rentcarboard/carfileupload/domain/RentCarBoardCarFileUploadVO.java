package com.hallabong.rentcarboard.carfileupload.domain;

import lombok.Data;

@Data
public class RentCarBoardCarFileUploadVO {
	//fileUpload
	private Long uploadNo;
	private Long carInfoNo;//차번호 -> 바뀜
	private String orgFileName;//처음 파일 제목
	private String fileName; //중복으로 인해 변환된 파일 이름
	private String realSavePath;
	private Long fileSize;
	
	
	private String fileType;
}
