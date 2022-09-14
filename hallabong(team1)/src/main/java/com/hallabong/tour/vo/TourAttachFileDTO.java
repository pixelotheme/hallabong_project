package com.hallabong.tour.vo;

import lombok.Data;

/**
 * <strong>AttachFileDTO</strong><br/>
 * <p>
 * 첨부 파일 한 개를 저장하기 위한 객체<br/>
 * <ul>
 * 	<li>fileName - uuid가 포함되지 않은 순수 파일명</li>
 * 	<li>uploadPath - 기본 폴더는 제외한 날짜 폴더만 저장</li>
 * 	<li>uuid</li>
 * 	<li>image - boolean</li>
 * </ul>
 * </p>
 * @author EZEN
 * 
 */
@Data
public class TourAttachFileDTO {
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	
}
