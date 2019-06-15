package com.spring.mapper;

import java.util.List;

import com.spring.domain.PaymentVO;
import com.spring.domain.ReadSeatVO;

public interface PaymentMapper {
	
	public int insertPay(PaymentVO vo);
	public List<PaymentVO> select(ReadSeatVO vo);
	public List<PaymentVO> getTicket(int memberIdx);

}
