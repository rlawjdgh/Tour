package com.spring.service;

import java.util.List;

import com.spring.domain.LocationVO;

public interface LocationService {

	public List<LocationVO> select(int areaIdx);
	public LocationVO findLocation(LocationVO vo); 
	public int addLocation(LocationVO vo);
	

}
