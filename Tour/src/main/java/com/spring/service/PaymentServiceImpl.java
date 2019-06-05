package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.PaymentVO;
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
 
}
