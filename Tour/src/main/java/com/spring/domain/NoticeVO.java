package com.spring.domain;

import lombok.Data;

@Data
public class NoticeVO {

	private int idx;
	private int memberIdx;
	private String id;
	private String email;
	private String title;
	private String content;
	private String answer;
	private int done; 
	private String regdate; 
}
