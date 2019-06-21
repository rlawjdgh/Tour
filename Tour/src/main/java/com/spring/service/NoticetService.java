package com.spring.service;

import java.util.List;

import com.spring.domain.NoticeVO;
import com.spring.domain.PaymentVO;

public interface NoticetService {
	
	public int insert(NoticeVO vo);
	public List<NoticeVO> getNotice(int nowPage, int memberIdx);
	public int getTotal();
	public List<NoticeVO> selectAll();
	public int answerEmail(NoticeVO vo);
} 
