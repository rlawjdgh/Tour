package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.UploadVO;
import com.spring.mapper.PaymentMapper;
import com.spring.mapper.UploadMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("upload")
public class UploadServiceImpl implements UploadService{
	
	@Autowired
	private UploadMapper mapper;
	
	@Override
	public int upload(UploadVO vo) {		
		return mapper.upload(vo);
	}

	@Override
	public UploadVO checkmovie(String movieNm) {
		return mapper.checkMovie(movieNm);
	}

	@Override
	public List<UploadVO> uploadOne(String movieNm) {
		return mapper.uploadOne(movieNm);
	}

}
