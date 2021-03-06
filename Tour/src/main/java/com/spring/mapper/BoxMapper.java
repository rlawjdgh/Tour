package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoxVO;

public interface BoxMapper {

	public List<BoxVO> select(int locIdx);
	public List<BoxVO> selectIdx(int idx);
	public int addBox(BoxVO vo); 
	public BoxVO findBox(BoxVO vo); 
 
}
