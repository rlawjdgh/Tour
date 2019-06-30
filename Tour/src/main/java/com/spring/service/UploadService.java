package com.spring.service;

import java.util.List;

import com.spring.domain.UploadVO;

public interface UploadService {

	public int upload(UploadVO vo);
	public UploadVO checkmovie(String movieNm);
	public List<UploadVO> uploadOne(String movieNm);
	public List<UploadVO> uploadSelect();

}
  