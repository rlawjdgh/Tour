package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.domain.NoticeVO;

public interface NoticeMapper {
	
	public int insert(NoticeVO vo);
	public List<NoticeVO> getNotice(HashMap<String, Object> hash);
	public int getTotal();
}
 