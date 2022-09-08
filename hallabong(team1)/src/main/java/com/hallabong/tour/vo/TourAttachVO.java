package com.hallabong.tour.vo;

import lombok.Data;

@Data
public class TourAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; // image : true, no image : false
	
	private Long bno;
	
}
