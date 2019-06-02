package com.spring.domain;

import lombok.Data;

@Data
public class MovieDecideVO {

	private String movieNm;
	private String day;
	private String time;
	private String locName;
	private int boxNum;
	private int people;
	private String seatNum;
	private int price;
}
