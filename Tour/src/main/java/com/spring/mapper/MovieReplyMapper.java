package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.domain.MovieReplyVO;

public interface MovieReplyMapper {
	
	public List<MovieReplyVO> getReplys(String movieNm);
	public int getTotal();
	public List<MovieReplyVO> getRepliesPaging(HashMap<String, Object> hash);
	public int insertReply(HashMap<String, String> hash);
	
}
