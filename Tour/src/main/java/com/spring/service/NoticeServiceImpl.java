package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.NoticeVO;
import com.spring.mapper.NoticeMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("notice")
public class NoticeServiceImpl implements NoticetService {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public int insert(NoticeVO vo) {
		return mapper.insert(vo);
	}
 
}
