package com.spring.service;

import java.util.List;

import com.spring.domain.MovieReplyVO;

public interface MovieReplyService {
	public List<MovieReplyVO> getReplies(String movieNm);
	public int getTotal();
	public List<MovieReplyVO> getRepliesPaging(int nowPage, String movieNm);
	public int insertReply(String movieNm, String writer, String reply);
}
