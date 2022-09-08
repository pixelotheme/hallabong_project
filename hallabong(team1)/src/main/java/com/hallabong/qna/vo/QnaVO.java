package com.hallabong.qna.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {

	private long no;
	private String title;
	private String content; 
	private String id;
	private String name;
	private Date writeDate;
	private long cnt;
	private long refNo;
	private long ordNo;
	private long levNo;
	private long parentNo;
}
