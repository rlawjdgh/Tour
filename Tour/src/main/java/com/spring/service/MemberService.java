package com.spring.service;

import java.util.List;

import com.spring.domain.MemberVO;
import com.spring.domain.MovieVO;

public interface MemberService {
	
	public int registMember(MemberVO vo);
	public MemberVO checkId(String checkId);
	public MemberVO checkEmail(String email); // 이메일 중복체크 
	public void checkMail(MemberVO vo);
	public int updateAuthstatus(MemberVO vo);
}
