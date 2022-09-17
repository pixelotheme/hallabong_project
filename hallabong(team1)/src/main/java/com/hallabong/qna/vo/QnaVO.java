package com.hallabong.qna.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {

	private Integer no;
	private String title;
	private String content; 
	private String id;
	private String name;
	private Date writeDate;
	private long cnt;
	private Integer refNo;
	private long ordNo;
	private long levNo;
	private Integer parentNo;
}
