package com.spring.mapper;

import java.util.List;


import com.spring.domain.LocationVO;

public interface LocationMapper {

	public List<LocationVO> select(int areaIdx);
	public LocationVO findLocation(LocationVO vo);
	public int addLocation(LocationVO vo);

}
