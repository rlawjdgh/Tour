package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.domain.MovieVO;
import com.spring.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("member")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int registMember(MemberVO vo) {
		log.info("" + vo.getName());
		
		return mapper.registMember(vo);
	}

	@Override
	public MemberVO checkId(String id) {
		log.info(id);
		
		return mapper.checkId(id);
	}

}
