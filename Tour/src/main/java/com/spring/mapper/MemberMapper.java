package com.spring.mapper;

import com.spring.domain.MemberVO;

public interface MemberMapper {
	
	public int registMember(MemberVO vo);
	public MemberVO checkId(String id);
	public int registEmail(MemberVO vo);
	public MemberVO getIdx(String email);
	public int updateAuthKey(MemberVO vo);
	public MemberVO checkEmail(String email); // 중복체크
	public int updateAuthstatus(MemberVO vo);
	public MemberVO getPoint(int idx);
	public int setPoint(MemberVO vo);
	
}
 