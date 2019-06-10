package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	private MemberService service;

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
	public String registMember(MemberVO vo) {
		log.info("회원가입");
 
		if (vo.getGrade() == null) {
			vo.setGrade("Silver");
		}
		log.info("" + vo.getName()); 

		service.registMember(vo);

		return "redirect:memberlogin";
	}

	@RequestMapping("/check_id")
	@ResponseBody
	public String check_id(@ModelAttribute("checkId") String checkId) { 
		log.info("ID 중복체크"); 

		MemberVO vo = service.checkId(checkId);
		log.info("" + vo);

		String res = "no";
		if(vo == null) {
			res = "yes";
		}

		return res;
	}
	
	@PostMapping("/loginForm")
	@ResponseBody
	public String loginForm(@ModelAttribute("id") String id, @ModelAttribute("password") String password, HttpSession session) {
		log.info("로그인");
		
		MemberVO vo = service.checkId(id);
		
		String res = "clear";
		
		if (vo == null) {
			res = "no_id";
			return res;
		}
		if (!vo.getPassword().equals(password)) {
			res = "no_pw";
		}
		
		session.setAttribute("logon", vo);
		session.setMaxInactiveInterval(3600);
		
		return res;
	}
	
	@RequestMapping("/checkEmail")
	@ResponseBody
	public String checkemail(MemberVO vo) throws Exception {
		
		String str = "notexist";
		MemberVO check = service.checkEmail(vo.getEmail());
		if(check!=null) {
			if(check.getAuthstatus() == 1) {
				str = "exist";
			} else if(check.getAuthstatus() == 0) {
				str = "notyetauth";
			}
			return str;
		} else {
			service.checkMail(vo);
			return "requestCheckEmailSuccess";
		}
	}
	 
	@RequestMapping("/emailConfirm")
	public String emailConfirm(MemberVO vo, RedirectAttributes rttr) throws Exception {
		log.info("메일인증확인");
		vo.setAuthstatus(1);
		int result = service.updateAuthstatus(vo);
		
		return "member/emailConfirm"; 
	}
	
} 
