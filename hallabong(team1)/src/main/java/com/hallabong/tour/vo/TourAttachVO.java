package com.hallabong.tour.vo;

import lombok.Data;

@Data
public class TourAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long no;
	
}
