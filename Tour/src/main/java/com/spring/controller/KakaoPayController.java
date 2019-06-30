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
		log.info("grade : " + mv.getGrade());
		
		if(point <= 11999) {
			  
			mv.setGrade("Silver");
			mv.setCoupon(0);
		} else {
			
			if(mv.getGrade().equals("VIP")) {
				log.info("VIP zone"); 
				mv.setCoupon(mv.getCoupon());
			} else {
				log.info("no VIP");
				mv.setCoupon(7);
			} 
			
			mv.setGrade("VIP");		
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
	
	
	@GetMapping("/couponPay") 
	@ResponseBody
	public String couponPay(PaymentVO vo) {
		
		service.couponPay(vo);
		return "clear";
	}
	 
	@GetMapping("/getPay") 
	@ResponseBody
	public List<PaymentVO> get(String idx) {
		
		List<PaymentVO> list = service.getPay(idx);	  
		return list;
	}
	
	@GetMapping("/removeCoupon")
	@ResponseBody
	public String removeCoupon(int idx, int people) {
			
		MemberVO vo = memberService.getPoint(idx);
		int coupon = vo.getCoupon() - people;
		
		MemberVO mv = new MemberVO();
		mv.setIdx(idx);
		mv.setCoupon(coupon);
		 
		memberService.removeCoupon(mv); 
		return "done"; 
	}
	

}
