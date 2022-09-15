package com.hallabong.diner.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class DinerVO {
	
	private long no;
	private String region, kind;
//	private String regionName, kindName;
	private String id;
	private String name;
	private String address;
//	private String foodType;
	private String price;
	private String tel;
	private String introduce;
	private String image;
	private String content;
	private String park;
	private String hours;
	private long hit;
	
	private MultipartFile imageFile;
	

}
