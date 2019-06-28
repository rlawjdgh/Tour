package com.spring.service;

import java.util.List;

import com.spring.domain.AreaVO;

public interface AreaService {

	public List<AreaVO> getArea();
	public AreaVO findArea(AreaVO vo);
	public int addArea(AreaVO vo);
}
