package com.spring.mapper;

import com.spring.domain.MemberVO;

public interface MemberMapper {
	
	public int registMember(MemberVO vo);
	public MemberVO checkId(String id);
	
}
