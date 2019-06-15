package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.MemberVO;
import com.spring.domain.PaymentVO;
import com.spring.domain.ReadSeatVO;
import com.spring.service.MemberService;
import com.spring.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class KakaoPayController {

	
	@Autowired
	private PaymentService service;
	@Autowired
	private MemberService memberService;
	
	@PostMapping("/kakaoPay")
	@ResponseBody
	public String kakaoPay(@ModelAttribute("PaymentVO") PaymentVO vo) {
		
		MemberVO mv = memberService.getPoint(vo.getMemberIdx());
		
		int memberIdx = vo.getMemberIdx();
		int point = mv.getPoint() + (vo.getPrice() * 10 / 100); 
		
		
		if(point >= 12000) {
			mv.setGrade("VIP");
		} else {
			mv.setGrade("Silver"); 
		}
		mv.setIdx(memberIdx);  
		mv.setPoint(point);  
		
		memberService.setPoint(mv);
		service.insertPay(vo); 
		
		return null;
	}
	
	@GetMapping("/ready_seat")
	@ResponseBody
	public List<PaymentVO> ready_seat(@ModelAttribute("ReadSeatVO") ReadSeatVO vo) {
		
		List<PaymentVO> select = service.select(vo);
		return select;
	}

}
