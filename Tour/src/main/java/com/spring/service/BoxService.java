package com.spring.service;

import java.util.List;

import com.spring.domain.BoxVO;

public interface BoxService {

	public List<BoxVO> select(int locIdx);
}
