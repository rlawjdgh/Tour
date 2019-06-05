package com.spring.domain;

import lombok.Data;

@Data 
public class PaymentVO {
	
	private String idx;
	private int memberIdx;
	private int boxIdx;
	private String day;
	private String movieNm;
	private String seatNum;
	private int price;
	private String regdate;
	
}
