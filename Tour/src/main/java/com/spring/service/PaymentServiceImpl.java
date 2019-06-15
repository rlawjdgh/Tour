package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<PaymentVO> getTicket(int memberIdx) {
		return mapper.getTicket(memberIdx);
	}
 
}
