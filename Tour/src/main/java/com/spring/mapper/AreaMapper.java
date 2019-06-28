package com.spring.mapper;

import java.util.List;

import com.spring.domain.AreaVO;

public interface AreaMapper {
	
	public List<AreaVO> getArea();
	public AreaVO findArea(AreaVO vo); 
	public int addArea(AreaVO vo);
	
}
