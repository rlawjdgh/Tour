package com.spring.domain;

import lombok.Data;

@Data
public class MovieVO {
	private String movieNm, director, people, genreNm;
	private int showTm, openDt; 

}
