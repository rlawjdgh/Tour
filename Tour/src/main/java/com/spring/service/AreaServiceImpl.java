package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.AreaVO;
import com.spring.mapper.AreaMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("area")
public class AreaServiceImpl implements AreaService{

	@Autowired
	private AreaMapper mapper;

	@Override
	public List<AreaVO> getArea() {
		return mapper.getArea();
	}

	@Override
	public AreaVO findArea(AreaVO vo) {
		return mapper.findArea(vo); 
	}

	@Override
	public int addArea(AreaVO vo) {
		return mapper.addArea(vo);
	}

	
	
}
