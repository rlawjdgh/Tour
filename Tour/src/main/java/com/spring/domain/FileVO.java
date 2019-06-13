package com.spring.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileVO { 

	private String movieNm;
	private String youtube;
	// 파일을 받기위한 객체
	private MultipartFile photo;
	private String filename;
}
   