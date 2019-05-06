package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MovieReplyVO {

	private int reNo;
	private String movieNm, reply, writer;
	private Date replyDate;
}
