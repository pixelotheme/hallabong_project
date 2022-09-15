package com.hallabong.business.vo;

import lombok.Data;

@Data
public class BusinessAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; // image : true, no image : false
	
	private Long bno;
	
}
