package com.spring.service;

import com.spring.domain.MemberVO;

public interface MemberService {
	
	public int registMember(MemberVO vo);
	public MemberVO checkId(String checkId);

}
