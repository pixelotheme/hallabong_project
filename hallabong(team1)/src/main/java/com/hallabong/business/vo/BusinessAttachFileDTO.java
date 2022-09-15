package com.hallabong.business.vo;

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
public class BusinessAttachFileDTO {
	
	private String fileName; // 순수 파일명(uuid_ 가 포함.)
	private String uploadPath; // 저장 위치 - yyyy/MM/dd
	private String uuid; // uuid 문자열 - uuid_를 제거하면 업로드한 파일명이 나온다.
	private boolean image;
	
}
