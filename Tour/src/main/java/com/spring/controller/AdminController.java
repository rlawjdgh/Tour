package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Autowired
	private MemberService service;

	@RequestMapping("/adminMain")
	public String adminMain() {
		 
		return "admin/adminMain"; 
	} 
	
	@RequestMapping("/adminMovie")
	public String adminMovie(Model model, String movieCd, String movieNm) {
		
		model.addAttribute("movieCd", movieCd);
		model.addAttribute("movieNm", movieNm);
		
		return "admin/adminMovie"; 
	}
	
	@RequestMapping("/adminMemberInfo")
	public String memberInfo() {
		
		return "admin/adminMemberInfo";
	}
	

	@RequestMapping("/adminGetMember")
	@ResponseBody
	public List<MemberVO> adminGetMember() {
		
		List<MemberVO> list = service.selectAll(); 
		return list; 
	}
	
	@RequestMapping("/removeMember")
	@ResponseBody
	public String removeMember(int idx) {
		
		String msg = "clear"; 
		service.memberDelete(idx); 
		
		return msg; 
	}
}
