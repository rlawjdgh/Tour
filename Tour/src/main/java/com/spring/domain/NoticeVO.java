package com.spring.domain;

import lombok.Data;

@Data
public class NoticeVO {

	private int memberIdx;
	private String email;
	private String title;
	private String content;
	private int doen;
	private String regdate; 
}
