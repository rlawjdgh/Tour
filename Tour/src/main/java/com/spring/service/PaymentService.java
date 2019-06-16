package com.spring.service;

import java.util.List;

import com.spring.domain.PaymentVO;
import com.spring.domain.ReadSeatVO;

public interface PaymentService {
	
	public int insertPay(PaymentVO vo);
	public List<PaymentVO> select(ReadSeatVO vo);
	public List<PaymentVO> getTicket(int nowPage, int memberIdx);
	public int getTotal();

}
