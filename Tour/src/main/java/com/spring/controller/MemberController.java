package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@RequestMapping("/memberlogin")
	public String memberlogin() {
		log.info("로그인 화면 출력");
		
		return "member/memberlogin";
	}
	
	@RequestMapping("/memberInsert")
	public String memberInsert() {
		log.info("회원가입 페이지");
		
		return "member/memberInsert";
		
	}
	
	@PostMapping("/registMember")
	public String registMember() {
		log.info("회원가입");
		
		return "redirect:memberlogin";
	}

}
