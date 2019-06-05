package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.PaymentVO;
import com.spring.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller 
public class KakaoPayController {

	
	@Autowired
	private PaymentService service;
	
	@PostMapping("/kakaoPay")
	@ResponseBody
	public String kakaoPay(@ModelAttribute("PaymentVO") PaymentVO vo) {
		
		service.insertPay(vo);	
		return null;
	}

}
