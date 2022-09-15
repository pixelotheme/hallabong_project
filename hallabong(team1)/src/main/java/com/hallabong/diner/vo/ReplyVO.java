package com.hallabong.diner.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private long rno;
	private long no;
	private long star;
	private String reply;
	private String id;
	private Date replyDate;
	private Date updateDate;
	
}
