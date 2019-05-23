package com.spring.service;

import java.util.List;

import com.spring.domain.MemberVO;
import com.spring.domain.MovieVO;

public interface MemberService {
	
	public int registMember(MemberVO vo);
	public MemberVO checkId(String checkId);

}
