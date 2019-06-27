package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.LocationVO;
import com.spring.mapper.LocationMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("location")
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationMapper mapper;

	@Override
	public List<LocationVO> select(int areaIdx) {
		return mapper.select(areaIdx);
	}

	@Override
	public LocationVO findLocation(LocationVO vo) {
		return mapper.findLocation(vo);
	}

	@Override
	public int addLocation(LocationVO vo) {
		return mapper.addLocation(vo);
	}

}
