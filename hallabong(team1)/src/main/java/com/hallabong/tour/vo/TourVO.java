package com.hallabong.tour.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TourVO {
	
	private long no;
	private String id;
	private int area, theme;
	private String areaName, themeName;
	private String name;
	private String address;
	private String content;
	private String tel;
	private String hours;
	private String roadMap;
	private String myLiked;
	private int likeCnt;
	// 첨부 되어서 올라오는 파일 -> input tag의 name="imageFile" 맞춰줘야 한다.
	private MultipartFile imageFile;
	// DB에 저장된 첨부파일명
	private String thumbnail;
	// 삭제할 이미지 파일명을 전달 받아서 처리(delete)
	private String deleteName;
	// 게시판 첨부파일들 정보
	private List<TourAttachVO> attachList;

}
