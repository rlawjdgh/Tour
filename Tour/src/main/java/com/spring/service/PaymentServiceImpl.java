package com.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Common;
import com.spring.domain.PaymentVO;
import com.spring.domain.ReadSeatVO;
import com.spring.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("payment")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentMapper mapper;

	@Override
	public int insertPay(PaymentVO vo) {
		return mapper.insertPay(vo);
	}

	@Override
	public List<PaymentVO> select(ReadSeatVO vo) {
		return mapper.select(vo);
	}

	@Override
	public List<PaymentVO> getTicket(int nowPage, int memberIdx) {
		
		//한 페이지에 표시되는 게시물의 시작과 끝번호를 계산
		int start = (nowPage -1) * Common.Reply.BLOCKLIST + 1;	//nowpage(쪽)가 1이면 0 * 10 + 1 = 1
		int end = start + Common.Reply.BLOCKLIST -1;	//1 + 10 -1 = 10 
		//>>>1~10번 게시물이 표시
		//start와 end를 map으로 묶어서 이제 DB에 요청
		HashMap<String, Object> hash = new HashMap<>();
		hash.put("start", start);
		hash.put("end", end);
		hash.put("memberIdx", memberIdx);
				
		return mapper.getTicket(hash);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public int couponPay(PaymentVO vo) {
		return mapper.couponPay(vo);
	}

	@Override
	public List<PaymentVO> getPay(String idx) {
		return mapper.getPay(idx);
	}
 
}
