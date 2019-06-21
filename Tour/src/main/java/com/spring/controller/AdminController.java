package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.MemberVO;
import com.spring.domain.NoticeVO;
import com.spring.service.MemberService;
import com.spring.service.NoticetService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private NoticetService noticeService;

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
		
		service.memberDelete(idx); 
		return "clear"; 
	}
	
	@RequestMapping("/adminNotice")
	public String adimNotice() {
		
		return "admin/adminNotice";
	}
	
	@RequestMapping("/adminGetNotice")
	@ResponseBody
	public List<NoticeVO> adminGetNotice() {
		
		List<NoticeVO> list = noticeService.selectAll(); 
		return list; 
	}
	
	@RequestMapping("/setAnswer")
	public String setAnswer(int idx, String email, String content, String title, Model model) {
		
		model.addAttribute("idx", idx);
		model.addAttribute("email", email);
		model.addAttribute("title", title); 		
		model.addAttribute("content", content);		 
		
		return "admin/setAnswer"; 
	}
	
	@RequestMapping("/answerEmail")
	@ResponseBody
	public String answerEmail(NoticeVO vo) throws Exception {
		
		noticeService.answerEmail(vo); 
		return "emailSuccess";
	}
	
} 
