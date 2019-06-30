package com.spring.mapper;

import java.util.List;

import com.spring.domain.UploadVO;

public interface UploadMapper {

	public int upload(UploadVO vo);
	public UploadVO checkMovie(String movieNm);
	public List<UploadVO> uploadOne(String movieNm);
	public List<UploadVO> uploadSelect();
}
 