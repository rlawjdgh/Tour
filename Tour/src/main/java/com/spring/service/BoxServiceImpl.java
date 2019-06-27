package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoxVO;
import com.spring.mapper.BoxMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("box")
public class BoxServiceImpl implements BoxService{
	
	@Autowired
	private BoxMapper mapper;

	@Override
	public List<BoxVO> select(int locIdx) {
		return mapper.select(locIdx);
	}

	@Override
	public List<BoxVO> selectIdx(int idx) {
		return mapper.selectIdx(idx);
	}

	@Override
	public int addBox(BoxVO vo) {
		return mapper.addBox(vo);
	}

	@Override
	public BoxVO findBox(BoxVO vo) {
		return mapper.findBox(vo);
	}

}
